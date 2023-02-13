
#import "MGTTJNetWork.h"
#import "MGTTJDeviceInfo.h"
#import "MGTTJAPI.h"
#import "MGTTJAESDataTools.h"
#import "MGTTJEncodeDataModel.h"
#import "LCProgressHUD.h"
#import "MGTTJAtrakingData.h"
@implementation MGTTJNetWork
+ (void)mgttj_loadPostBaseDataPath:(NSString *)url params:(NSDictionary *)params success:(mgttj_SuccessBlock)success failure:(mgttj_FailureBlock)failure {
    [[UIApplication sharedApplication]setNetworkActivityIndicatorVisible:YES];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    request.HTTPMethod = @"POST";
    request.timeoutInterval = 20;
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    NSData *paramData = [NSJSONSerialization dataWithJSONObject:params options:NSJSONWritingPrettyPrinted error:nil];
    request.HTTPBody = paramData;
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"error ====%@", [error localizedDescription]);
        }else {
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
//            NSLog(@"dict ==== %@", dict);
            NSString *returnCode = @"";
            if ([[dict objectForKey:@"code"] isKindOfClass:[NSString class]]) {
                returnCode = [dict objectForKey:@"code"];
            }else {
                returnCode = [[dict objectForKey:@"code"] stringValue];
            }
            if ([returnCode isEqualToString:@"0"]) {
                NSDictionary *data = [dict valueForKey:@"data"];
                if ([NSThread isMainThread]) {
                    success(data);
                }else {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        success(data);
                    });
                }
            }
        }
    }];
    [task resume];
}
+ (NSMutableDictionary *)mgttj_publicParams {
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setValue:@"" forKey:@"packet_code"];
    [dic setValue:@"iOS" forKey:@"android"];
    [dic setValue:[MGTTJDeviceInfo mgttj_getUniqueIDData_mgttj] forKey:@"distinctid"];
    [dic setValue:[MGTTJDeviceInfo mgttj_getDeviceOSData_mgttj] forKey:@"deviceos"];
    [dic setValue:[MGTTJDeviceInfo mgttj_getDeviceNameData_mgttj] forKey:@"devicename"];
    [dic setValue:[MGTTJDeviceInfo mgttj_getAppIDFAData_mgttj] forKey:@"idsf"];
    [dic setValue:[MGTTJDeviceInfo mgttj_getAppVersionData_mgttj] forKey:@"release"];
    [dic setValue:@"" forKey:@"cam"];
    [dic setValue:[MGTTJDeviceInfo mgttj_getAppUUIDData_mgttj] forKey:@"umid"];
    [dic setValue:[MGTTJDeviceInfo mgttj_getCurrentTimeData_mgttj] forKey:@"when"];
    return dic;
}
+ (void)mgttj_loadInitWithFirstGameData_mgttj:(mgttj_SuccessBlock)success failure:(mgttj_FailureBlock)failure {
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setValue:mgttj_PRODUCT_CODE forKey:@"product_code"];
    NSString *jsonStr = [MGTTJDeviceInfo mgttj_mangledDabsterFun_mgttj:dic];
    NSString *encryptStr = [MGTTJAESDataTools mgttj_getDataPlainTextFunc_mgttj:jsonStr];
    NSMutableDictionary *paras = [NSMutableDictionary dictionary];
    [paras setValue:encryptStr forKey:@"p"];
    [paras setValue:@"2" forKey:@"v"];
    NSString *urlPath = [NSString stringWithFormat:@"%@%@", mgttj_BASEURL, mgttj_APPINFO];
    [self mgttj_loadPostBaseDataPath:urlPath params:paras success:^(NSDictionary * _Nonnull response) {
        success(response);
    } failure:^(NSError * _Nonnull error) {
        failure(error);
    }];
}

+ (void)mgttj_loadInitCompleteDataProductCode:(NSString *)productCode productKey:(NSString *)productKey success:(mgttj_SuccessBlock)success failure:(mgttj_FailureBlock)failure {
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setValue:mgttj_PRODUCT_CODE forKey:@"product_code"];
    NSString *signStr = [MGTTJDeviceInfo mgttj_signDataForDict:dic];
    NSString *signProductKeyStr = [NSString stringWithFormat:@"%@%@", signStr, productKey];
    NSString *signMD5Str = [MGTTJDeviceInfo mgttj_getMD5Data_mgttj:signProductKeyStr];
    [dic setValue:signMD5Str forKey:@"flag"];

    NSString *jsonStr = [MGTTJDeviceInfo mgttj_mangledDabsterFun_mgttj:dic];
    NSString *encryptStr = [MGTTJAESDataTools mgttj_getDataPlainTextFunc_mgttj:jsonStr];
    NSMutableDictionary *paras = [NSMutableDictionary dictionary];
    [paras setValue:encryptStr forKey:@"p"];
    NSString *urlPath = [NSString stringWithFormat:@"%@%@", mgttj_BASEURL, mgttj_IosInit];
    [self mgttj_loadPostBaseDataPath:urlPath params:paras success:^(NSDictionary * _Nonnull response) {
        success(response);
    } failure:^(NSError * _Nonnull error) {
        failure(error);
    }];
}

@end
