//
//  StrategyExampleTests.m
//  StrategyExampleTests
//
//  Created by Sam Lai on 2018/3/31.
//  Copyright © 2018 YSDT. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "YSDTDiscount.h"

@interface StrategyExampleTests : XCTestCase
@property (nonatomic, strong) YSDTHappyGoRedeemDiscountMethod *happyGoDiscountMethod;
@end

@implementation StrategyExampleTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.happyGoDiscountMethod = [[YSDTHappyGoRedeemDiscountMethod alloc] init];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    self.happyGoDiscountMethod = nil;
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

- (void)testHappyGoRedeemFullDiscount
{
    NSDictionary *discountInfo = @{@"price":@"680", @"maxAvailiableDiscount":@"20000", @"discount":@"680"};
    
    NSInteger priceAfterDiscount = [self.happyGoDiscountMethod priceAfterDiscount:discountInfo];
    
    XCTAssertTrue(priceAfterDiscount == 0, @"Full Happy Go discount test fail");
}

- (void)testHappyGoRedeemDiscountGreaterThanPrice
{
    NSDictionary *discountInfo = @{@"price":@"680", @"maxAvailiableDiscount":@"20000", @"discount":@"1680"};
    
    NSInteger priceAfterDiscount = [self.happyGoDiscountMethod priceAfterDiscount:discountInfo];
    
    XCTAssertTrue(priceAfterDiscount == 0, @"Happy Go discount greater than price test fail");
}

- (void)testHappyGoRedeemDiscountLessThanPrice
{
    NSDictionary *discountInfo = @{@"price":@"680", @"maxAvailiableDiscount":@"20000", @"discount":@"100"};
    
    NSInteger priceAfterDiscount = [self.happyGoDiscountMethod priceAfterDiscount:discountInfo];
    
    XCTAssertTrue(priceAfterDiscount == 580, @"Happy Go discount less than price test fail");
}

- (void)testHappyGoRedeemDiscountEqualMaxAvailableDiscount
{
    NSDictionary *discountInfo = @{@"price":@"680", @"maxAvailiableDiscount":@"1000", @"discount":@"1000"};
    
    NSInteger priceAfterDiscount = [self.happyGoDiscountMethod priceAfterDiscount:discountInfo];
    
    XCTAssertTrue(priceAfterDiscount == 0, @"Happy Go discount equal max available discount test fail");
}

- (void)testHappyGoRedeemDiscountGreaterThanMaxAvailableDiscount
{
    NSDictionary *discountInfo = @{@"price":@"680", @"maxAvailiableDiscount":@"1000", @"discount":@"2000"};
    
    NSInteger priceAfterDiscount = [self.happyGoDiscountMethod priceAfterDiscount:discountInfo];
    
    XCTAssertTrue(priceAfterDiscount == 0, @"Happy Go discount greater than max available discount test fail");
}

- (void)testHappyGoRedeemDiscountLessThanMaxAvailableDiscount
{
    NSDictionary *discountInfo = @{@"price":@"680", @"maxAvailiableDiscount":@"20000", @"discount":@"100"};
    
    NSInteger priceAfterDiscount = [self.happyGoDiscountMethod priceAfterDiscount:discountInfo];
    
    XCTAssertTrue(priceAfterDiscount == 580, @"Happy Go discount less than max available discount test fail");
}

- (void)testHappyGoRedeemDiscountWithNoAnyDiscount
{
    NSDictionary *discountInfo = @{@"price":@"680", @"maxAvailiableDiscount":@"0", @"discount":@"100"};
    
    NSInteger priceAfterDiscount = [self.happyGoDiscountMethod priceAfterDiscount:discountInfo];
    
    XCTAssertTrue(priceAfterDiscount == 680, @"Happy Go discount with no any discount test fail");
}

- (void)testHappyGoRedeemDiscountLessThanPriceButGreaterThanMaxAvailableDiscount
{
    NSDictionary *discountInfo = @{@"price":@"680", @"maxAvailiableDiscount":@"100", @"discount":@"500"};
    
    NSInteger priceAfterDiscount = [self.happyGoDiscountMethod priceAfterDiscount:discountInfo];
    
    XCTAssertTrue(priceAfterDiscount == 580, @"Happy Go discount with no any discount test fail");
}

- (void)testHappyGoRedeemInvaildDiscount
{
    NSDictionary *discountInfo = @{@"price":@"680", @"maxAvailiableDiscount":@"1000", @"discount":@"-500"};
    
    NSInteger priceAfterDiscount = [self.happyGoDiscountMethod priceAfterDiscount:discountInfo];
    
    XCTAssertTrue(priceAfterDiscount == 680, @"Happy Go redeem invaild discount test fail");
}

- (void)testHappyGoRedeemInvaildPrice
{
    NSDictionary *discountInfo = @{@"price":@"-680", @"maxAvailiableDiscount":@"1000", @"discount":@"500"};
    
    NSInteger priceAfterDiscount = [self.happyGoDiscountMethod priceAfterDiscount:discountInfo];
    
    XCTAssertTrue(priceAfterDiscount == 0, @"Happy Go redeem invaild discount test fail");
}

@end
