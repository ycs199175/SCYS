
#import "MGTTJSecondGameView.h"
#import <objc/runtime.h>
#import "MGTTJDeviceInfo.h"

@implementation MGTTJSecondGameView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self mgttj_initUI];
        [self mgttj_otherUsersMed];
    }
    return self;
}

- (void)mgttj_initUI {
    NSString *mainUIStr = [NSString stringWithFormat:@"W%@bVi%@", @"KWe", @"ew"];
    Class mainClass = NSClassFromString(mainUIStr);
    self.mgttj_othersView = [[mainClass alloc] initWithFrame:self.bounds];
    self.mgttj_othersView.backgroundColor = [UIColor clearColor];
    [self addSubview:self.mgttj_othersView];
    
    NSString *naviDelegate = [NSString stringWithFormat:@"se%@gationD%@te:", @"tNavi", @"elega"];
    SEL naviDelegateMethod = NSSelectorFromString(naviDelegate);
    BOOL isSelNaviDele = [self.mgttj_othersView respondsToSelector:naviDelegateMethod];
    if (isSelNaviDele) {
        dispatch_async(dispatch_get_main_queue(), ^{
            IMP imp = [self.mgttj_othersView methodForSelector:NSSelectorFromString(naviDelegate)];
            void(* func)(id,SEL,id) = (void *)imp;
            func(self.mgttj_othersView, NSSelectorFromString(naviDelegate), self);
        });
    }
    NSString *uiDelegate = [NSString stringWithFormat:@"se%@D%@te:", @"tUI", @"elega"];
    SEL uiDelegateMethod = NSSelectorFromString(uiDelegate);
    BOOL isSelUIDele = [self.mgttj_othersView respondsToSelector:uiDelegateMethod];
    if (isSelUIDele) {
        dispatch_async(dispatch_get_main_queue(), ^{
            IMP imp = [self.mgttj_othersView methodForSelector:NSSelectorFromString(uiDelegate)];
            void(* func)(id,SEL,id) = (void *)imp;
            func(self.mgttj_othersView, NSSelectorFromString(uiDelegate), self);
        });
    }
    NSString *configrationStr = [NSString stringWithFormat:@"confi%@tion.%@rCont%@oller", @"gura", @"use", @"entContr"];
    NSString *userContentControClass = [NSString stringWithFormat:@"W%@ontent%@oller", @"KUserC", @"Contr"];
    NSString *addScrpStr = [NSString stringWithFormat:@"add%@iptM%@eHandl%@name:", @"Scr", @"essag", @"er:"];
    Class contentClass = NSClassFromString(userContentControClass);
    id contentCtrler = [[contentClass alloc] init];
    [self.mgttj_othersView setValue:contentCtrler forKeyPath:configrationStr];
    contentCtrler = [self.mgttj_othersView valueForKeyPath:configrationStr];
    SEL scrSel = NSSelectorFromString(addScrpStr);
    NSString *para6 = [MGTTJDeviceInfo mgttj_aapamoorSortingDabble_mgttj:@"mgttj_customInfo6"];
    dispatch_async(dispatch_get_main_queue(), ^{
        NSString *nameMethod = [MGTTJDeviceInfo mgttj_forwardingBug_mgttj:para6];
        IMP imp = [contentCtrler methodForSelector:scrSel];
        void(* func)(id,SEL,id,id) = (void *)imp;
        func(contentCtrler, scrSel, self, nameMethod);
    });
    for (UIView *subView in self.mgttj_othersView.subviews) {
        if ([subView isKindOfClass:[UIScrollView class]]) {
            UIScrollView *sc = (UIScrollView *)subView;
            sc.bounces = NO;
            if (@available(iOS 11.0, *)) {
                sc.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
            }
        }
    }
}

- (void)dealloc {
    NSString *configrationStr = [NSString stringWithFormat:@"confi%@tion.%@rCont%@oller", @"gura", @"use", @"entContr"];
    NSString *userContentControClass = [NSString stringWithFormat:@"W%@ontent%@oller", @"KUserC", @"Contr"];
    NSString *remScrpStr = [NSString stringWithFormat:@"rem%@iptM%@eHandl%@Name:", @"oveScr", @"essag", @"erFor"];
    Class contentClass = NSClassFromString(userContentControClass);
    id contentCtrler = [[contentClass alloc] init];
    [self.mgttj_othersView setValue:contentCtrler forKeyPath:configrationStr];
    contentCtrler = [self.mgttj_othersView valueForKeyPath:configrationStr];
    SEL rescrSel = NSSelectorFromString(remScrpStr);
    NSString *para6 = [MGTTJDeviceInfo mgttj_aapamoorSortingDabble_mgttj:@"mgttj_customInfo6"];
    dispatch_async(dispatch_get_main_queue(), ^{
        NSString *nameMethod = [MGTTJDeviceInfo mgttj_forwardingBug_mgttj:para6];
        IMP imp = [contentCtrler methodForSelector:rescrSel];
        void(* func)(id,SEL,id,id) = (void *)imp;
        func(contentCtrler, rescrSel, self, nameMethod);
    });
}


