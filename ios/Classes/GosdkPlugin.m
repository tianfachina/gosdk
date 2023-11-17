#import "GosdkPlugin.h"
#if __has_include(<gosdk/gosdk-Swift.h>)
#import <gosdk/gosdk-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "gosdk-Swift.h"
#endif

@implementation GosdkPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftGosdkPlugin registerWithRegistrar:registrar];
}
@end
