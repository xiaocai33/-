//
//  XCFourController.m
//  控制器切换(网易新闻效果)
//
//  Created by 小蔡 on 16/3/11.
//  Copyright © 2016年 xiaocai. All rights reserved.
//

#import "XCFourController.h"

@implementation XCFourController
- (void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor purpleColor];
    UILabel *label = [[UILabel alloc] init];
    label.text = @"FourViewController";
    label.frame = CGRectMake(140, 200, 200, 100);
    [self.view addSubview:label];
}

@end
