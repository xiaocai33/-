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
/** 屏幕宽度 */
#define viewW self.view.frame.size.width
/** 屏幕高度 */
#define viewH self.view.frame.size.height
/** 子控制器高度 */
#define subViewH (viewH - navigationH - navBarH)
/** 导航条高度 */
#define navigationH 64
/** 导航按钮高度 */
#define navBarH 44
/** 子控制器Y值 */
#define subViewY (navigationH + navBarH)
@interface XCMainController() <XCNavBarDelegate>
@property (nonatomic, strong) XCOneController *oneVc;
@property (nonatomic, strong) XCTwoViewController *twoVc;
@property (nonatomic, strong) XCThreeController *threeVc;
@property (nonatomic, strong) XCFourController *fourVc;
/** 当前控制器 */
@property (nonatomic, strong) UIViewController *currentView;

@end

@implementation XCMainController

- (void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:0.7];
    //设置导航栏题目
    self.navigationItem.title = @"主控制器";
    //添加导航条
    XCNavBar *navBar = [[XCNavBar alloc] init];
    navBar.delegate = self;
    navBar.frame = CGRectMake(0, navigationH, viewW, navBarH);
    [self.view addSubview:navBar];
    
    //添加自控制器
    self.oneVc = [[XCOneController alloc] init];
    self.oneVc.view.frame = CGRectMake(0, subViewY, viewW, subViewH);
    [self addChildViewController:self.oneVc];
    
    self.twoVc = [[XCTwoViewController alloc] init];
    self.twoVc.view.frame = CGRectMake(0, subViewY, viewW, subViewH);
    [self addChildViewController:self.twoVc];
    
    self.threeVc = [[XCThreeController alloc] init];
    self.threeVc.view.frame = CGRectMake(0, subViewY, viewW, subViewH);
    [self addChildViewController:self.threeVc];
    
    self.fourVc = [[XCFourController alloc] init];
    self.fourVc.view.frame = CGRectMake(0, subViewY, viewW, subViewH);
    [self addChildViewController:self.fourVc];
    
    //设置默认控制器
    self.currentView = self.oneVc;
    [self.view addSubview:self.oneVc.view];
}

#pragma mark - XCNavBarDelegate代理方法
- (void)navBar:(XCNavBar *)navBar didSelectedButton:(XCNavBarButtonType)buttonType{
    switch (buttonType) {
        case XCNavBarButtonTypeOne:
            [self replaceOldViewController:self.currentView toNewViewController:self.oneVc];
            break;
        case XCNavBarButtonTypeTwo:
            [self replaceOldViewController:self.currentView toNewViewController:self.twoVc];
            break;
        case XCNavBarButtonTypeThree:
            [self replaceOldViewController:self.currentView toNewViewController:self.threeVc];
            break;
        case XCNavBarButtonTypeFour:
            [self replaceOldViewController:self.currentView toNewViewController:self.fourVc];
            break;
        default:
            break;
    }
}

/**
 *  控制器切换方法实现
 */
- (void)replaceOldViewController:(UIViewController *)oldVc toNewViewController:(UIViewController *)newVc{
    if (self.currentView == newVc) return;
    /**
     *  transitionFromViewController:toViewController:duration:options:animations:completion:
     *  fromViewController	  当前显示在父视图控制器中的子视图控制器
     *  toViewController		将要显示的姿势图控制器
     *  duration				动画时间(这个属性,old friend 了 O(∩_∩)O)
     *  options				 动画效果(渐变,从下往上等等,具体查看API)UIViewAnimationOptionTransitionCrossDissolve
     *  animations			  转换过程中得动画
     *  completion			  转换完成
     */
    [self addChildViewController:newVc];
    [self transitionFromViewController:oldVc toViewController:newVc duration:0.25 options:UIViewAnimationOptionTransitionCrossDissolve animations:nil completion:^(BOOL finished) {
        if (finished) {
            [newVc didMoveToParentViewController:self];
            [oldVc willMoveToParentViewController:nil];
            [oldVc removeFromParentViewController];
            self.currentView = newVc;
        }else{
            self.currentView = oldVc;
        }
    }];
}

@end
