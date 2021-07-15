//
//  AuthRouter.swift
//  Pommel
//
//  Created by Mahesh Yakami on 7/15/21.
//

import Framework

enum AuthRouter: NetworkingRouter {
    
    case register(Parameters)
    case login(Parameters)
    case resetPassword(Parameters)
    case setPassword(Parameters)
    case changePassword(Parameters)
    case forgotPassword(Parameters)
    case logout(Parameters)
    case addUpdateDeviceInfo(Parameters)
    case getPage(Parameters)
    
    public var httpMethod: RequestMethod {
        switch self {
        case .login, .register, .resetPassword, .setPassword, .forgotPassword, .logout, .addUpdateDeviceInfo, .changePassword :
            return .post
        case .getPage:
            return .get
        }
    }
    
    public var path: String {
        switch self {
        case .login:
            return "user/login"
        case .register:
            return "user"
        case .resetPassword:
            return "user/resetPassword"
        case .setPassword:
            return "user/setPassword"
        case .changePassword:
            return "user/changePassword"
        case .forgotPassword:
            return "user/forgotPassword"
        case .logout:
            return "user/logout"
        case .addUpdateDeviceInfo:
            return "user/addUpdateDeviceInfo"
        case .getPage:
            return "page/findWithSlug"
        }
    }
    
    public var needTokenValidation: Bool {
        switch self {
        case .login, .register, .forgotPassword, .resetPassword, .getPage:
            return false
        case .addUpdateDeviceInfo, .logout, .setPassword, .changePassword:
            return true
        }
    }
    
    public var encoders: [RequestEncoder] {
        switch self {
        case .login(let parameters), .register(let parameters), .forgotPassword(let parameters), .logout(let parameters), .setPassword(let parameters), .resetPassword(let parameters), .addUpdateDeviceInfo(let parameters), .changePassword(let parameters) :
            return [.json(parameters)]
        case .getPage(let parameters):
            return [.query(parameters)]
        }
    }
}
