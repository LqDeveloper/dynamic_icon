import Flutter
import UIKit

public class SwiftDynamicIconPlugin: NSObject, FlutterPlugin {
    var iconList:[String] = []
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "dynamic_icon", binaryMessenger: registrar.messenger())
        let instance = SwiftDynamicIconPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if(call.method == "setupAppIcon"){
            if let iconName = call.arguments as? String {
                if(iconList.contains(iconName)){
                    setAppIcon(iconName: iconName)
                    result(true)
                }else{
                    result(false)
                }
            }else{
                result(false)
            }
        }else if(call.method == "setupIconList"){
            iconList = (call.arguments as? [String]) ?? []
            result("设置成功了")
        }
    }
    
    func setAppIcon(iconName:String){
        if(iconName == "default"){
            UIApplication.shared.setAlternateIconName(nil, completionHandler: nil)
        }else{
            UIApplication.shared.setAlternateIconName(iconName) { _ in }
        }
    }
    
}


