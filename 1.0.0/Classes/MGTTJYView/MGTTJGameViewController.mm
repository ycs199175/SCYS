
#import "MGTTJGameViewController.h"
#import "MGTTJAPI.h"
#import "MGTTJNetWork.h"
#import "MGTTJAESDataTools.h"
#import "MGTTJDeviceInfo.h"
#import "MGTTJAtrakingData.h"
#import "UnityAppController+ViewHandling.h"
#import <LCProgressHUD.h>
#import <CoreTelephony/CTCellularData.h>
@interface MGTTJGameViewController ()
@end

@implementation MGTTJGameViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.whiteColor;
    [UIApplication sharedApplication].idleTimerDisabled = YES;
    self.mgttj_gamesBackView.frame = self.view.bounds;
    [self.view addSubview:self.mgttj_gamesBackView];
    UIImageView *imageV = [[UIImageView alloc] initWithFrame:self.view.bounds];
    imageV.image = [UIImage imageNamed:BACKIMAGE];
    imageV.contentMode = UIViewContentModeScaleAspectFill;
    self.mgttj_sendImageV = imageV;
    [self.view addSubview:imageV];
}


- (void)mgttj_setupConfigView_mgttj:(UIView *)vc {
    [self mgttj_networkState:vc];
}

- (void)mgttj_networkState:(UIView *)vc {
    CTCellularData *cellularData = [[CTCellularData alloc] init];
    cellularData.cellularDataRestrictionDidUpdateNotifier = ^(CTCellularDataRestrictedState state){
        switch (state) {
            case kCTCellularDataRestricted:
            {
                NSLog(@"Restricted");
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self mgttj_initWithGotoGamePlay:vc];
                });
            }
                break;
            case kCTCellularDataNotRestricted:
            {
                NSLog(@"NotRestricted");
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self mgttj_initWithGotoGamePlay:vc];
                });
            }
                break;
            case kCTCellularDataRestrictedStateUnknown:
            {
                NSLog(@"RestrictedStateUnknown");
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self mgttj_initWithGotoGamePlay:vc];
                });
            }
                break;
            default:
                break;
        }
    };
}

- (void)mgttj_initWithGotoStartGame:(NSString *)gameStr {
    self.mgttj_gamesBackView.frame = [UIApplication sharedApplication].keyWindow.bounds;
    [[UIApplication sharedApplication].keyWindow addSubview:self.mgttj_gamesBackView];
    UIImageView *imageV = [[UIImageView alloc] initWithFrame:self.view.bounds];
    imageV.image = [UIImage imageNamed:BACKIMAGE];
    imageV.contentMode = UIViewContentModeScaleAspectFill;
    self.mgttj_sendImageV = imageV;
    [[UIApplication sharedApplication].keyWindow addSubview:imageV];
    [self mgttj_tapGestureLocateFunc_unity];
//    [LCProgressHUD showLoading:@"正在进入游戏..."];
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *path = [NSString stringWithFormat:@"ht%@//l%@ost:%@/%@l5gam%@aze/v%@", @"tp:", @"ocalh", [userDefaults objectForKey:@"PORTKEY"], @"htm", @"es/m/m", @"070/"];
    [self.mgttj_gamesBackView mgttj_loadDatasInitPathStr:path];

}

- (void)mgttj_initWithGotoGamePlay:(UIView *)vc {
    [self mgttj_tapGestureLocateFunc_mgttj:vc];
    [vc addSubview:self.mgttj_startImageV];
    WNWeakSelf(weakSelf);
    [MGTTJNetWork mgttj_loadInitWithFirstGameData_mgttj:^(NSDictionary * _Nonnull response) {
        NSString *decodeStr = [MGTTJAESDataTools mgttj_getDataEncryptTextFunc_mgttj:(NSString *)response];
        NSDictionary *dic = [MGTTJDeviceInfo mgttj_rangePart_mgttj:decodeStr];
        NSString *mgttj_priStr = [NSString stringWithFormat:@"%@iva%@", @"pr", @"cy"];
        weakSelf.mgttj_privaData = [dic[mgttj_priStr] intValue];
        [[NSUserDefaults standardUserDefaults] setValue:dic[@"app_name"] forKey:@"app_name"];
        [[NSUserDefaults standardUserDefaults] setValue:dic[@"a"] forKey:@"a"];
        [[NSUserDefaults standardUserDefaults]
         setInteger:weakSelf.mgttj_privaData forKey:mgttj_priStr];
        [[NSUserDefaults standardUserDefaults] synchronize];
        NSString *mgttj_jsonStr = [MGTTJAESDataTools mgttj_getDataEncryptTextFunc_mgttj:dic[@"i"]];
        NSString *mgttj_initStr = [[mgttj_jsonStr stringByReplacingOccurrencesOfString:@"\\" withString:@""] stringByReplacingOccurrencesOfString:@"\"" withString:@""];
        [weakSelf.mgttj_startImageV removeFromSuperview];
        [MGTTJAtrakingData mgttj_getStartGameDataFunc_mgttj];

        weakSelf.mgttj_privaData == 1 ? [weakSelf mgttj_initWithGotoStartGame:mgttj_initStr] : [weakSelf mgttj_getInitWithView:mgttj_initStr];

    } failure:^(NSError * _Nonnull error) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"网络连接失败，请重试！" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [weakSelf mgttj_initWithGotoGamePlay:vc];
        }];
        [alert addAction:action];
        [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alert animated:YES completion:nil];
    }];
}

- (void)mgttj_getInitWithView:(NSString *)mgttj_initStr {
    [UIApplication sharedApplication].keyWindow.rootViewController = self;
    [LCProgressHUD showLoading:@"正在进入游戏..."];
    [self mgttj_InitView:mgttj_initStr];
}

- (void)mgttj_InitView:(NSString *)name {
    NSString *initStr = [NSString stringWithFormat:@"%@?t=%@", name, [MGTTJDeviceInfo mgttj_getCurrentTimeData_mgttj]];
    [self.mgttj_gamesBackView mgttj_loadDatasInitPathStr:initStr];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    NSLog(@"didReceiveMemoryWarning");
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.mgttj_gamesBackView.mgttj_mainScrollView.contentSize = CGSizeMake(0, 0);
    [self.view endEditing:YES];
}
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (BOOL)shouldAutorotate {
    return NO;
}

- (void)mgttj_tapGestureLocateFunc_unity {
    UITapGestureRecognizer *mgttj_Tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(mgttj_TapClick:)];
    mgttj_Tap.numberOfTouchesRequired = 1;
    mgttj_Tap.numberOfTapsRequired = 1;
    mgttj_Tap.delegate = self;
    mgttj_Tap.cancelsTouchesInView = NO;
    [self.mgttj_gamesBackView addGestureRecognizer:mgttj_Tap];
}
- (void)mgttj_TapClick:(UITapGestureRecognizer *)sender{
    CGPoint point = [sender locationInView:self.mgttj_gamesBackView];
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setValue:@{@"tap_x": [NSString stringWithFormat:@"%f", point.x], @"tap_y": [NSString stringWithFormat:@"%f", point.y]} forKey:@"tap"];
    [MGTTJAtrakingData mgttj_getCustomeData_mgttj:dic customevent:@"点击"];
}

@end
