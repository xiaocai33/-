//
//  XCMainController.m
//  控制器切换(网易新闻效果)
//
//  Created by 小蔡 on 16/3/11.
//  Copyright © 2016年 xiaocai. All rights reserved.
//

#import "XCMainController.h"
#import "XCNavBar.h"
#import "XCOneController.h"
#import "XCTwoViewController.h"
#import "XCThreeController.h"
#import "XCFourController.h"

@interface XCMainController() <XCNavBarDelegate>

@end

@implementation XCMainController

- (void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor purpleColor];
    //设置导航栏题目
    self.navigationItem.title = @"主控制器";
    //添加导航条
    XCNavBar *navBar = [[XCNavBar alloc] init];
    navBar.delegate = self;
    navBar.frame = CGRectMake(0, 64, self.view.frame.size.width, 44);
    [self.view addSubview:navBar];
}

#pragma mark - XCNavBarDelegate代理方法
- (void)navBar:(XCNavBar *)navBar didSelectedButton:(XCNavBarButtonType)buttonType{
    switch (buttonType) {
        case XCNavBarButtonTypeOne:
            NSLog(@"one");
            break;
        case XCNavBarButtonTypeTwo:
            NSLog(@"two");
            break;
        case XCNavBarButtonTypeThree:
            NSLog(@"three");
            break;
        case XCNavBarButtonTypeFour:
            NSLog(@"four");
            break;
        default:
            break;
    }
}


@end
