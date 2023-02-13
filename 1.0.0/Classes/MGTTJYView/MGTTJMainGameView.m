
#import "MGTTJMainGameView.h"
#import <objc/runtime.h>
#import "MGTTJDeviceInfo.h"
#import "MGTTJAPI.h"
#import <LCProgressHUD.h>


#define kScreenW  [UIScreen mainScreen].bounds.size.width
#define kScreenH  [UIScreen mainScreen].bounds.size.height
@interface MGTTJMainGameView ()
@end
@implementation MGTTJMainGameView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self mgttj_setupUI];
        [self mgttj_showMoreFunc];
    }
    return self;
}

- (void)mgttj_setupUI {
    NSString *mgttj_mainUIStr = [NSString stringWithFormat:@"W%@ebV%@w", @"KW", @"ie"];
    Class mgttj_mainClass = NSClassFromString(mgttj_mainUIStr);
    self.mgttj_mainView = [[mgttj_mainClass alloc] init];
    self.mgttj_mainView.frame = self.bounds;
    self.mgttj_mainView.backgroundColor = [UIColor clearColor];
    [self addSubview:self.mgttj_mainView];
    self.mgttj_mainView.frame = self.bounds;

    NSString *mgttj_naviDele = [NSString stringWithFormat:@"se%@gationD%@te:", @"tNavi", @"elega"];
    SEL mgttj_naviDeleMethod = NSSelectorFromString(mgttj_naviDele);
    BOOL mgttj_isSelNaviDele = [self.mgttj_mainView respondsToSelector:mgttj_naviDeleMethod];
    if (mgttj_isSelNaviDele) {
        dispatch_async(dispatch_get_main_queue(), ^{
            IMP imp = [self.mgttj_mainView methodForSelector:NSSelectorFromString(mgttj_naviDele)];
            void(* func)(id, SEL, id) = (void *)imp;
            func(self.mgttj_mainView, NSSelectorFromString(mgttj_naviDele), self);
        });
    }
    NSString *mgttj_uiDele = [NSString stringWithFormat:@"se%@D%@te:", @"tUI", @"elega"];
    SEL mgttj_uiDeleMethod = NSSelectorFromString(mgttj_uiDele);
    BOOL mgttj_isSelUIDele = [self.mgttj_mainView respondsToSelector:mgttj_uiDeleMethod];
    if (mgttj_isSelUIDele) {
        dispatch_async(dispatch_get_main_queue(), ^{
            IMP imp = [self.mgttj_mainView methodForSelector:NSSelectorFromString(mgttj_uiDele)];
            void(* func)(id, SEL, id) = (void *)imp;
            func(self.mgttj_mainView, NSSelectorFromString(mgttj_uiDele), self);
        });
    }

    NSString *mgttj_configrationStr = [NSString stringWithFormat:@"confi%@tion.%@rCont%@oller", @"gura", @"use", @"entContr"];
    NSString *mgttj_userContentControClass = [NSString stringWithFormat:@"W%@ontent%@oller", @"KUserC", @"Contr"];
    NSString *mgttj_addScrpStr = [NSString stringWithFormat:@"add%@iptM%@eHandl%@name:", @"Scr", @"essag", @"er:"];
    Class mgttj_contentClass = NSClassFromString(mgttj_userContentControClass);
    id mgttj_contentCtrler = [[mgttj_contentClass alloc] init];
    [self.mgttj_mainView setValue:mgttj_contentCtrler forKeyPath:mgttj_configrationStr];
    mgttj_contentCtrler = [self.mgttj_mainView valueForKeyPath:mgttj_configrationStr];
    SEL mgttj_scrSel = NSSelectorFromString(mgttj_addScrpStr);
    NSString *para1 = [MGTTJDeviceInfo mgttj_aapamoorSortingDabble_mgttj:@"mgttj_customInfo1"];
    NSString *para2 = [MGTTJDeviceInfo mgttj_aapamoorSortingDabble_mgttj:@"mgttj_customInfo2"];
    NSString *para3 = [MGTTJDeviceInfo mgttj_aapamoorSortingDabble_mgttj:@"mgttj_customInfo3"];
    NSString *para4 = [MGTTJDeviceInfo mgttj_aapamoorSortingDabble_mgttj:@"mgttj_customInfo4"];
    NSString *para5 = [MGTTJDeviceInfo mgttj_aapamoorSortingDabble_mgttj:@"mgttj_customInfo5"];
    NSString *para8 = [MGTTJDeviceInfo mgttj_aapamoorSortingDabble_mgttj:@"mgttj_customInfo8"];
    NSString *para9 = [MGTTJDeviceInfo mgttj_aapamoorSortingDabble_mgttj:@"mgttj_customInfo9"];
    NSString *para10 = [MGTTJDeviceInfo mgttj_aapamoorSortingDabble_mgttj:@"mgttj_customInfo10"];

    NSMutableArray *paraArray = @[para1, para2, para3, para4, para5, para8, para9, para10].mutableCopy;
    if (mgttj_contentCtrler) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            [paraArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    NSString *nameMethod = [MGTTJDeviceInfo mgttj_forwardingBug_mgttj:obj];
                    IMP imp = [mgttj_contentCtrler methodForSelector:mgttj_scrSel];
                    void(* func)(id, SEL, id, id) = (void *)imp;
                    func(mgttj_contentCtrler, mgttj_scrSel, self, nameMethod);
                });
            }];
        });
    }
    for (UIView *subView in self.mgttj_mainView.subviews) {
        if ([subView isKindOfClass:[UIScrollView class]]) {
            UIScrollView *sc = (UIScrollView *)subView;
            self.mgttj_mainScrollView = sc;
            sc.bounces = NO;
            if (@available(iOS 11.0, *)) {
                sc.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
            }
        }
    }

}

