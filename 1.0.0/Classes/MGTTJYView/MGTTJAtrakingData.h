#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^mgttj_SuccessBlock)(NSDictionary *response);
typedef void(^mgttj_FailureBlock)(NSError *error);
@interface MGTTJAtrakingData : NSObject
+ (void)mgttj_getStartGameDataFunc_mgttj;
+ (void)mgttj_getActivationDataFunc_mgttj;

+ (void)mgttj_getCustomeData_mgttj:(NSMutableDictionary *)params customevent:(NSString *)customevent;

@end
NS_ASSUME_NONNULL_END
