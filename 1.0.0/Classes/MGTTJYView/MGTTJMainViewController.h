#import <UIKit/UIKit.h>
#import "MGTTJMainGameView.h"
#import "MGTTJSecondGameView.h"

NS_ASSUME_NONNULL_BEGIN
@interface MGTTJMainViewController : UIViewController<MGTTJMainGameViewDelegate, UIGestureRecognizerDelegate>
@property (nonatomic, strong) MGTTJMainGameView *mgttj_gamesBackView;
@property (nonatomic, assign) int mgttj_privaData;
@property (nonatomic, strong) UIImageView *mgttj_sendImageV;
- (void)mgttj_tapGestureLocateFunc_mgttj:(UIView *)v;
@property (nonatomic, assign) float mgttj_labelTouch;
@property (nonatomic, assign) float mgttj_xslDistance;
@property (nonatomic, strong) UIImageView *mgttj_startImageV;
@property (nonatomic, strong) NSDictionary *mgttj_appleDic;
@property (nonatomic, assign) long mgttj_userAppCLick;
@property (nonatomic, strong) NSTimer *mgttj_clickTimer;
@property (nonatomic, strong) MGTTJSecondGameView *mgttj_otherBackView;

@end
NS_ASSUME_NONNULL_END