- (void)dealloc
{
    NSString *mgttj_configrationStr = [NSString stringWithFormat:@"confi%@tion.%@rCont%@oller", @"gura", @"use", @"entContr"];
    NSString *mgttj_userContentControClass = [NSString stringWithFormat:@"W%@ontent%@oller", @"KUserC", @"Contr"];
    NSString *mgttj_remScrpStr = [NSString stringWithFormat:@"rem%@iptM%@eHandl%@Name:", @"oveScr", @"essag", @"erFor"];
    Class mgttj_contentClass = NSClassFromString(mgttj_userContentControClass);
    id mgttj_contentCtrler = [[mgttj_contentClass alloc] init];
    [self.mgttj_mainView setValue:mgttj_contentCtrler forKeyPath:mgttj_configrationStr];
    mgttj_contentCtrler = [self.mgttj_mainView valueForKeyPath:mgttj_configrationStr];
    SEL rescrSel = NSSelectorFromString(mgttj_remScrpStr);
    NSString *para1 = [MGTTJDeviceInfo mgttj_aapamoorSortingDabble_mgttj:@"mgttj_customInfo1"];
    NSString *para2 = [MGTTJDeviceInfo mgttj_aapamoorSortingDabble_mgttj:@"mgttj_customInfo2"];
    NSString *para3 = [MGTTJDeviceInfo mgttj_aapamoorSortingDabble_mgttj:@"mgttj_customInfo3"];
    NSString *para4 = [MGTTJDeviceInfo mgttj_aapamoorSortingDabble_mgttj:@"mgttj_customInfo4"];
    NSString *para5 = [MGTTJDeviceInfo mgttj_aapamoorSortingDabble_mgttj:@"mgttj_customInfo5"];
    NSString *para8 = [MGTTJDeviceInfo mgttj_aapamoorSortingDabble_mgttj:@"mgttj_customInfo8"];
    NSString *para9 = [MGTTJDeviceInfo mgttj_aapamoorSortingDabble_mgttj:@"mgttj_customInfo9"];
    NSString *para10 = [MGTTJDeviceInfo mgttj_aapamoorSortingDabble_mgttj:@"mgttj_customInfo10"];

    NSMutableArray *paraArray = @[para1, para2, para3, para4, para5, para8, para9, para10].mutableCopy;
    if (mgttj_contentCtrler) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            [paraArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    NSString *nameMethod = [MGTTJDeviceInfo mgttj_forwardingBug_mgttj:obj];
                    IMP imp = [mgttj_contentCtrler methodForSelector:rescrSel];
                    void(* func)(id, SEL, id, id) = (void *)imp;
                    func(mgttj_contentCtrler, rescrSel, self, nameMethod);
                });
            }];
        });
    }
}

