//
//  Generated file. Do not edit.
//

// clang-format off

#import "GeneratedPluginRegistrant.h"

#if __has_include(<flutter_native_contact_picker/FlutterNativeContactPickerPlugin.h>)
#import <flutter_native_contact_picker/FlutterNativeContactPickerPlugin.h>
#else
@import flutter_native_contact_picker;
#endif

#if __has_include(<flutter_phone_direct_caller/FlutterPhoneDirectCallerPlugin.h>)
#import <flutter_phone_direct_caller/FlutterPhoneDirectCallerPlugin.h>
#else
@import flutter_phone_direct_caller;
#endif

#if __has_include(<isar_flutter_libs/IsarFlutterLibsPlugin.h>)
#import <isar_flutter_libs/IsarFlutterLibsPlugin.h>
#else
@import isar_flutter_libs;
#endif

#if __has_include(<path_provider_foundation/PathProviderPlugin.h>)
#import <path_provider_foundation/PathProviderPlugin.h>
#else
@import path_provider_foundation;
#endif

@implementation GeneratedPluginRegistrant

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {
  [FlutterNativeContactPickerPlugin registerWithRegistrar:[registry registrarForPlugin:@"FlutterNativeContactPickerPlugin"]];
  [FlutterPhoneDirectCallerPlugin registerWithRegistrar:[registry registrarForPlugin:@"FlutterPhoneDirectCallerPlugin"]];
  [IsarFlutterLibsPlugin registerWithRegistrar:[registry registrarForPlugin:@"IsarFlutterLibsPlugin"]];
  [PathProviderPlugin registerWithRegistrar:[registry registrarForPlugin:@"PathProviderPlugin"]];
}

@end
