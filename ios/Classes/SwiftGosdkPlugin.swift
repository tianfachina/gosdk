import Flutter
import UIKit
import Xhsbeian


public class SwiftGosdkPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "gosdk", binaryMessenger: registrar.messenger())
    let instance = SwiftGosdkPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {

    switch call.method {
        case "sendCode":
            let arguments = call.arguments as? [String: Any] ?? [String: Any]()
            result(XhsbeianSendCode(arguments["text"] as! String))
        case "login":
            let arguments = call.arguments as? [String: Any] ?? [String: Any]()
            let name = arguments["name"] as! String
            let department = arguments["department"] as! String
            let phone = arguments["phone"] as! String
            let code = arguments["code"] as! String
            result(XhsbeianLogin(name,department,phone,code))
        default:
            result("iOS " + UIDevice.current.systemVersion)
    }
  }
}