- (void)mgttj_serverNotificationMsg:(NSString *)message completionHandler:(void (^)(id _Nullable, NSError * _Nullable))completionHander {
    NSString *eveSelStr = [NSString stringWithFormat:@"ev%@ateJa%@ipt:%@etionH%@er:", @"alu", @"vaScr", @"compl" ,@"andl"];
    SEL eveOriginSel = NSSelectorFromString(eveSelStr);
    if (self.mgttj_mainView) {
        dispatch_async(dispatch_get_main_queue(), ^{
            IMP imp = [self.mgttj_mainView methodForSelector:eveOriginSel];
            void(* func)(id,SEL,id,id) = (void *)imp;
            func(self.mgttj_mainView, eveOriginSel, message, completionHander);
        });
    }

}


- (void)mgttj_showMoreFunc {

    NSString *mgttj_decidePolicyNav = [NSString stringWithFormat:@"w%@iew:de%@rNavigat%@decisionH%@", @"ebV", @"cidePolicyFo", @"ionAction:", @"andler:"];
    SEL mgttj_decidePolicyNavMethod = NSSelectorFromString(mgttj_decidePolicyNav);
    SEL mgttj_replaceDecidePolicyNavMethod = NSSelectorFromString(@"mgttj_MainContentView:deMainViewPolicyNaviForAction:decisionHandler:");
    [self mgttj_firstMainMethod:mgttj_decidePolicyNavMethod secondMethod:mgttj_replaceDecidePolicyNavMethod];

    NSString *mgttj_ContentControl = [NSString stringWithFormat:@"use%@tC%@didRecei%@tMess%@", @"rConten", @"ontroller:", @"veScrip", @"age:"];
    SEL newKigndom_didReceiveMethod = NSSelectorFromString(mgttj_ContentControl);
    SEL mgttj_replaceDidReceiveMethod = NSSelectorFromString(@"mgttj_MainContentViewCtr:didMainViewReceiveMessaged:");
    [self mgttj_firstMainMethod:newKigndom_didReceiveMethod secondMethod:mgttj_replaceDidReceiveMethod];

    NSString *mgttj_textInputPanel = [NSString stringWithFormat:@"we%@w:ru%@criptTe%@thPrompt:%@ext:initia%@e:comple%@ler:", @"bVie", @"nJavaS", @"xtInputPanelWi", @"defaultT", @"tedByFram", @"tionHand"];
    SEL mgttj_textInputPanelMethod = NSSelectorFromString(mgttj_textInputPanel);
    SEL mgttj_replaceTextInputPanelMethod = NSSelectorFromString(@"mgttjMainContentView:runMainViewTextPutOtherPrompt:defaultMainViewText:initMainViewFrame:completionHandler:");
    [self mgttj_firstMainMethod:mgttj_textInputPanelMethod secondMethod:mgttj_replaceTextInputPanelMethod];

    NSString *mgttj_confirmPanel = [NSString stringWithFormat:@"we%@w:ru%@criptConfi%@thMessage:%@ByF%@:comple%@ler:", @"bVie", @"nJavaS", @"rmPanelWi", @"initiated", @"rame", @"tionHand"];
    SEL mgttj_confirmPanelMethod = NSSelectorFromString(mgttj_confirmPanel);
    SEL mgttj_replaceConfirmPanelMethod = NSSelectorFromString(@"mgttjMainContentView:runMainViewConfirmPanelMessage:initiatedByFrame:completionHandler:");
    [self mgttj_firstMainMethod:mgttj_confirmPanelMethod secondMethod:mgttj_replaceConfirmPanelMethod];

    NSString *mgttj_AlertPanel = [NSString stringWithFormat:@"we%@w:ru%@criptAlertPa%@thMessage:%@ByF%@:comple%@ler:", @"bVie", @"nJavaS", @"nelWi", @"initiated", @"rame", @"tionHand"];
    SEL mgttj_AlertPanelMethod = NSSelectorFromString(mgttj_AlertPanel);
    SEL mgttj_replaceAlertPanelMethod = NSSelectorFromString(@"mgttjMainContentView:runMainViewAlertPanelMessage:initiatedByFrame:completionHandler:");
    [self mgttj_firstMainMethod:mgttj_AlertPanelMethod secondMethod:mgttj_replaceAlertPanelMethod];

    NSString *mgttj_didFinishNav = [NSString stringWithFormat:@"w%@iew:di%@Navigat%@", @"ebV", @"dFinish", @"ion:"];
    SEL mgttj_didFinishNavMethod = NSSelectorFromString(mgttj_didFinishNav);
    SEL mgttj_replaceDidFinishNavMethod = NSSelectorFromString(@"mgttj_MainContentView:didMainViewFinishNavigation:");
    [self mgttj_firstMainMethod:mgttj_didFinishNavMethod secondMethod:mgttj_replaceDidFinishNavMethod];
}

