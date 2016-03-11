//
//  XCNavBar.m
//  控制器切换(网易新闻效果)
//
//  Created by 小蔡 on 16/3/11.
//  Copyright © 2016年 xiaocai. All rights reserved.
//

#import "XCNavBar.h"
@interface XCNavBar()

@property (nonatomic, strong) UIButton *selectedBtn;

@end

@implementation XCNavBar

//只加载一次
+ (void)initialize{
    XCNavBar *navBar = [[XCNavBar alloc] init];
    navBar.backgroundColor = [UIColor colorWithRed:0.7 green:0.7 blue:0.7 alpha:0.9];
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addButtonWithTitle:@"one" buttonType:XCNavBarButtonTypeOne];
        [self addButtonWithTitle:@"two" buttonType:XCNavBarButtonTypeTwo];
        [self addButtonWithTitle:@"three" buttonType:XCNavBarButtonTypeThree];
        [self addButtonWithTitle:@"four" buttonType:XCNavBarButtonTypeFour];
    }
    return self;
}


- (void)addButtonWithTitle:(NSString *)title buttonType:(XCNavBarButtonType)type{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    
    [btn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateDisabled];
    
    btn.tag = type;
    [self addSubview:btn];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)btnClick:(UIButton *)btn{
    self.selectedBtn.enabled = YES;
    btn.enabled = NO;
    self.selectedBtn = btn;
    
}
//计算子控件的位置
- (void)layoutSubviews{
    [super layoutSubviews];
    NSInteger count = self.subviews.count;
    CGFloat btnW = self.bounds.size.width / count;
    CGFloat btnH = self.bounds.size.height;
    CGFloat btnX = 0;
    CGFloat btnY = 0;
    for (int i =0 ; i<count; i++) {
        UIButton *btn = self.subviews[i];
        btnX = i * btnW;
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
    }
}


@end




