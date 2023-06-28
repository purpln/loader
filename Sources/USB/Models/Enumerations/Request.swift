public enum Request: UInt32, Equatable, Hashable, CustomStringConvertible { //libusb_request_type
    case standard = 0x00 //LIBUSB_REQUEST_TYPE_STANDARD
    case `class` = 0x20 //LIBUSB_REQUEST_TYPE_CLASS
    case vendor = 0x40 //LIBUSB_REQUEST_TYPE_VENDOR
    case reserved = 0x60 //LIBUSB_REQUEST_TYPE_RESERVED
    
    public var description: String {
        switch self {
        case .standard: return "standard"
        case .class: return "class"
        case .vendor: return "vendor"
        case .reserved: return "reserved"
        }
    }
}