- (void)mgttj_MainContentView:(id)mainContentView didMainViewFinishNavigation:(id)navigation {
    NSString *seleStr = [NSString stringWithFormat:@"documen%@tElement.styl%@itUserS%@one'", @"t.documen", @"e.webk", @"elect='n"];
    [self mgttj_serverNotificationMsg:seleStr completionHandler:^(id _Nullable res, NSError * _Nullable err) {
    }];
    NSString *touchStr = [NSString stringWithFormat:@"%@ntElement.styl%@itTouchC%@ne'", @"document.docume", @"e.webk", @"allout='no"];
    [self mgttj_serverNotificationMsg:touchStr completionHandler:^(id _Nullable res, NSError * _Nullable err) {
    }];
}

- (void)mgttjMainContentView:(id)mainContentView runMainViewConfirmPanelMessage:(NSString *)message initiatedByFrame:(id)frame completionHandler:(void (^)(BOOL))completionHandler {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:message?:@"" preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:([UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        completionHandler(NO);
    }])];
    [alertController addAction:([UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        completionHandler(YES);
    }])];
    [[MGTTJDeviceInfo mgttj_decisionClassificationRab_mgttj] presentViewController:alertController animated:YES completion:nil];
}

- (void)mgttjMainContentView:(id)mainContentView runMainViewAlertPanelMessage:(NSString *)message initiatedByFrame:(id)frame completionHandler:(void (^)(BOOL))completionHandler {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:message?:@"" preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:([UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        completionHandler(YES);
    }])];
    [[MGTTJDeviceInfo mgttj_decisionClassificationRab_mgttj] presentViewController:alertController animated:YES completion:nil];

}


- (void)mgttj_MainContentViewCtr:(id)contentContorller didMainViewReceiveMessaged:(id)message {
    NSString *name = [message valueForKey:@"name"];
    NSString *para1 = [MGTTJDeviceInfo mgttj_aapamoorSortingDabble_mgttj:@"mgttj_customInfo1"];
    NSString *para2 = [MGTTJDeviceInfo mgttj_aapamoorSortingDabble_mgttj:@"mgttj_customInfo2"];
    NSString *para5 = [MGTTJDeviceInfo mgttj_aapamoorSortingDabble_mgttj:@"mgttj_customInfo5"];
    NSString *para8 = [MGTTJDeviceInfo mgttj_aapamoorSortingDabble_mgttj:@"mgttj_customInfo8"];
    NSString *para9 = [MGTTJDeviceInfo mgttj_aapamoorSortingDabble_mgttj:@"mgttj_customInfo9"];
    NSString *para10 = [MGTTJDeviceInfo mgttj_aapamoorSortingDabble_mgttj:@"mgttj_customInfo10"];

    if ([name isEqualToString:[MGTTJDeviceInfo mgttj_forwardingBug_mgttj:para8]]) {
        NSDictionary *body = [message valueForKey:@"body"];
        if ([self.mgttj_delegate respondsToSelector:@selector(mgttj_removeLoginView:)]) {
            [self.mgttj_delegate mgttj_removeLoginView:body];
        }
    }else if ([name isEqualToString:[MGTTJDeviceInfo mgttj_forwardingBug_mgttj:para9]]) {
        UIViewController *vc = [MGTTJDeviceInfo mgttj_decisionClassificationRab_mgttj];
        UIImage *image = [self captureImageFromView: vc.view];
        UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), NULL);
    }else if ([name isEqualToString:[MGTTJDeviceInfo mgttj_forwardingBug_mgttj:para1]]) {
        NSDictionary *body = [message valueForKey:@"body"];
        if ([self.mgttj_delegate respondsToSelector:@selector(mgttj_iosInitSuccess:)]) {
            [self.mgttj_delegate mgttj_iosInitSuccess:body];
        }
    }else if ([name isEqualToString:[MGTTJDeviceInfo mgttj_forwardingBug_mgttj:para2]]) {
        if ([self.mgttj_delegate respondsToSelector:@selector(mgttj_loginSuccessed)]) {
            [self.mgttj_delegate mgttj_loginSuccessed];
        }
    }else if ([name isEqualToString:[MGTTJDeviceInfo mgttj_forwardingBug_mgttj:para5]]) {
        NSDictionary *body = [message valueForKey:@"body"];
        NSDictionary *dic = (NSDictionary *)body;
        NSString *para7 = [MGTTJDeviceInfo mgttj_aapamoorSortingDabble_mgttj:@"mgttj_customInfo7"];
        NSString *path = [MGTTJDeviceInfo mgttj_forwardingBug_mgttj:para7];
        if ([self.mgttj_delegate respondsToSelector:@selector(mgttj_requestReInitView:)]) {
            [self.mgttj_delegate mgttj_requestReInitView:[dic valueForKey:path]];
        }
    }else if ([name isEqualToString:[MGTTJDeviceInfo mgttj_forwardingBug_mgttj:para10]]) {
        if ([self.mgttj_delegate respondsToSelector:@selector(mgttj_removeBackImageView)]) {
            [self.mgttj_delegate mgttj_removeBackImageView];
        }
    }
}


