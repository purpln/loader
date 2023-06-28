internal enum Descriptor: UInt8, Equatable, Hashable, CustomStringConvertible { //libusb_descriptor_type
    case device = 0x01 //LIBUSB_DT_DEVICE
    case config = 0x02 //LIBUSB_DT_CONFIG
    case string = 0x03 //LIBUSB_DT_STRING
    case interface = 0x04 //LIBUSB_DT_INTERFACE
    case endpoint = 0x05 //LIBUSB_DT_ENDPOINT
    case bos = 0x0f //LIBUSB_DT_BOS
    case capability = 0x10 //LIBUSB_DT_DEVICE_CAPABILITY [deviceCapability]
    case hid = 0x21 //LIBUSB_DT_HID
    case report = 0x22 //LIBUSB_DT_REPORT
    case physical = 0x23 //LIBUSB_DT_PHYSICAL
    case hub = 0x29 //LIBUSB_DT_HUB
    case superspeed = 0x2a //LIBUSB_DT_SUPERSPEED_HUB [superspeedHub]
    case companion = 0x30 //LIBUSB_DT_SS_ENDPOINT_COMPANION [ssEndpointCompanion]
    
    public var description: String {
        switch self {
        case .device: return "device"
        case .config: return "config"
        case .string: return "string"
        case .interface: return "interface"
        case .endpoint: return "endpoint"
        case .bos: return "bos"
        case .capability: return "device capability"
        case .hid: return "hid"
        case .report: return "report"
        case .physical: return "physical"
        case .hub: return "hub"
        case .superspeed: return "superspeed hub"
        case .companion: return "ss endpoint companion"
        }
    }
}
