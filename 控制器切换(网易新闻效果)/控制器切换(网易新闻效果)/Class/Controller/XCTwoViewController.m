//
//  XCTwoViewController.m
//  控制器切换(网易新闻效果)
//
//  Created by 小蔡 on 16/3/11.
//  Copyright © 2016年 xiaocai. All rights reserved.
//

#import "XCTwoViewController.h"

@implementation XCTwoViewController
- (void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    UILabel *label = [[UILabel alloc] init];
    label.text = @"TwoViewController";
    label.center = self.view.center;
    [self.view addSubview:label];
}

@end