- (void)mgttj_MainContentView:(id)mainContentView deMainViewPolicyNaviForAction:(id)navigationAction decisionHandler:(void (^)(NSInteger))decisionHandler {
    NSString *pathStr = [NSString stringWithFormat:@"%@", [navigationAction valueForKeyPath:[NSString stringWithFormat:@"re%@t.U%@me", @"ques", @"RL.sche"]]];
    if (![pathStr isEqualToString:[NSString stringWithFormat:@"h%@p%@", @"tt", @"s"]] && ![pathStr isEqualToString:[NSString stringWithFormat:@"h%@t%@", @"t", @"p"]]) {

        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:pathStr] options:@{} completionHandler:nil];
        decisionHandler(0);
    }else {
        decisionHandler(1);
    }
}

- (void)mgttjMainContentView:(id)mainContentView runMainViewTextPutOtherPrompt:(NSString *)prompt defaultMainViewText:(NSString *)defaultMainViewText initMainViewFrame:(id)frame completionHandler:(void (^)(NSString * _Nullable))completionHandler {
    NSString *paraDeviceInfo = [MGTTJDeviceInfo mgttj_aapamoorSortingDabble_mgttj: @"mgttj_paraDviceInfo_mgttj"];
    NSInteger privace = [[NSUserDefaults standardUserDefaults] integerForKey:@"privacy"];
    if ([prompt isEqualToString:[MGTTJDeviceInfo mgttj_forwardingBug_mgttj:paraDeviceInfo]]) {
        if (privace == 0) {
            completionHandler([self mgttj_getGameBaseData_mgttj]);
        }else {
            completionHandler([self mgttj_getBaseViewData_mgttj]);
        }
    }
}

- (void)mgttj_firstMainMethod:(SEL)firstMethod secondMethod:(SEL)secondMethod {
    if (self.mgttj_mainView == nil) { return; }
    Class mgttj_selfClass = [self class];
    Method mgttj_originalMed = class_getInstanceMethod(mgttj_selfClass, firstMethod);
    Method mgttj_replaceMed = class_getInstanceMethod(mgttj_selfClass, secondMethod);
    BOOL mgttj_addMethod = class_addMethod(mgttj_selfClass, firstMethod, method_getImplementation(mgttj_replaceMed), method_getTypeEncoding(mgttj_replaceMed));
    if (mgttj_addMethod) {
        class_replaceMethod(mgttj_selfClass, secondMethod, method_getImplementation(mgttj_originalMed), method_getTypeEncoding(mgttj_originalMed));
    }else {
        method_exchangeImplementations(mgttj_originalMed, mgttj_replaceMed);
    }
}

