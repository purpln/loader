public enum Standard: UInt32, Equatable, Hashable, CustomStringConvertible { //libusb_standard_request
    case getStatus = 0x00 //LIBUSB_REQUEST_GET_STATUS
    case clearFeature = 0x01 //LIBUSB_REQUEST_CLEAR_FEATURE
    //0x02 reserved
    case setFeature = 0x03 //LIBUSB_REQUEST_SET_FEATURE
    //0x04 reserved
    case setAddress = 0x05 //LIBUSB_REQUEST_SET_ADDRESS
    case getDescriptor = 0x06 //LIBUSB_REQUEST_GET_DESCRIPTOR
    case setDescriptor = 0x07 //LIBUSB_REQUEST_SET_DESCRIPTOR
    case getConfiguration = 0x08 //LIBUSB_REQUEST_GET_CONFIGURATION
    case setConfiguration = 0x09 //LIBUSB_REQUEST_SET_CONFIGURATION
    case getInterface = 0x0a //LIBUSB_REQUEST_GET_INTERFACE
    case setInterface = 0x0b //LIBUSB_REQUEST_SET_INTERFACE
    case synchFrame = 0x0c //LIBUSB_REQUEST_SYNCH_FRAME
    case setSel = 0x30 //LIBUSB_REQUEST_SET_SEL
    case isochDelay = 0x31 //LIBUSB_SET_ISOCH_DELAY
    
    public var description: String {
        switch self {
        case .getStatus: return "get status"
        case .clearFeature: return "clear feature"
        case .setFeature: return "set feature"
        case .setAddress: return "set address"
        case .getDescriptor: return "get descriptor"
        case .setDescriptor: return "set descriptor"
        case .getConfiguration: return "get configuration"
        case .setConfiguration: return "set configuration"
        case .getInterface: return "get interface"
        case .setInterface: return "set interface"
        case .synchFrame: return "synch frame"
        case .setSel: return "set sel"
        case .isochDelay: return "isoch delay"
        }
    }
}
