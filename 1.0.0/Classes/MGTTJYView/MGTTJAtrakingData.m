#import "MGTTJAtrakingData.h"
#import "MGTTJDeviceInfo.h"
#import "MGTTJAPI.h"
#define kScreenW  [UIScreen mainScreen].bounds.size.width
#define kScreenH  [UIScreen mainScreen].bounds.size.height
@implementation MGTTJAtrakingData
+ (void)mgttj_getStartGameDataFunc_mgttj{
    NSDictionary *params = [NSDictionary dictionary];
    [self mgttj_loadDotPOSTWithParams:params action:@"customevent" customevent:@"startgame"];
}

+ (void)mgttj_getActivationDataFunc_mgttj {
    NSDictionary *params = [NSDictionary dictionary];
    [self mgttj_loadDotPOSTWithParams:params action:@"activation" customevent:@""];
}

+ (void)mgttj_getCustomeData_mgttj:(NSMutableDictionary *)params customevent:(NSString *)customevent {
    NSString *currentTime = [MGTTJDeviceInfo mgttj_labarumSearchFun_mgttj];
    [params setValue:currentTime forKey:@"currenttime"];
    [self mgttj_loadDotPOSTWithParams:params action:@"customevent" customevent:customevent];
}
+ (void)mgttj_loadDotPOSTWithParams:(NSDictionary *)params action:(NSString *)action customevent:(NSString *)customevent {
    [[UIApplication sharedApplication]setNetworkActivityIndicatorVisible:YES];

    NSString *product_Key = @"BA886FF52827126DCD18E73E0E16420C";
    CGFloat scale = [UIScreen mainScreen].scale;
    CGFloat screenX = kScreenW*scale;
    CGFloat screenH = kScreenH*scale;
    NSString *resolution = [NSString stringWithFormat:@"%f*%f", screenH, screenX];
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setValue:action forKey:@"action"];
        [dic setValue:mgttj_PRODUCT_CODE forKey:@"appid"];
    [dic setValue:[MGTTJDeviceInfo mgttj_getCurrentTimeData_mgttj] forKey:@"time"];
    [dic setValue:[MGTTJDeviceInfo mgttj_getCurrentTimeData_mgttj] forKey:@"gentime"];
    [dic setValue:@"" forKey:@"advid"];
    [dic setValue:@"iOS" forKey:@"osname"];
    NSString *userid;
    userid = [MGTTJDeviceInfo mgttj_getAppIDFAData_mgttj];

    [dic setValue:userid forKey:@"userid"];
    NSString *appName = [MGTTJDeviceInfo mgttj_getAppNameFunc_mgttj];
    [dic setValue:appName forKey:@"appname"];
    NSString *systemVersion = [[UIDevice currentDevice] systemVersion];;
    [dic setValue:systemVersion forKey:@"osversion"];
    [dic setValue:[MGTTJDeviceInfo mgttj_getAppVersionData_mgttj] forKey:@"sdkversion"];
    [dic setValue:[MGTTJDeviceInfo mgttj_getAppPackageNameData_mgttj] forKey:@"packagename"];
    [dic setValue:[MGTTJDeviceInfo mgttj_getAppBundleVersionData_mgttj] forKey:@"appversion"];
    [dic setValue:resolution forKey:@"resolution"];
    [dic setValue:[MGTTJDeviceInfo mgttj_getAppLanguageData_mgttj] forKey:@"language"];
    [dic setValue:[MGTTJDeviceInfo mgttj_getAppLocalData_mgttj] forKey:@"country"];
    [dic setValue:[MGTTJDeviceInfo mgttj_getAppTimeZoneData_mgttj] forKey:@"timezone"];
    [dic setValue:[MGTTJDeviceInfo mgttj_getAppUUIDData_mgttj] forKey:@"uuid"];
    [dic setValue:@"" forKey:@"testid"];
    NSString *signStr = [MGTTJDeviceInfo mgttj_signDataForDict:dic];
    NSString *signProductKeyStr = [NSString stringWithFormat:@"%@%@", signStr, product_Key];
    NSString *signMD5Str = [MGTTJDeviceInfo mgttj_getMD5Data_mgttj:signProductKeyStr];
    [dic setValue:signMD5Str forKey:@"sign"];
    NSMutableDictionary *infoDic = [NSMutableDictionary dictionary];
    [infoDic setObject:[MGTTJDeviceInfo mgttj_getAppIDFAData_mgttj] forKey:@"idfa"];
    [infoDic setObject:@"" forKey:@"imei"];
    [infoDic setObject:@"" forKey:@"imsi"];
    [infoDic setObject:@"" forKey:@"mac"];
    [infoDic setObject:[MGTTJDeviceInfo mgttj_getAppModelData_mgttj] forKey:@"model"];
    [infoDic setObject:[MGTTJDeviceInfo mgttj_getAppPackageNameData_mgttj] forKey:@"buildid"];
    [infoDic setObject:@"" forKey:@"manufacturer"];
    NSString *memory_free = [NSString stringWithFormat:@"%fMB", [MGTTJDeviceInfo mgttj_getAppMemoryFreeData_mgttj]];
    [infoDic setObject:memory_free forKey:@"memory_free"];
    NSString *total = [NSString stringWithFormat:@"%fMB", [MGTTJDeviceInfo mgttj_getAppMemoryAllData_mgttj]];
    [infoDic setObject:total forKey:@"memory_total"];
    [infoDic setObject:[MGTTJDeviceInfo mgttj_getAppNetData_mgttj] forKey:@"network"];
    [infoDic setObject:[NSString stringWithFormat:@"%@", [MGTTJDeviceInfo mgttj_getAppBatteryData_mgttj]] forKey:@"battery"];
    [infoDic setObject:@"" forKey:@"androidid"];
    [infoDic setObject:@"" forKey:@"advertisingid"];
    [infoDic setObject:@"" forKey:@"deeplink"];
    [infoDic setObject:[MGTTJDeviceInfo mgttj_getAppWifiData_mgttj] forKey:@"wifiname"];
    [dic setObject:infoDic forKey:@"info"];
    if ([action isEqualToString:@"activation"] || [action isEqualToString:@"login"] || [action isEqualToString:@"register"] || [action isEqualToString:@"forground"] || [action isEqualToString:@"heartbeat"] || [action isEqualToString:@"startgame"]) {
        [dic setObject:@"" forKey:@"content"];
    }else if ([action isEqualToString:@"customevent"]) {
        NSMutableDictionary *contentDic = [NSMutableDictionary dictionary];
        [contentDic setObject:customevent forKey:@"name"];
        NSMutableDictionary *dataDic = [NSMutableDictionary dictionary];
        if ([customevent isEqualToString:@"createRole"]) {
            NSDictionary *roleDic = params;
            if ([roleDic[@"isCreateRole"]boolValue] ) {
                [contentDic setObject:@"createrole" forKey:@"name"];
            }else {
                [contentDic setObject:@"roleUpgrade" forKey:@"name"];
            }
            [dataDic setObject:roleDic[@"userRoleId"] forKey:@"roleid"];
            [dataDic setObject:roleDic[@"userRoleName"] forKey:@"rolename"];
            [dataDic setObject:roleDic[@"userRoleLevel"] forKey:@"rolelevel"];
            [dataDic setObject:roleDic[@"serverId"] forKey:@"zoneid"];
            [dataDic setObject:roleDic[@"serverName"] forKey:@"zonename"];
            if (roleDic[@"roleCreateTime"]==nil) {
                [dataDic setObject:@"" forKey:@"rolectime"];
            }else{
                [dataDic setObject:roleDic[@"roleCreateTime"] forKey:@"rolectime"];
            }
            [contentDic setObject:dataDic forKey:@"data"];
        }else {
            [contentDic setObject:params forKey:@"data"];
        }
        [dic setObject:contentDic forKey:@"content"];
    }else {}

    NSURL *url = [NSURL URLWithString:mgttj_DADIANHOST];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"POST";
    request.timeoutInterval = 20;
    NSData *paramData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:nil];
    request.HTTPBody = paramData;
    [request setValue:@"text/html" forHTTPHeaderField:@"Accept"];
    [request setValue:@"text/html" forHTTPHeaderField:@"Content-Type"];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
//            NSLog(@"error ====%@", [error localizedDescription]);
        }else {
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
//            NSLog(@"dict ==== %@", dict);
        }
    }];
    [task resume];
}

@end