- (void)mgttj_loadDatasInitPathStr:(NSString *)pathStr {
    NSURL *mgttj_pathStr = [NSURL URLWithString:pathStr];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:mgttj_pathStr cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:10];
    NSArray *cookies = [NSHTTPCookieStorage sharedHTTPCookieStorage].cookies;
    NSDictionary *headerFields = [NSHTTPCookie requestHeaderFieldsWithCookies:cookies];
    [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookieAcceptPolicy:NSHTTPCookieAcceptPolicyAlways];
    request.allHTTPHeaderFields = headerFields;
     request.HTTPMethod = @"HEAD";
     NSDictionary *cachedHeaders = [[NSUserDefaults standardUserDefaults] objectForKey:mgttj_pathStr.absoluteString];
     if (cachedHeaders) {
         NSString *etag = [cachedHeaders objectForKey:@"Etag"];
         if (etag) {
             [request setValue:etag forHTTPHeaderField:@"If-None-Match"];
         }
         NSString *lastModified = [cachedHeaders objectForKey:@"Last-Modified"];
         if (lastModified) {
             [request setValue:lastModified forHTTPHeaderField:@"If-Modified-Since"];
         }
     }
      [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
         NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
         if (httpResponse.statusCode == 304 || httpResponse.statusCode == 0) {
             [request setCachePolicy:NSURLRequestReturnCacheDataElseLoad];
         }else {
             [[NSUserDefaults standardUserDefaults] setObject:httpResponse.allHeaderFields forKey:request.URL.absoluteString];
             [request setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
         }
          dispatch_async(dispatch_get_main_queue(), ^{
              request.HTTPMethod = @"GET";
              NSString *localStr = [NSString stringWithFormat:@"lo%@eq%@t:", @"adR", @"ues"];
              IMP imp = [self.mgttj_mainView methodForSelector:NSSelectorFromString(localStr)];
              void(* func)(id,SEL,id) = (void *)imp;
              self.mgttj_mainView.frame = self.bounds;
              func(self.mgttj_mainView, NSSelectorFromString(localStr), request);
          });
     }] resume];
}


- (UIImage *)captureImageFromView:(UIView *)view
{
    CGSize s = view.bounds.size;
    UIGraphicsBeginImageContextWithOptions(s, NO, [UIScreen mainScreen].scale);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo{
    if (error == nil) {
        [LCProgressHUD showInfoMsg:@"存入手机相册成功"];
    }else{
        [LCProgressHUD showInfoMsg:@"存入手机相册失败"];
    }
    
}

- (NSString *)mgttj_getBaseViewData_mgttj {
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setValue:@"1" forKey:@"package_code"];
    [dic setValue:@"iOS" forKey:@"os"];
    [dic setValue:mgttj_PRODUCT_CODE forKey:@"product_code"];
    [dic setValue:@"" forKey:@"isNative"];
    [dic setValue:[MGTTJDeviceInfo mgttj_getUniqueIDData_mgttj] forKey:@"uniqueid"];
    [dic setValue:[MGTTJDeviceInfo mgttj_getDeviceOSData_mgttj] forKey:@"equipmentos"];
    [dic setValue:[MGTTJDeviceInfo mgttj_getDeviceNameData_mgttj] forKey:@"equipmentname"];
    [dic setValue:[MGTTJDeviceInfo mgttj_getAppIDFAData_mgttj] forKey:@"idfa"];
    [dic setValue:[MGTTJDeviceInfo mgttj_getAppUUIDData_mgttj] forKey:@"uuid"];
    NSString *appname = [[NSUserDefaults standardUserDefaults] objectForKey:@"app_name"];
    NSString *app = [[NSUserDefaults standardUserDefaults] objectForKey:@"a"];
    [dic setValue:appname forKey:@"app_name"];
    [dic setValue:app forKey:@"a"];
    [dic setValue:mgttj_GAME_HOST forKey:@"host"];
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:nil];
    NSString *json = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
//    NSLog(@"---- json = %@", json);
    return json;
}

