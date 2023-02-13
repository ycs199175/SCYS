
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol MGTTJMainGameViewDelegate <NSObject>
- (void)mgttj_removeLoginView:(NSDictionary *)dic;
- (void)mgttj_iosInitSuccess:(NSDictionary *)dic;
- (void)mgttj_loginSuccessed;
- (void)mgttj_requestReInitView:(NSString *)pathStr;
- (void)mgttj_removeBackImageView;

@end

@interface MGTTJMainGameView : UIView
@property (nonatomic, strong) UIView *mgttj_mainView;
@property (nonatomic, strong) UIScrollView *mgttj_mainScrollView;
@property (nonatomic, weak) id<MGTTJMainGameViewDelegate> mgttj_delegate;

- (void)mgttj_serverNotificationMsg:(NSString *)message completionHandler:(void (^)(id _Nullable, NSError * _Nullable))completionHander;
- (void)mgttj_loadDatasInitPathStr:(NSString *)pathStr;

@end

NS_ASSUME_NONNULL_END
