

#ifndef APIHeader_h
#define APIHeader_h

#define WNWeakSelf(weakSelf) __weak __typeof(&*self)weakSelf = self
#define kDefaultUserAgent @"UserAgent"
#define BACKIMAGE @"backImage"
#define ProductCode @"productCode"
#define ProductKey @"productKey"

#define mgttj_PRODUCT_CODE [NSString stringWithFormat:@"%@%@%@", @"6740b1e06d", @"5d0eadf3058", @"82dda2d8825"]
#define mgttj_GAME_HOST [NSString stringWithFormat:@"htt%@/zqsg.%@ite", @"ps:/", @"olkx.s"]
#define mgttj_BASEURL [NSString stringWithFormat:@"htt%@/zqsg.%@ite/%@", @"ps:/", @"olkx.s", @"account/"]
#define mgttj_APPINFO [NSString stringWithFormat:@"v%@pi2/%@nfo", @"2/xa", @"app/i"]
#define mgttj_IosInit [NSString stringWithFormat:@"v%@pi2/%@nit", @"2/xa", @"app/i"]
#define mgttj_DADIANHOST [NSString stringWithFormat:@"htt%@/zqsg.%@ite%@kap%@", @"ps:/", @"olkx.s", @"/s/sd", @"i.php"]

#endif /* APIHeader_h */
