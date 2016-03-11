//
//  XCNavBar.h
//  控制器切换(网易新闻效果)
//
//  Created by 小蔡 on 16/3/11.
//  Copyright © 2016年 xiaocai. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum{
    XCNavBarButtonTypeOne = 0,
    XCNavBarButtonTypeTwo,
    XCNavBarButtonTypeThree,
    XCNavBarButtonTypeFour
} XCNavBarButtonType;
//代理实现
@class XCNavBar;
@protocol XCNavBarDelegate <NSObject>
@optional//可选的
- (void)navBar:(XCNavBar *)navBar didSelectedButton:(XCNavBarButtonType)buttonType;

@end
@interface XCNavBar : UIView

@property (nonatomic, weak) id<XCNavBarDelegate> delegate;

@end
