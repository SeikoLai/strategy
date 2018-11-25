//
//  YSDTDiscount.h
//  StrategyExample
//
//  Created by Sam Lai on 2018/6/8.
//  Copyright © 2018 YSDT. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, YSDTDiscountType) {
    YSDTDiscountTypeOfCoupon,
    YSDTDiscountTypeOfDiscountCode,
    YSDTDiscountTypeOfHappyGoRedeem,
    YSDTDiscountTypeOfWelfareRedeem
};

@interface YSDTDiscountMethod : NSObject
- (NSInteger)priceAfterDiscount:(NSDictionary *)params;
- (NSInteger)priceBeforeDiscount:(NSDictionary *)params;
@end

@interface YSDTDiscountCodeDiscountMethod : YSDTDiscountMethod

@end

@interface YSDTCouponDiscountMethod : YSDTDiscountMethod

@end

@interface YSDTHappyGoRedeemDiscountMethod : YSDTDiscountMethod

@end

@interface YSDTWelfareRedeemDiscountMethod : YSDTDiscountMethod

@end

@interface YSDTDiscount : NSObject
@property(nonatomic, strong) NSObject *member;
@property(nonatomic, strong) NSObject *cart;
@property(nonatomic, strong) NSArray<YSDTDiscountMethod *> *methods;
- (NSInteger)discountPrice;
- (NSInteger)discountPriceForDiscountMethod:(YSDTDiscountMethod *)discountMethod;
@end

@interface FridayDiscount : YSDTDiscount

@end

@interface FridayPlusDiscount : YSDTDiscount

@end

