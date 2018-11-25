//
//  YSDTDiscount.m
//  StrategyExample
//
//  Created by Sam Lai on 2018/6/8.
//  Copyright © 2018 YSDT. All rights reserved.
//

#import "YSDTDiscount.h"

static NSString * const kTotal = @"total";
static NSString * const kDiscount = @"discount";
static NSString * const kPrice = @"price";
static NSString * const kMember = @"member";
static NSString * const kCart = @"cart";
static NSString * const kMaxAvailableDiscount = @"maxAvailiableDiscount";
static NSString * const kSourePath = @"sourcePath";

@implementation YSDTDiscountMethod
- (NSInteger)priceAfterDiscount:(NSDictionary *)params
{
    [self doesNotRecognizeSelector:_cmd];
    [NSException raise:NSInternalInconsistencyException format:@"Please implementation -priceAfterDiscount: in subclass method"];
    return NSNotFound;
}
- (NSInteger)priceBeforeDiscount:(NSDictionary *)params
{
    [self doesNotRecognizeSelector:_cmd];
    [NSException raise:NSInternalInconsistencyException format:@"Please implementation -priceBeforeDiscount: in subclass method"];
    return NSNotFound;
}
@end

@implementation YSDTDiscountCodeDiscountMethod
- (NSInteger)priceAfterDiscount:(NSDictionary *)params
{
    // 1. Fetch discount code from member object.
    // 2. Call api validate discount code .
    // 3. Used cart price minues api response discount code can discount price.
    // 4. When discount code is invalid return origin cart price.
    return 0;
}
- (NSInteger)priceBeforeDiscount:(NSDictionary *)params
{
    return 0;
}
@end

@implementation YSDTCouponDiscountMethod
- (NSInteger)priceAfterDiscount:(NSDictionary *)params
{
    return 0;
}
- (NSInteger)priceBeforeDiscount:(NSDictionary *)params
{
    return 0;
}
@end

@implementation YSDTHappyGoRedeemDiscountMethod
- (NSInteger)priceAfterDiscount:(NSDictionary *)params
{
    NSInteger price = [params[kPrice] integerValue];
    price = price < 0 ? 0 : price;
    
    NSInteger maxAvailableDiscount = [params[kMaxAvailableDiscount] integerValue];
    maxAvailableDiscount = maxAvailableDiscount < 0 ? 0 : maxAvailableDiscount;
    
    NSInteger discount = [params[kDiscount] integerValue];
    discount = discount < 0 ? 0 : discount;
    
    NSInteger availableDiscount = MIN(discount, maxAvailableDiscount);
    
    return price >= availableDiscount ? price - availableDiscount : price - price;
}
- (NSInteger)priceBeforeDiscount:(NSDictionary *)params
{
    return 0;
}
@end

@implementation YSDTWelfareRedeemDiscountMethod
- (NSInteger)priceAfterDiscount:(NSDictionary *)params
{
    return 0;
}
- (NSInteger)priceBeforeDiscount:(NSDictionary *)params
{
    return 0;
}
@end

@implementation YSDTDiscount
- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}
- (NSInteger)discountPrice {
    NSInteger price = 0;//cart price
    for (YSDTDiscountMethod *method in self.methods) {
        price = [method priceAfterDiscount:@{kPrice:[@(price) stringValue], kMaxAvailableDiscount:@10000, kDiscount:@100, kSourePath:@"https://www.friday.tw"}];
    }
    return price;
}
- (NSInteger)discountPriceForDiscountMethod:(YSDTDiscountMethod *)discountMethod
{
    NSInteger price = 0;// cart price
    for (YSDTDiscountMethod *method in self.methods) {
        if (method == discountMethod) {
            price = [method priceBeforeDiscount:@{kPrice:[@(price) stringValue], kMaxAvailableDiscount:@10000, kDiscount:@100, kSourePath:@"https://www.friday.tw"}];
            break;
        }
    }
    return price;
}
@end

@implementation FridayDiscount
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.methods = @[[YSDTDiscountCodeDiscountMethod new], [YSDTCouponDiscountMethod new], [YSDTHappyGoRedeemDiscountMethod new], [YSDTWelfareRedeemDiscountMethod new]];
    }
    return self;
}
@end

@implementation FridayPlusDiscount
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.methods = @[[YSDTDiscountCodeDiscountMethod new], [YSDTCouponDiscountMethod new]];
    }
    return self;
}
@end
