//
//  _____________________Tests.m
//  超级无敌复活版帅气今日头条优化版无敌吊炸天Tests
//
//  Created by rongtong on 16/2/17.
//  Copyright © 2016年 iosqun328218600. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface _____________________Tests : XCTestCase

@end

@implementation _____________________Tests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    NSLog(@"自定义测试testExample");
    
    int a = 3;
    
    XCTAssertTrue(a== 0,@"a不等于0");
}

- (void)testDIY
{
   
  

}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
