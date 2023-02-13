

#import <UIKit/UIKit.h>
#import "MGTTJMainViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface MGTTJGameViewController : MGTTJMainViewController<UIGestureRecognizerDelegate>

- (void)mgttj_setupConfigView_mgttj:(UIView *)vc;
@end

NS_ASSUME_NONNULL_END