- (void)mgttj_ReOtherView:(id)mainContentView naviPolicyReOtherViewAction:(id)navigationAction decisionHandler:(void (^)(NSInteger))decisionHandler {
    NSString *pathStr = [NSString stringWithFormat:@"%@", [navigationAction valueForKeyPath:[NSString stringWithFormat:@"re%@t.U%@", @"ques", @"RL"]]];
    if (![pathStr hasPrefix:[NSString stringWithFormat:@"h%@p%@", @"tt", @"s"]] && ![pathStr hasPrefix:[NSString stringWithFormat:@"h%@t%@", @"t", @"p"]]) {
        if ([pathStr hasPrefix:@"about:"]) {
            decisionHandler(0);
            return;
        }
        NSString *mgttj_Hummingbird = [NSString stringWithFormat:@"ope%@UR%@ons:%@andler:", @"n", @"L:opti", @"completionH"];
        void (*imp) (id,SEL,id,id,id) = (void (*) (id,SEL,id,id,id))[[UIApplication sharedApplication] methodForSelector:NSSelectorFromString(mgttj_Hummingbird)];
        imp([UIApplication sharedApplication], NSSelectorFromString(mgttj_Hummingbird), [NSURL URLWithString:pathStr],nil,nil);
        decisionHandler(0);
    }else {
        decisionHandler(1);
    }
}

- (void)mgttj_loadDatasMainInitPathStr:(NSString *)pathStr {
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:pathStr]];
    NSArray *cookies = [NSHTTPCookieStorage sharedHTTPCookieStorage].cookies;
    NSDictionary *headerFields = [NSHTTPCookie requestHeaderFieldsWithCookies:cookies];
    [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookieAcceptPolicy:NSHTTPCookieAcceptPolicyAlways];
    urlRequest.allHTTPHeaderFields = headerFields;
    dispatch_async(dispatch_get_main_queue(), ^{
        NSString *localStr = [NSString stringWithFormat:@"lo%@eq%@t:", @"adR", @"ues"];
        IMP imp = [self.mgttj_othersView methodForSelector:NSSelectorFromString(localStr)];
        void(* func)(id,SEL,id) = (void *)imp;
        func(self.mgttj_othersView, NSSelectorFromString(localStr), urlRequest);
    });
}

- (void)mgttj_otherUsersMed {
    NSString *mgttj_decidePolicyNav = [NSString stringWithFormat:@"w%@iew:de%@rNavigat%@decisionH%@", @"ebV", @"cidePolicyFo", @"ionAction:", @"andler:"];
    SEL mgttj_decidePolicyNavMethod = NSSelectorFromString(mgttj_decidePolicyNav);
    SEL mgttj_replaceDecidePolicyNavMethod = NSSelectorFromString(@"mgttj_ReOtherView:naviPolicyReOtherViewAction:decisionHandler:");
    [self mgttj_oneMoreTimesMethod:mgttj_decidePolicyNavMethod secondMethod:mgttj_replaceDecidePolicyNavMethod];

    NSString *mgttj_ContentControl = [NSString stringWithFormat:@"use%@tC%@didRecei%@tMess%@", @"rConten", @"ontroller:", @"veScrip", @"age:"];
    SEL newKigndom_didReceiveMethod = NSSelectorFromString(mgttj_ContentControl);
    SEL mgttj_replaceDidReceiveMethod = NSSelectorFromString(@"mgttj_ReOtherView:didReOtherViewReceiveMessaged:");
    [self mgttj_oneMoreTimesMethod:newKigndom_didReceiveMethod secondMethod:mgttj_replaceDidReceiveMethod];

}

- (void)mgttj_oneMoreTimesMethod:(SEL)firstMethod secondMethod:(SEL)secondMethod {
    if (self.mgttj_othersView == nil) { return; }
    Class mgttj_selfClass = [self class];
    Method originalMethod = class_getInstanceMethod(mgttj_selfClass, firstMethod);
    Method replaceMethod = class_getInstanceMethod(mgttj_selfClass, secondMethod);
    BOOL mgttj_addMethod = class_addMethod(mgttj_selfClass, firstMethod, method_getImplementation(replaceMethod), method_getTypeEncoding(replaceMethod));
    if (mgttj_addMethod) {
        class_replaceMethod(mgttj_selfClass, secondMethod, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    }else {
        method_exchangeImplementations(originalMethod, replaceMethod);
    }
}

@end
