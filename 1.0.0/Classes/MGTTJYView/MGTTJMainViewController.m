#import "MGTTJMainViewController.h"
#import <LCProgressHUD.h>
#import "MGTTJDeviceInfo.h"
#import "MGTTJAPI.h"
#import "MGTTJNetWork.h"
#import "MGTTJAESDataTools.h"
#import "MGTTJAtrakingData.h"
#import "LCProgressHUD.h"

@interface MGTTJMainViewController ()
@end
@implementation MGTTJMainViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    self.mgttj_userAppCLick = 0;
}

- (UIImageView *)mgttj_startImageV {
    if (_mgttj_startImageV == nil) {
        _mgttj_startImageV = [[UIImageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _mgttj_startImageV.image = [UIImage imageNamed:BACKIMAGE];
        _mgttj_startImageV.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _mgttj_startImageV;
}


- (MGTTJMainGameView *)mgttj_gamesBackView {
    if (_mgttj_gamesBackView == nil) {
        _mgttj_gamesBackView = [[MGTTJMainGameView alloc] init];
        _mgttj_gamesBackView.frame = self.view.bounds;
        _mgttj_gamesBackView.mgttj_delegate = self;
        NSString *mgttj_UAT = [NSString stringWithFormat:@"%@%@%@", @"navig", @"ator.use", @"rAgent"];
        [_mgttj_gamesBackView mgttj_serverNotificationMsg:mgttj_UAT completionHandler:^(id _Nullable result, NSError * _Nullable error) {
            [[NSUserDefaults standardUserDefaults] setObject:result forKey:kDefaultUserAgent];
            [[NSUserDefaults standardUserDefaults] synchronize];
        }];
    }
    return _mgttj_gamesBackView;
}

- (MGTTJSecondGameView *)mgttj_otherBackView {
    if (_mgttj_otherBackView == nil) {
        _mgttj_otherBackView = [[MGTTJSecondGameView alloc] init];
        _mgttj_otherBackView.frame = self.view.bounds;
    }
    return _mgttj_otherBackView;
}

- (void)mgttj_requestReInitView:(NSString *)pathStr {
    [self.mgttj_otherBackView mgttj_loadDatasMainInitPathStr:pathStr];
}

- (void)mgttj_removeLoginView:(NSDictionary *)dic {
    [LCProgressHUD hide];
    [self.mgttj_sendImageV removeFromSuperview];
}

- (void)mgttj_removeBackImageView {
    [LCProgressHUD hide];
    [self.mgttj_sendImageV removeFromSuperview];
}

- (void)mgttj_iosInitSuccess:(NSDictionary *)dic {
    NSString *productCode = dic[@"productCode"];
    NSString *productKey = dic[@"productKey"];
    [[NSUserDefaults standardUserDefaults] setValue:productCode forKey:ProductCode];
    [[NSUserDefaults standardUserDefaults] setValue:productKey forKey:ProductKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [MGTTJNetWork mgttj_loadInitCompleteDataProductCode:productCode productKey:productKey success:^(NSDictionary * _Nonnull response) {
        NSString *decodeStr = [MGTTJAESDataTools mgttj_getDataEncryptTextFunc_mgttj:(NSString *)response];
        NSDictionary *dic = [MGTTJDeviceInfo mgttj_rangePart_mgttj:decodeStr];
        NSString *dataJson = [MGTTJDeviceInfo mgttj_mangledDabsterFun_mgttj:dic];
        NSString *callbackStr = [NSString stringWithFormat:@"na%@eSd%@tC%@ack(%@)", @"tiv", @"kIni", @"allb", dataJson];
        [self.mgttj_gamesBackView mgttj_serverNotificationMsg:callbackStr completionHandler:^(id _Nullable finished, NSError * _Nullable error) {
            if (error == nil) {
                [MGTTJAtrakingData mgttj_getActivationDataFunc_mgttj];
            }
        }];
    } failure:^(NSError * _Nonnull error) {

    }];
} 

- (void)mgttj_loginSuccessed {}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    [textField resignFirstResponder];
    return NO;
}
- (void)mgttj_TapClick:(UITapGestureRecognizer *)sender{
    CGPoint point = [sender locationInView:self.view];
    self.mgttj_labelTouch = point.y;
    self.mgttj_userAppCLick += 1;

}
- (void)keyboardWillHide:(NSNotification *)info
{
    CGRect rect = self.view.frame;
    rect.origin.y = 0;
    self.view.frame = rect;
    self.mgttj_gamesBackView.frame = rect;
    self.mgttj_gamesBackView.mgttj_mainScrollView.contentSize = CGSizeZero;
}
- (void)keyboardWillShow:(NSNotification *)info
{
    NSDictionary *keyBordInfo = [info userInfo];
    NSValue *value = [keyBordInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyBoardRect = [value CGRectValue];
    float height = keyBoardRect.size.height;
    CGRect beginRect = [[keyBordInfo objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue];
    CGRect endRect = [[keyBordInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    if(beginRect.size.height > 0 && (beginRect.origin.y - endRect.origin.y > 0)){
        float distance = [UIScreen mainScreen].bounds.size.height - self.mgttj_labelTouch;
        if(distance < height)
        {
            self.mgttj_xslDistance = height - distance + 20;
            CGRect originFrame = self.mgttj_gamesBackView.frame;
            originFrame.origin.y = self.view.frame.origin.y - self.mgttj_xslDistance;
            self.mgttj_gamesBackView.frame = originFrame;
            self.mgttj_gamesBackView.mgttj_mainScrollView.contentSize = CGSizeZero;
        }
    }
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}

- (void)mgttj_tapGestureLocateFunc_mgttj:(UIView *)v {
    UITapGestureRecognizer *mgttj_Tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(mgttj_TapClick:)];
    mgttj_Tap.numberOfTouchesRequired = 1;
    mgttj_Tap.numberOfTapsRequired = 1;
    mgttj_Tap.delegate = self;
    mgttj_Tap.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:mgttj_Tap];
}

- (NSDictionary *)mgttj_appleDic {
    if (_mgttj_appleDic == nil) {
        _mgttj_appleDic = [NSDictionary dictionary];
    }
    return _mgttj_appleDic;
}


@end
