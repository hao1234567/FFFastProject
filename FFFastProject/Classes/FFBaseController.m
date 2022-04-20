//
//  FFBaseController.m
//  FFFastProject
//
//  Created by TonyWang on 2022/4/17.
//  Copyright © 2022 TonyWang. All rights reserved.
//

#import "FFBaseController.h"

static long __serviceCounter=0;

@interface FFBaseController ()
@property(nonatomic,assign)
    BOOL isInitedController;
@property(nonatomic,copy,nullable)
    NSString *withUserToken;
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
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.view endEditing:YES];
}

-(void)dealloc
{
    //销毁也要减去当前还有的网络活动数
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

@end
