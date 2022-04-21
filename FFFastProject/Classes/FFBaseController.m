//
//  FFBaseController.m
//  FFFastProject
//
//  Created by TonyWang on 2022/4/17.
//  Copyright © 2022 TonyWang. All rights reserved.
//

#import "FFBaseController.h"
#import "FFFastProjectConfig.h"
#import "UIView+FFCustom.h"
#import "NSString+FFCustom.h"
#import "MBHudModular.h"

static long __counterAllActivity=0;

@interface FFBaseController ()
//是否已经是初始化的Controller
@property(nonatomic,assign)
    BOOL isInitedController;
//触发加载或刷新前关联的用户token
@property(nonatomic,copy,nullable)
    NSString *withUserToken;
//是否打开网络活动指示器
@property(nonatomic,assign)
    BOOL enableActivityIndicator;
//是否开启加载组件
@property(nonatomic,assign)
    BOOL enableLoadingView;
//是否开启错误组件
@property(nonatomic,assign)
    BOOL enableErrorView;
//是否开启等待组件
@property(nonatomic,assign)
    BOOL enableWaitingView;
@end

@implementation FFBaseController

-(instancetype)init {
    if (self=[super init]) {
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //插入无效组件，防止一个骚bug。
    UIView *viewNoAdjusting=[UIView new];
    [self.view insertSubview:
        viewNoAdjusting atIndex:0];
    //初始化属性默认值
    if (@available(iOS 7.0, *)) {
        self.modalPresentationStyle=
            UIModalPresentationCustom;
        self.automaticallyAdjustsScrollViewInsets=NO;
    } else {
        // Fallback on earlier versions
    }
    //记录当前的登录信息
    self.withUserToken=
        [self.serviceLocal getUserToken];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //检测是否是首次加载页面
    if (self.isInitedController) {
        [self reloadInit];
    }
    else {
        [self reloadRefresh];
    }
    self.isInitedController=false;
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.view endEditing:YES];
    //登记离开前的用户状态
    self.withUserToken=
        [self.serviceLocal getUserToken];
}

-(void)dealloc
{
    //销毁要减去当前页面还有的网络活动数
    self.counterActivity=0;
}

