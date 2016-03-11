//
//  XCMainController.m
//  控制器切换(网易新闻效果)
//
//  Created by 小蔡 on 16/3/11.
//  Copyright © 2016年 xiaocai. All rights reserved.
//

#import "XCMainController.h"
#import "XCNavBar.h"

@implementation XCMainController

- (void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor purpleColor];
    //设置导航栏题目
    self.navigationItem.title = @"主控制器";
    //添加导航条
    XCNavBar *navBar = [[XCNavBar alloc] init];
    navBar.frame = CGRectMake(0, 64, self.view.frame.size.width, 44);
    [self.view addSubview:navBar];
}


@end
