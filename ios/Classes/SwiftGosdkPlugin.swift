import Flutter
import UIKit
// import Greeting


public class SwiftGosdkPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "gosdk", binaryMessenger: registrar.messenger())
    let instance = SwiftGosdkPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {

    switch call.method {
        case "getSayHi":
            let arguments = call.arguments as? [String: Any] ?? [String: Any]()
            result("iOS " + UIDevice.current.systemVersion)
//             result(GreetingSayHi(arguments["text"] as! String))
        default:
            result("iOS " + UIDevice.current.systemVersion)
    }
  }
}
