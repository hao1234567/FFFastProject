//
//  FFBaseController.h
//  FFFastProject
//
//  Created by TonyWang on 2022/4/17.
//  Copyright © 2022 TonyWang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FFBaseDelegateProtocol.h"
#import "FFHttpControllerProtocol.h"
#import "FFHttpServiceProtocol.h"
#import "FFLocalDataProtocol.h"
#import "FFUserInfoProtocol.h"

typedef NS_ENUM(NSUInteger, UserStatus) {
    //未登录状态
    UserStatusNotLoggedIn=1<<0,
    //登录状态
    UserStatusLoggedIn=1<<1,
    //登录了账号行为
    UserStatusLoginIn=1<<2,
    //切换了账户行为
    UserStatusChange=1<<3,
    //注销了账号行为
    UserStatusLoginOut=1<<4,
};

@interface FFBaseController : UIViewController
<FFBaseDelegateProtocol
,FFHttpControllerProtocol>
//页面根级window
@property(nonatomic,strong,nullable)
    UIWindow *keyWindow;
//布局层安全区域
@property(nonatomic,assign,readonly)
    UIEdgeInsets layoutSafeArea;
//活动计数器
@property(nonatomic,assign)
    NSInteger counterActivity;
//加载组件计数器
@property(nonatomic,assign)
    NSInteger counterLoadingView;
//错误组件计数器
@property(nonatomic,assign)
    NSInteger counterErrorView;
//等待组件计数器
@property(nonatomic,assign)
    NSInteger counterWaitingView;
//加载组件容器
@property(nonatomic,strong,nullable) IBOutlet
    UIView *viewLoadingContainer;
//加载组件
@property(nonatomic,strong,nullable)
    UIView *viewLoading;
//错误组件容器
@property(nonatomic,strong,nullable) IBOutlet
    UIView *viewErrorContainer;
//错误组件
@property(nonatomic,strong,nullable)
    UIView<NSObject> *viewError;
//等待组件容器
@property(nonatomic,strong,nullable) IBOutlet
    UIView *viewWaitingContainer;
//等待组件
@property(nonatomic,strong,nullable)
    UIView *viewWaiting;
//是否为登录状态
@property(nonatomic,assign,readonly)
    BOOL isLoggedIn;
//本地数据服务对象
@property(nonatomic,strong,nonnull)
    id<FFLocalDataProtocol,FFUserInfoProtocol> serviceLocal;
//Http服务对象
@property(nonatomic,strong,nonnull)
    id<FFHttpServiceProtocol> serviceHttp;
//统一的导航栏Push返回按钮事件响应方法
-(IBAction)clickPushBack:(nonnull id)sender;
//统一的其他点击事件响应方法
- (IBAction)clickResponser:(nonnull id)sender;
//控制器统一发起初始化数据方法
-(void)reloadInit;
//控制器统一发起的刷新数方法
-(void)reloadRefresh;
//控制器统一发起初始化数据的回调方法
-(void)handleInitWithUserStatus:(UserStatus)status NS_REQUIRES_SUPER;
//控制器统一发起的刷新数据回调方法
-(void)handleRefreshWithUserStatus:(UserStatus)status;
//不带任何效果的数据服务发起方法
-(void)baseHttpService:(NSString *)tag
    param:(nullable NSDictionary *)dict;
//带初始化界面效果的数据服务发起方法
-(void)initHttpService:(NSString *)tag
    param:(nullable NSDictionary *)dict;
//带中断操作效果的数据服务发起方法
-(void)actionHttpService:(NSString *)tag
    param:(nullable NSDictionary *)dict;
//自定义Service参数
-(void)editHttpService:(NSInteger)tag
    param:(nonnull NSMutableDictionary *)dict;
//展示默认气泡提示框
-(void)showAutoTipWithText:(nullable NSString *)text;
//展示模态等待提示框
-(void)showWaitingTipWithText:(nonnull NSString *)text;
//隐藏模态等待提示框
-(void)hiddenWaitingTip;
//跳转到登录界面
-(void)pushLoginController;
//控制器Push返回方法
-(void)pushBackToLastController;
//控制器Push跳转方法
-(void)pushViewController:(nonnull UIViewController *)viewCtr
    requiredLogin:(BOOL)requiredLogin;
@end
