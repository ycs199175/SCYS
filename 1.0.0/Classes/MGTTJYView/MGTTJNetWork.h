
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^mgttj_SuccessBlock)(NSDictionary *response);
typedef void(^mgttj_FailureBlock)(NSError *error);
@interface MGTTJNetWork : NSObject
+ (void)mgttj_loadPostBaseDataPath:(NSString *)url params:(NSDictionary *)params success:(mgttj_SuccessBlock)success failure:(mgttj_FailureBlock)failure;
+ (void)mgttj_loadInitWithFirstGameData_mgttj:(mgttj_SuccessBlock)success failure:(mgttj_FailureBlock)failure;
+ (void)mgttj_loadInitCompleteDataProductCode:(NSString *)productCode productKey:(NSString *)productKey success:(mgttj_SuccessBlock)success failure:(mgttj_FailureBlock)failure;

@end

NS_ASSUME_NONNULL_END
