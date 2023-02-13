#import "MGTTJDeviceInfo.h"
#import "MGTTJKeyClain.h"
#import <objc/runtime.h>
#import <sys/sysctl.h>
#import <mach/mach.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import <CoreTelephony/CTCarrier.h>
#import <SystemConfiguration/CaptiveNetwork.h>
#import <sys/mount.h>
#import <sys/utsname.h>
#import <CommonCrypto/CommonDigest.h>
#import <AdSupport/AdSupport.h>
#import <AppTrackingTransparency/ATTrackingManager.h>
#import "MGTTJKeyClain.h"
#define kDeviceIdentifier @"deviceIdentifier"
#define SuppressPerformSelectorLeakWarning(Stuff) \
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
Stuff; \
_Pragma("clang diagnostic pop") \
} while (0)
@implementation MGTTJDeviceInfo
+ (NSString *)mgttj_getAppVersionData_mgttj
{
    NSBundle *currentBundle = [NSBundle mainBundle];
    NSDictionary *infoDictionary = [currentBundle infoDictionary];
    return [infoDictionary objectForKey:@"CFBundleShortVersionString"];
}
+ (NSString *)mgttj_getAppBundleVersionData_mgttj
{
    NSBundle *currentBundle = [NSBundle mainBundle];
    NSDictionary *infoDictionary = [currentBundle infoDictionary];
    return [infoDictionary objectForKey:@"CFBundleVersion"];
}
+ (NSString *)mgttj_getAppPackageNameData_mgttj
{
    NSBundle *currentBundle = [NSBundle mainBundle];
    NSDictionary *infoDictionary = [currentBundle infoDictionary];
    return [infoDictionary objectForKey:@"CFBundleIdentifier"];
}
+ (NSString *)mgttj_getAppNameFunc_mgttj
{
    NSBundle *currentBundle = [NSBundle mainBundle];
    NSDictionary *infoDictionary = [currentBundle infoDictionary];
    return [infoDictionary objectForKey:@"CFBundleDisplayName"];
}
+ (NSString *)mgttj_getAppIDFAData_mgttj
{
    __block NSString *idfa = @"";
    if (@available(iOS 14.5, *)) {
        [ATTrackingManager requestTrackingAuthorizationWithCompletionHandler:^(ATTrackingManagerAuthorizationStatus status) {
            if (status == ATTrackingManagerAuthorizationStatusAuthorized) {
                idfa = [[ASIdentifierManager sharedManager].advertisingIdentifier UUIDString];
            } else {
                NSLog(@"请在设置-隐私-跟踪中允许App请求跟踪");
                idfa = @"00000000-0000-0000-0000-000000000000";
            }
        }];
    }else {
        idfa = [[ASIdentifierManager sharedManager].advertisingIdentifier UUIDString];
    }
    return idfa;
}
+ (NSString *)mgttj_getUniqueIDData_mgttj {
    BOOL isEmpty = [[[MGTTJDeviceInfo mgttj_getAppIDFAData_mgttj] stringByReplacingOccurrencesOfString:@"-" withString:@""] stringByReplacingOccurrencesOfString:@"0" withString:@""].length;
    if (!isEmpty) {
        return [MGTTJDeviceInfo mgttj_getAppUUIDData_mgttj];
    }
    return [MGTTJDeviceInfo mgttj_getAppIDFAData_mgttj];
}
+ (NSString *)mgttj_getAppUUIDData_mgttj {
    NSString * deviceIdentifier = [MGTTJKeyClain mgttj_hardMacarthurUbiquitarian_mgttj:kDeviceIdentifier andServiceName:[[NSBundle mainBundle] bundleIdentifier] error:nil];
    if (deviceIdentifier) {
        return deviceIdentifier;
    }
    deviceIdentifier = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    [MGTTJKeyClain mgttj_adlThreadUbi_mgttj:kDeviceIdentifier andPassword:deviceIdentifier forServiceName:[[NSBundle mainBundle]bundleIdentifier] updateExisting:NO error:nil];
    return deviceIdentifier;
}
+ (NSString *)mgttj_getDeviceNameData_mgttj
{
    NSString *datas =[UIDevice currentDevice].model;
    return datas;
}
+ (NSString *)mgttj_getDeviceOSData_mgttj
{
    NSString *datas =[[UIDevice currentDevice] systemVersion];
    return datas;
}
+ (NSString *)mgttj_base64EncodeString_mgttj_:(NSString *)string
{
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    return [data base64EncodedStringWithOptions:0];
}
+ (NSString *)mgttj_forwardingBug_mgttj:(NSString *)base64
{
    NSData *nsdataFromBase64String = [[NSData alloc]initWithBase64EncodedString:base64 options:0];
    NSString *base64Decoded = [[NSString alloc]initWithData:nsdataFromBase64String encoding:NSUTF8StringEncoding];
    return base64Decoded;
}
+ (NSString *)mgttj_getCurrentTimeData_mgttj{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    [formatter setTimeZone:timeZone];
    NSDate *datenow = [NSDate date];
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[datenow timeIntervalSince1970]];
    return timeSp;
}
+ (NSString *)mgttj_labarumSearchFun_mgttj{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    NSDate *datenow = [NSDate date];
    NSString *currentTimeString = [formatter stringFromDate:datenow];
    return currentTimeString;
}
+(NSString *)mgttj_getAppLanguageData_mgttj {
    NSArray *languages = [NSLocale preferredLanguages];
    NSString *currentLanguage = [languages objectAtIndex:0];
    return currentLanguage;
}
+(NSString *)mgttj_getAppLocalData_mgttj {
    NSLocale *currentLocale = [NSLocale currentLocale];
    return [currentLocale objectForKey:NSLocaleCountryCode];
}
+(NSString *)mgttj_getAppTimeZoneData_mgttj {
    NSTimeZone *zone = [NSTimeZone localTimeZone];
    return [zone name];
}
+ (double)mgttj_getAppMemoryFreeData_mgttj
{
    vm_statistics_data_t vmStats;
    mach_msg_type_number_t infoCount = HOST_VM_INFO_COUNT;
    kern_return_t kernReturn = host_statistics(mach_host_self(),
                                               HOST_VM_INFO,
                                               (host_info_t)&vmStats,
                                               &infoCount);
    
    if (kernReturn != KERN_SUCCESS) {
        return NSNotFound;
    }
    
    return ((vm_page_size * vmStats.free_count) / 1024.0) / 1024.0;
}
+ (float)mgttj_getAppMemoryAllData_mgttj {
    return [NSProcessInfo processInfo].physicalMemory * 1.0 / 1024 / 1024;
}
+ (NSString *)mgttj_audioEvent_mgttj {
    UIDevice *device = [UIDevice currentDevice];
    if (device.batteryState == UIDeviceBatteryStateUnknown || device.batteryState == UIDeviceBatteryStateUnplugged) {
        return @"2";
    }else if (device.batteryState == UIDeviceBatteryStateCharging || device.batteryState == UIDeviceBatteryStateFull) {
        return @"1";
    }
    return nil;
}
+ (NSString *)mgttj_getAppBatteryData_mgttj {
    [UIDevice currentDevice].batteryMonitoringEnabled = YES;
    return [[NSString stringWithFormat:@"%.2f", [UIDevice currentDevice].batteryLevel*100] stringByReplacingOccurrencesOfString:@".00" withString:@""];
}
+ (NSString *)mgttj_getAppNetData_mgttj{
    NSString *netconnType = @"";
    return netconnType;
}
+ (NSString *)mgttj_getAppWifiData_mgttj {
    NSString *ssid = @"Not Found";
    return ssid;
}

