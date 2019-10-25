#import "FlutterDerivApiPlugin.h"
#import <flutter_deriv_api/flutter_deriv_api-Swift.h>

@implementation FlutterDerivApiPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterDerivApiPlugin registerWithRegistrar:registrar];
}
@end
