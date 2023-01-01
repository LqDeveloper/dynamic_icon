#import "DynamicIconPlugin.h"
#if __has_include(<dynamic_icon/dynamic_icon-Swift.h>)
#import <dynamic_icon/dynamic_icon-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "dynamic_icon-Swift.h"
#endif

@implementation DynamicIconPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftDynamicIconPlugin registerWithRegistrar:registrar];
}
@end