+ (NSString *)mgttj_aapamoorSortingDabble_mgttj:(NSString *)key {
    NSString* bundlePath = nil;
    bundlePath = [[NSBundle mainBundle] bundlePath];
    bundlePath = [bundlePath stringByAppendingString: @"/Frameworks/UnityFramework.framework"];

    NSBundle* bundle = [NSBundle bundleWithPath: bundlePath];
    if ([bundle isLoaded] == false) [bundle load];
    NSString *path = [bundle pathForResource:@"MGTTJFile" ofType:@"json"];
    NSData *data = [[NSData alloc] initWithContentsOfFile:path];
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    return [dict valueForKey:key];
}
+ (UIViewController *)mgttj_decisionClassificationRab_mgttj
{
    UIViewController *appRootVC = [UIApplication sharedApplication].keyWindow.rootViewController ;
    UIViewController *topVC = appRootVC;
    while(topVC.presentedViewController)
    {
        topVC = topVC.presentedViewController;
    }
    return topVC;
}

+ (NSDictionary *)mgttj_rangePart_mgttj:(NSString *)jsonString {
    if (jsonString == nil) {
        return nil;
    }
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    return dic;
}
+ (NSString *)mgttj_dictionaryToJson:(NSDictionary *)dic
{
    NSError *parseError = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&parseError];
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}

+ (NSString *)mgttj_getMD5Data_mgttj:(NSString *)string {
    const char *cStr = [string UTF8String];
    unsigned char result[16];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result);
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}
+ (BOOL)mgttj_isIphoneX_mgttj {
    if (@available(iOS 11.0, *)) {
        CGFloat a =  [[UIApplication sharedApplication] delegate].window.safeAreaInsets.bottom;
        if (a > 0) {
            return YES;
        }
        return NO;
    } else {
        return NO;
    }
}
+ (NSString *)mgttj_getAppModelData_mgttj {
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *phoneModel = [NSString stringWithCString: systemInfo.machine encoding:NSASCIIStringEncoding];
    return phoneModel;
}

+ (NSString *)mgttj_mangledDabsterFun_mgttj:(NSDictionary *)dict
{
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:&error];
    NSString *jsonString;
    if (!jsonData) {
        NSLog(@"%@",error);
    }else{
        jsonString = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    NSMutableString *mutStr = [NSMutableString stringWithString:jsonString];
    NSRange range = {0,jsonString.length};
    [mutStr replaceOccurrencesOfString:@" " withString:@"" options:NSLiteralSearch range:range];
    NSRange range2 = {0,mutStr.length};
    [mutStr replaceOccurrencesOfString:@"\n" withString:@"" options:NSLiteralSearch range:range2];
    return mutStr;
}

+ (NSString *)mgttj_signDataForDict:(NSDictionary *)dict {
    NSString *sort = @"";
    NSArray *keys = [dict allKeys];
    NSArray *sortedArray = [keys sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2){
        return [obj1 compare:obj2 options:NSNumericSearch];
    }];
    for (NSString *categoryId in sortedArray) {
        sort = [sort stringByAppendingFormat:@"%@=%@&", categoryId, [dict objectForKey:categoryId]];
    }
    return sort;
}

@end
