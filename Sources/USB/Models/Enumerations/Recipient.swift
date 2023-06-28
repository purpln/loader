public enum Recipient: UInt8, Equatable, Hashable, CustomStringConvertible { //libusb_request_recipient
    case device = 0x00 //LIBUSB_RECIPIENT_DEVICE
    case interface = 0x01 //LIBUSB_RECIPIENT_INTERFACE
    case endpoint = 0x02 //LIBUSB_RECIPIENT_ENDPOINT
    case other = 0x03 //LIBUSB_RECIPIENT_OTHER
    //4...31 reserved
    
    public var description: String {
        switch self {
        case .device: return "device"
        case .interface: return "interface"
        case .endpoint: return "endpoint"
        case .other: return "other"
        }
    }
}
