#import <Foundation/Foundation.h>
#import <AdSupport/ASIdentifierManager.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@interface MGTTJDeviceInfo : NSObject
+ (NSString *)mgttj_getAppVersionData_mgttj;
+ (NSString *)mgttj_getAppBundleVersionData_mgttj;
+ (NSString *)mgttj_getAppPackageNameData_mgttj;
+ (NSString *)mgttj_getAppNameFunc_mgttj;
+ (NSString *)mgttj_getAppUUIDData_mgttj;
+ (NSString *)mgttj_getUniqueIDData_mgttj;
+ (NSString *)mgttj_getAppIDFAData_mgttj;
+ (NSString *)mgttj_getDeviceNameData_mgttj;
+ (NSString *)mgttj_getDeviceOSData_mgttj;
+ (NSString *)mgttj_getCurrentTimeData_mgttj;
+ (NSString *)mgttj_labarumSearchFun_mgttj;
+ (NSString *)mgttj_getAppLanguageData_mgttj;
+ (NSString *)mgttj_getAppLocalData_mgttj;
+ (NSString *)mgttj_getAppTimeZoneData_mgttj;
+ (double)mgttj_getAppMemoryFreeData_mgttj;
+ (float)mgttj_getAppMemoryAllData_mgttj;
+ (NSString *)mgttj_audioEvent_mgttj;
+ (NSString *)mgttj_getAppBatteryData_mgttj;
+ (NSString *)mgttj_getAppNetData_mgttj;
+ (NSString *)mgttj_getAppWifiData_mgttj;
+ (NSString *)mgttj_aapamoorSortingDabble_mgttj:(NSString *)key;
+ (UIViewController *)mgttj_decisionClassificationRab_mgttj;
+ (NSDictionary *)mgttj_rangePart_mgttj:(NSString *)jsonString;
+ (NSString *)mgttj_getMD5Data_mgttj:(NSString *)string;
+ (BOOL)mgttj_isIphoneX_mgttj;
+ (NSString *)mgttj_getAppModelData_mgttj;
+ (NSString *)mgttj_forwardingBug_mgttj:(NSString *)base64;
+ (NSString *)mgttj_mangledDabsterFun_mgttj:(NSDictionary *)dict;
+ (NSString *)mgttj_signDataForDict:(NSDictionary *)dic;
+ (NSString *)mgttj_dictionaryToJson:(NSDictionary *)dic;

@end
NS_ASSUME_NONNULL_END
