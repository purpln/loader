import clibusb

private func wrap(handle: OpaquePointer?, closure: (OpaquePointer) -> Int32) throws {
    guard let handle = handle else {
        print("no handle")
        throw Error.other
    }
    try execute {
        closure(handle)
    }
}

extension Device {
    public func write(bytes: inout [UInt8], progress: ((Double) -> Void)? = nil) async throws {
        //let code: Int32 = 8126464
        //let block: Int32 = 1024
        var timeout: UInt32 = 1000
        /*
        var type: UInt8 = 0b00000000
        
        let request: Request = .standard
        let recipient: Recipient = .device
        let direction: Direction = .in
        
        type = type &+ UInt8(request.rawValue)
        type = type &+ UInt8(recipient.rawValue)
        type = type &+ UInt8(direction.rawValue)
        */
        
        let byte = LIBUSB_REQUEST_TYPE_VENDOR.rawValue | LIBUSB_RECIPIENT_DEVICE.rawValue | LIBUSB_ENDPOINT_OUT.rawValue
        
        print(String(byte, radix: 16, uppercase: false))
        
        let type: Int = 0x21
        let request: Int = 0x09
        let value: Int = 0x0200
        let index: Int = 0x00
        
        while timeout > 0 {
            try controlTransfer(type: UInt8(type), request: UInt8(request), value: UInt16(value), index: UInt16(index), bytes: &bytes, length: UInt16(bytes.count), timeout: timeout)
            try await Task.sleep(nanoseconds: 1)
            timeout -= 1
        }
    }
    
    public func controlTransfer(type: UInt8, request: UInt8, value: UInt16, index: UInt16, bytes: inout [UInt8], length: UInt16, timeout: UInt32) throws {
        try wrap(handle: handle) { handle in
            libusb_control_transfer(handle, type, request, value, index, &bytes, length, timeout)
        }
    }
}
