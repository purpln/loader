import Architecture
import USB
import File

struct Service: Scene {
    func execute() async {
        repeat {
            guard let string = readLine() else { continue }
            _ = string
            do {
                try await scan(path: "/Users/purpln/Desktop/blink.hex")
            } catch {
                print("error:", error)
            }
        } while true
    }
    
    func scan(path: String) async throws {
        let service = USB()
        
        let devices = try service.devices()
        
        guard var device = devices.first(where: \.teensy) else {
            throw Fault.failure("no teensy")
        }
        
        information(device: device)
        
        try await connect(device: &device) { device in
            
            let interface = device.configurations[0].interfaces[0]
            
            try await connect(device: device, interface: interface) { interface in
                do {
                    var bytes = [UInt8](repeating: 0, count: 1024) //[0x72, 0x65, 0x62, 0x6f, 0x6f, 0x74] //reboot
                    bytes[0] = 0xff
                    bytes[1] = 0xff
                    bytes[2] = 0xff
                    try await device.write(bytes: &bytes) { progress in
                        
                    }
                } catch {
                    try device.reset()
                    do {
                        var bytes = [UInt8](repeating: 0, count: 1024) //[0x72, 0x65, 0x62, 0x6f, 0x6f, 0x74] //reboot
                        bytes[0] = 0xff
                        bytes[1] = 0xff
                        bytes[2] = 0xff
                        try await device.write(bytes: &bytes) { progress in
                            
                        }
                    } catch {
                        try device.reset()
                        print("error:", error)
                    }
                    print("error:", error)
                }
            }
            
            /*
            guard let file = File(path: path, mode: .readOnly) else {
                throw Fault.failure("read hex error")
            }
            let bytes = file.read()
            print("bytes", bytes.count)
             */
        }
    }
    
    func information(device: Device) {
        print(device)
        /*
        print("speed", device.speed() ?? "nil")
        let port = try? device.port()
        print("port", port ?? "nil")
        print("address", device.address())
        let size = try? device.maxPacketSize(endpoint: 0x84)
        print("max packet size", size ?? "nil")
        */
    }
    
    func connect(device: inout Device, closure: (Device) async throws -> Void) async throws {
        try device.open()
        defer {
            do {
                try device.close()
            } catch { }
        }
        try await closure(device)
    }
    
    func connect(device: Device, interface: Interface, closure: (Interface) async throws -> Void) async throws {
        let active = try device.kernel(interface: Int32(interface.number))
        if active {
            try device.detach(interface: Int32(interface.number))
        }
        defer {
            if active {
                do {
                    try device.attach(interface: Int32(interface.number))
                } catch { }
            }
        }
        try device.claim(interface: Int32(interface.number))
        defer {
            do {
                try device.release(interface: Int32(interface.number))
            } catch { }
        }
        try await closure(interface)
    }
}

extension Device {
    var teensy: Bool { vendor == 0x16c0 && product == 0x0478 }
}

extension UInt8 {
    var string: String {
        bits().map { bit in bit ? "1" : "0" } .reversed() .joined()
    }
    
    public func bits() -> [Bool] {
        var byte = self
        var bits = [Bool](repeating: false, count: 8)
        for i in 0..<8 {
            let currentBit = byte & 0x01
            if currentBit != 0 {
                bits[i] = true
            }
            byte >>= 1
        }
        return bits
    }
}
