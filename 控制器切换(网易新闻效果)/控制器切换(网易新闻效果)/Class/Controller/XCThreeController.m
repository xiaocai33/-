//
//  XCThreeController.m
//  控制器切换(网易新闻效果)
//
//  Created by 小蔡 on 16/3/11.
//  Copyright © 2016年 xiaocai. All rights reserved.
//

#import "XCThreeController.h"

@implementation XCThreeController
- (void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
    UILabel *label = [[UILabel alloc] init];
    label.text = @"ThreeViewController";
    label.center = self.view.center;
    [self.view addSubview:label];
}

@end
