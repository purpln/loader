public enum Class: UInt32, Equatable, Hashable, CustomStringConvertible { //libusb_class_code
    case perInterface = 0x00 //LIBUSB_CLASS_PER_INTERFACE
    case audio = 0x01 //LIBUSB_CLASS_AUDIO
    case comm = 0x02 //LIBUSB_CLASS_COMM
    case hid = 0x03 //LIBUSB_CLASS_HID
    case physical = 0x05 //LIBUSB_CLASS_PHYSICAL
    case image = 0x06 //LIBUSB_CLASS_IMAGE
    //LIBUSB_CLASS_PTP //legacy
    case printer = 0x07 //LIBUSB_CLASS_PRINTER
    case storage = 0x08 //LIBUSB_CLASS_MASS_STORAGE
    case hub = 0x09 //LIBUSB_CLASS_HUB
    case data = 0x0a //LIBUSB_CLASS_DATA
    case card = 0x0b //LIBUSB_CLASS_SMART_CARD
    case security = 0x0d //LIBUSB_CLASS_CONTENT_SECURITY
    case video = 0x0e //LIBUSB_CLASS_VIDEO
    case healthcare = 0x0f //LIBUSB_CLASS_PERSONAL_HEALTHCARE
    case diagnostic = 0xdc //LIBUSB_CLASS_DIAGNOSTIC_DEVICE
    case wireless = 0xe0 //LIBUSB_CLASS_WIRELESS
    case miscellaneous = 0xef //LIBUSB_CLASS_MISCELLANEOUS
    case application = 0xfe //LIBUSB_CLASS_APPLICATION
    case vendor = 0xff //LIBUSB_CLASS_VENDOR_SPEC
    
    public var description: String {
        switch self {
        case .perInterface: return "per interface"
        case .audio:  return "audio"
        case .comm:  return "comm"
        case .hid:  return "hid"
        case .physical:  return "physical"
        case .image:  return "image"
        case .printer:  return "printer"
        case .storage:  return "mass storage"
        case .hub:  return "hub"
        case .data:  return "data"
        case .card:  return "smart card"
        case .security:  return "content security"
        case .video:  return "video"
        case .healthcare:  return "personal healthcare"
        case .diagnostic:  return "diagnostic device"
        case .wireless:  return "wireless"
        case .miscellaneous:  return "miscellaneous"
        case .application:  return "application"
        case .vendor:  return "vendor spec"
        }
    }
}
