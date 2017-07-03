//
//  CAShapeLayerClass1UITests.m
//  CAShapeLayerClass1UITests
//
//  Created by 张科 on 16/3/14.
//  Copyright © 2016年 张科. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface CAShapeLayerClass1UITests : XCTestCase

@end

@implementation CAShapeLayerClass1UITests

- (void)setUp {
    [super setUp];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    [[[XCUIApplication alloc] init] launch];
    
    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // Use recording to get started writing UI tests.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

@end