/*
//Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(BOOL)enableActivityIndicator
{
    return [UIApplication sharedApplication].
        networkActivityIndicatorVisible;
}

-(void)setEnableActivityIndicator:(BOOL)enableActivityIndicator
{
    [UIApplication sharedApplication].
        networkActivityIndicatorVisible=enableActivityIndicator;
}

-(void)setEnableLoadingView:(BOOL)enableLoadingView
{
    _enableLoadingView=enableLoadingView;
    if (enableLoadingView) {
        CGRect rectLoadingView=
            self.viewLoadingContainer.frame;
        rectLoadingView.origin=CGPointZero;
        self.viewLoading.frame=rectLoadingView;
        [self.viewLoadingContainer
            addSubview:self.viewLoading];
    }
    else {
        [self.viewLoading removeFromSuperview];
        self.viewLoading=nil;
    }
}

-(void)setEnableErrorView:(BOOL)enableErrorView
{
    _enableErrorView=enableErrorView;
    if (enableErrorView) {
        CGRect rectErrorView=
            self.viewErrorContainer.frame;
        rectErrorView.origin=CGPointZero;
        self.viewError.frame=rectErrorView;
        [self.viewErrorContainer
            addSubview:self.viewError];
    }
    else {
        [self.viewError removeFromSuperview];
        self.viewError=nil;
    }
}

-(UIWindow *)keyWindow
{
    NSArray *arrWindows=
        [UIApplication sharedApplication].windows;
    return arrWindows[0];
}

-(UIEdgeInsets)layoutSafeArea
{
    if (@available(iOS 11.0, *)) {
        UIWindow *window=self.keyWindow;
        UIEdgeInsets edgeSafeArea=
            window.safeAreaInsets;
        if (edgeSafeArea.top<=0) {
            edgeSafeArea.top=20;
        }
        return edgeSafeArea;
    }
    return UIEdgeInsetsMake(20, 0, 0, 0);
}

-(void)setCounterActivity:(NSInteger)counterActivity
{
    //减去累计的
    __counterAllActivity-=self.counterActivity;
    //更新累计
    _counterActivity=counterActivity;
    __counterAllActivity+=self.counterActivity;
    if (__counterAllActivity<=0) {
        __counterAllActivity=0;
        self.enableActivityIndicator=NO;
    }
    else {
        self.enableActivityIndicator=YES;
    }
}

-(void)setCounterLoadingView:(NSInteger)counterLoadingView
{
    //更新累计
    _counterLoadingView=counterLoadingView;
    if (_counterLoadingView<=0) {
        _counterLoadingView=0;
        self.enableLoadingView=NO;
    }
    else {
        self.enableLoadingView=YES;
    }
}

-(void)setCounterErrorView:(NSInteger)counterErrorView
{
    //更新累计
    _counterErrorView=counterErrorView;
    if (_counterErrorView<=0) {
        _counterErrorView=0;
        self.enableErrorView=NO;
    }
    else {
        self.enableErrorView=YES;
    }
}

-(void)setCounterWaitingView:(NSInteger)counterWaitingView
{
    //更新累计
    _counterWaitingView=counterWaitingView;
    if (_counterWaitingView<=0) {
        _counterWaitingView=0;
        self.enableWaitingView=NO;
    }
    else {
        self.enableWaitingView=YES;
    }
}

-(UIView *)viewLoading
{
    if (!_viewLoading) {
        FFFastProjectConfig *config=
            [FFFastProjectConfig sharedConfig];
        _viewLoading=[config.defaultLoaingViewClass new];
        _viewLoading.enableAutoresizing=true;
    }
    return _viewLoading;
}

-(UIView *)viewError
{
    if (!_viewError) {
        FFFastProjectConfig *config=
            [FFFastProjectConfig sharedConfig];
        _viewError=[config.defaultErrorViewClass new];
        _viewError.viewDelegate=self;
        _viewError.enableAutoresizing=true;
    }
    return _viewError;
}

-(UIView *)viewWaiting
{
    if (!_viewError) {
        FFFastProjectConfig *config=
            [FFFastProjectConfig sharedConfig];
        _viewWaiting=[config.defaultErrorViewClass new];
        _viewWaiting.enableAutoresizing=true;
    }
    return _viewWaiting;
}

-(BOOL)isLoggedIn
{
    NSString *userToken=
        [self.serviceLocal getUserToken];
    return [NSString hasValue:userToken];
}

-(id<FFLocalDataProtocol,FFUserInfoProtocol>)serviceLocal
{
    if (!_serviceLocal) {
        FFFastProjectConfig *config=
            [FFFastProjectConfig sharedConfig];
        _serviceLocal=[config.defaultLocalServiceClass new];
    }
    return _serviceLocal;
}

-(id<FFHttpServiceProtocol>)serviceHttp
{
    if (!_serviceHttp) {
        FFFastProjectConfig *config=
            [FFFastProjectConfig sharedConfig];
        _serviceHttp=[config.defaultHttpServiceClass new];
        _serviceHttp.controller=self;
    }
    return _serviceHttp;
}

-(void)clickPushBack:(id)sender
{
    [self pushBackToLastController];
}

-(void)clickResponser:(id)sender
{
    
}

-(void)reloadInit
{
    UserStatus userStatus=UserStatusNotLoggedIn;
    if ([NSString hasValue:self.withUserToken]) {
        userStatus=UserStatusLoggedIn;
    }
    [self handleInitWithUserStatus:userStatus];
}

-(void)reloadRefresh
{
    NSString *userToken=
        [self.serviceLocal getUserToken];
    UserStatus userStatus=UserStatusNotLoggedIn;
    if (![NSString hasValue:self.withUserToken]
        &&[NSString hasValue:userToken]) {
        //去登录了
        userStatus=UserStatusLoggedIn;
    }
    else if ([NSString hasValue:self.withUserToken]
        &&![NSString hasValue:userToken]) {
        //去注销了
        userStatus=UserStatusLoginOut;
    }
    else if ([NSString hasValue:self.withUserToken]
        &&[NSString hasValue:userToken]
        &&![self.withUserToken isEqualToString:userToken]) {
        //切换了账号
        userStatus=UserStatusChange;
    }
    else if ([NSString hasValue:self.withUserToken]) {
        //已登录状态
        userStatus=UserStatusLoginIn;
    }
    [self handleRefreshWithUserStatus:userStatus];
}

-(void)handleInitWithUserStatus:(UserStatus)status
{
    
}

-(void)handleRefreshWithUserStatus:(UserStatus)status
{
    
}

-(void)baseHttpService:(NSString *)tag
    param:(NSDictionary *)dict
{
    
}

-(void)initHttpService:(NSString *)tag
    param:(NSDictionary *)dict
{
    
}

-(void)actionHttpService:(NSString *)tag
    param:(NSDictionary *)dict
{
    
}

-(void)editHttpService:(NSInteger)tag
    param:(NSMutableDictionary *)dict
{
    
}

-(void)showAutoTipWithText:(NSString *)text
{
    if (![NSString hasValue:text]) {
        //无提示内容就不展示了
        return;
    }
    //弹出提示框
    MBProgressHUD *viewTip=[[MBHudModular getMBHud]
        showAutoHudWithMessage:text
        inView:self.keyWindow
        afterTime:1.5];
    //viewTip.userCanTouch=true;
    viewTip.userInteractionEnabled=false;
    viewTip.label.numberOfLines=0;
    viewTip.label.textAlignment=NSTextAlignmentLeft;
    viewTip.label.textColor=UIColor.whiteColor;
    viewTip.bezelView.style=MBProgressHUDBackgroundStyleSolidColor;
    viewTip.bezelView.backgroundColor=UIColor.blackColor;
}

-(void)showWaitingTipWithText:(NSString *)text
{
    if (![NSString hasValue:text]) {
        //无提示内容就不展示了
        return;
    }
    MBProgressHUD *viewTip=[[MBHudModular getMBHud]
        showPopHudWithMessage:text
        inWindow:self.keyWindow];
    //viewTip.userCanTouch=false;
    viewTip.userInteractionEnabled=true;
    viewTip.label.numberOfLines=0;
    viewTip.label.textAlignment=NSTextAlignmentLeft;
}

-(void)hiddenWaitingTip
{
    [[MBHudModular getMBHud]
        hidePopHudInWindow:self.keyWindow];
}

-(void)pushLoginController
{
    //判断是否已经在登录页面
    //构造登录页面实例
    FFFastProjectConfig *config=
        [FFFastProjectConfig sharedConfig];
    UIViewController *loginViewCtr=
        [config.loginViewControllerClass new];
    loginViewCtr.hidesBottomBarWhenPushed=YES;
    [self.navigationController
        pushViewController:loginViewCtr animated:YES];
    //移除其他界面
    NSArray *arrChildViewCtrs=
        self.navigationController.viewControllers;
    for (UIViewController *viewCtr
         in  arrChildViewCtrs) {
        if (viewCtr!=loginViewCtr) {
            [viewCtr removeFromParentViewController];
        }
    }
}

-(void)pushBackToLastController
{
    [self.navigationController
        popViewControllerAnimated:YES];
}

-(void)pushViewController:(UIViewController *)viewCtr
    requiredLogin:(BOOL)requiredLogin
{
    //判断是否已经登录
    if (requiredLogin&&!self.isLoggedIn) {
        FFFastProjectConfig *config=
            [FFFastProjectConfig sharedConfig];
        viewCtr=[config.loginViewControllerClass new];
    }
    viewCtr.hidesBottomBarWhenPushed=YES;
    [self.navigationController
        pushViewController:viewCtr animated:YES];
}

@end