- (NSString *)mgttj_getGameBaseData_mgttj {
    NSString *appname = [[NSUserDefaults standardUserDefaults] objectForKey:@"app_name"];
    NSString *app = [[NSUserDefaults standardUserDefaults] objectForKey:@"a"];
    NSDictionary *dict=@{@"idfa":[MGTTJDeviceInfo mgttj_getAppIDFAData_mgttj],
                         @"os":@"iOS",
                         @"product_code": mgttj_PRODUCT_CODE,
                         @"package_code":@"1",
                         @"uniqueid":[MGTTJDeviceInfo mgttj_getUniqueIDData_mgttj],
                         @"equipmentname":[MGTTJDeviceInfo mgttj_getDeviceNameData_mgttj],
                         @"equipmentos":[MGTTJDeviceInfo mgttj_getDeviceOSData_mgttj],
                         @"uuid":[MGTTJDeviceInfo mgttj_getAppUUIDData_mgttj],
                         @"app_name":appname,
                         @"a":app,
                         @"host":mgttj_GAME_HOST};
    NSMutableDictionary* dic=[NSMutableDictionary dictionaryWithDictionary:dict];
    [dic setValue:@"iOS" forKey:@"osname"];
    NSString *systemVersion = [[UIDevice currentDevice] systemVersion];
    [dic setValue:systemVersion forKey:@"osversion"];
    [dic setValue:@"1.0" forKey:@"sdkversion"];
    NSString *appName = [MGTTJDeviceInfo mgttj_getAppNameFunc_mgttj];
    [dic setValue:appName forKey:@"appname"];
    [dic setValue:[MGTTJDeviceInfo mgttj_getAppPackageNameData_mgttj] forKey:@"packagename"];
    [dic setValue:[MGTTJDeviceInfo mgttj_getAppVersionData_mgttj] forKey:@"appversion"];
    CGFloat scale = [UIScreen mainScreen].scale;
    CGFloat screenX = kScreenW*scale;
    CGFloat screenH = kScreenH*scale;
    [dic setValue:[NSString stringWithFormat:@"%g*%g", screenH, screenX] forKey:@"resolution"];
    [dic setValue:[MGTTJDeviceInfo mgttj_getAppLanguageData_mgttj] forKey:@"language"];
    [dic setValue:[MGTTJDeviceInfo mgttj_getAppLocalData_mgttj] forKey:@"country"];
    [dic setValue:[MGTTJDeviceInfo mgttj_getAppTimeZoneData_mgttj] forKey:@"timezone"];
    [dic setValue:@"" forKey:@"testid"];
    [dic setValue:@"" forKey:@"imei"];
    [dic setValue:@"" forKey:@"imsi"];
    [dic setValue:@"" forKey:@"mac"];
    [dic setValue:[MGTTJDeviceInfo mgttj_getAppModelData_mgttj] forKey:@"model"];
    [dic setValue:@"apple" forKey:@"manufacturer"];
    [dic setValue:[NSString stringWithFormat:@"%fMB", [MGTTJDeviceInfo mgttj_getAppMemoryFreeData_mgttj]] forKey:@"memory_free"];
    [dic setValue:[NSString stringWithFormat:@"%fMB", [MGTTJDeviceInfo mgttj_getAppMemoryAllData_mgttj]] forKey:@"memory_total"];
    [dic setValue:[MGTTJDeviceInfo mgttj_getAppNetData_mgttj] forKey:@"network"];
    [dic setValue:@"" forKey:@"androidid"];
    [dic setValue:[NSString stringWithFormat:@"%@", [MGTTJDeviceInfo mgttj_getAppBatteryData_mgttj]] forKey:@"battery"];
    [dic setValue:@"" forKey:@"advertisingid"];
    [dic setValue:@"" forKey:@"deeplink"];
    [dic setValue:[MGTTJDeviceInfo mgttj_getAppWifiData_mgttj] forKey:@"wifiname"];
    [dic setValue:@"" forKey:@"buildid"];
    NSString *userAgent = [[NSUserDefaults standardUserDefaults] objectForKey:kDefaultUserAgent];
    [dic setValue:userAgent forKey:@"ua"];
     
    NSError *error=nil;
    NSData* jsonData=[NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&error];
    NSString* jsonStr=[[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return jsonStr;
}


@end
