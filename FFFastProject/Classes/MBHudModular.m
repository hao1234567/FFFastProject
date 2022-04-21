/*********************************************************************
 * 文件名称： RGHudModular.h 遮罩弹出工具类
 * 内容摘要： 遮罩弹出工具类
 **********************************************************************/

#import "MBHudModular.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

static MBHudModular *MBHud;

@implementation MBHudModular
+ (MBHudModular *)getMBHud
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        MBHud = [[MBHudModular alloc] init];
    });
    return MBHud;
}
- (MBProgressHUD *)showPopHudWithMessage:(NSString *)message inWindow:(UIView *)containView
{
    [MBProgressHUD hideHUDForView:containView animated:NO];
    MBProgressHUD* HUD = [[MBProgressHUD alloc] initWithView:containView];
    [containView addSubview:HUD];
    HUD.removeFromSuperViewOnHide = YES;

    //HUD.labelText = message;
    HUD.label.text=message;
    //HUD.dimBackground = YES;
    //MBMainThreadAssert();
    HUD.backgroundView.style=MBProgressHUDBackgroundStyleSolidColor;
    HUD.backgroundView.color=[UIColor colorWithWhite:0.f alpha:.2f];
    //[HUD show:YES];
    [HUD showAnimated:YES];
    return HUD;
}
- (void)showPopHudWithMessage:(NSString *)message inView:(UIView *)containView
{
    [MBProgressHUD hideHUDForView:containView.window animated:NO];
    MBProgressHUD* HUD = [[MBProgressHUD alloc] initWithView:containView];
    [containView.window addSubview:HUD];
    HUD.removeFromSuperViewOnHide = YES;
    
    //HUD.labelText = message;
    HUD.label.text=message;
    //HUD.dimBackground = YES;
    //MBMainThreadAssert();
    HUD.backgroundView.style=MBProgressHUDBackgroundStyleSolidColor;
    HUD.backgroundView.color=[UIColor colorWithWhite:0.f alpha:.2f];
    //[HUD show:YES];
    [HUD showAnimated:YES];
}

- (void)showPopHudWithMessageTransForm:(NSString *)message inView:(UIView *)containView
{
    [MBProgressHUD hideHUDForView:containView.window animated:NO];
    MBProgressHUD* HUD = [[MBProgressHUD alloc] initWithView:containView];
    HUD.transform=CGAffineTransformMakeRotation(M_PI/2);
    [containView.window addSubview:HUD];
    HUD.removeFromSuperViewOnHide = YES;

    //HUD.labelText = message;
    HUD.label.text=message;
    //HUD.dimBackground = YES;
    //MBMainThreadAssert();
    HUD.backgroundView.style=MBProgressHUDBackgroundStyleSolidColor;
    HUD.backgroundView.color=[UIColor colorWithWhite:0.f alpha:.2f];
    //[HUD show:YES];
    [HUD showAnimated:YES];
}

- (MBProgressHUD *)showAutoHudWithMessage:(NSString *)message
    inView:(UIView *)containView afterTime:(float)afterTime
{
    //containView.window
    [MBProgressHUD hideHUDForView:containView animated:NO];
    MBProgressHUD* HUD = [[MBProgressHUD alloc] initWithView:containView];
    [containView addSubview:HUD];
    HUD.removeFromSuperViewOnHide = YES;
    
    //HUD.labelText = message;
    HUD.label.text=message;
    //HUD.dimBackground = YES;
    //HUD.userCanTouch = YES;
    HUD.userInteractionEnabled=false;
    HUD.mode = MBProgressHUDModeText;
    //HUD.margin = 10.f;
    //[HUD show:YES];
    [HUD showAnimated:YES];
    //[HUD hide:YES afterDelay:afterTime];
    [HUD hideAnimated:YES afterDelay:afterTime];
    return HUD;
}

//横屏显示模式
- (void)showAutoHudWithMessageTransform:(NSString *)message inView:(UIView *)containView afterTime:(float)afterTime
{
    [MBProgressHUD hideHUDForView:containView.window animated:NO];
    MBProgressHUD* HUD = [[MBProgressHUD alloc] initWithView:containView];
    HUD.transform = CGAffineTransformMakeRotation(M_PI/2);
    [containView.window addSubview:HUD];
    HUD.removeFromSuperViewOnHide = YES;
    
    //HUD.labelText = message;
    HUD.label.text=message;
    //HUD.dimBackground = YES;
    //HUD.userCanTouch = YES;
    HUD.userInteractionEnabled=false;
    HUD.mode = MBProgressHUDModeText;
    //HUD.margin = 10.f;
    //[HUD show:YES];
    [HUD showAnimated:YES];
    //[HUD hide:YES afterDelay:afterTime];
    [HUD hideAnimated:YES afterDelay:afterTime];
}


- (void)hidePopHudInView:(UIView *)containView
{
    [MBProgressHUD hideHUDForView:containView.window animated:YES];
}
- (void)hidePopHudInWindow:(UIView *)containView
{
    [MBProgressHUD hideHUDForView:containView animated:YES];
}
- (void)showTopHudWithMessage:(NSString *)message inView:(UIView *)containView
{
    MBProgressHUD* HUD = [[MBProgressHUD alloc] initWithView:containView];
    [containView addSubview:HUD];
    HUD.removeFromSuperViewOnHide = YES;
    
    //HUD.labelText = message;
    HUD.label.text=message;
    //HUD.dimBackground = YES;
    //HUD.userCanTouch = YES;
    HUD.userInteractionEnabled=false;
    HUD.mode = MBProgressHUDModeText;
    HUD.margin = 10.f;
    HUD.minShowTime = 1.0f;
    //HUD.yOffset =-containView.frame.size.height/2+30;
    HUD.offset=CGPointMake(HUD.offset.x,-containView.frame.size.height/2+30);
    //[HUD show:YES];
    [HUD showAnimated:YES];
    //[HUD hide:YES afterDelay:3.0];
    [HUD hideAnimated:YES afterDelay:3.0];
}
- (void)showBottomHudWithMessage:(NSString *)message inView:(UIView *)containView
{
    MBProgressHUD* HUD = [[MBProgressHUD alloc] initWithView:containView];
    [containView addSubview:HUD];
    HUD.removeFromSuperViewOnHide = YES;
    
    //HUD.labelText = message;
    HUD.label.text=message;
    //HUD.dimBackground = YES;
    //HUD.userCanTouch = YES;
    HUD.userInteractionEnabled=false;
    HUD.mode = MBProgressHUDModeText;
    HUD.margin = 10.f;
    HUD.minShowTime = 1.0f;
    //HUD.yOffset =-containView.frame.size.height/2+30;
    HUD.offset=CGPointMake(HUD.offset.x,-containView.frame.size.height/2+30);
    //[HUD show:YES];
    [HUD showAnimated:YES];
    //[HUD hide:YES afterDelay:3.0];
    [HUD hideAnimated:YES afterDelay:3.0];
    
}
- (MBProgressHUD *)showProgressHud:(MBProgressHUDMode)mode withMessage:(NSString *)message inView:(UIView *)containView
{
    [MBProgressHUD hideHUDForView:containView animated:NO];
    MBProgressHUD* HUD = [[MBProgressHUD alloc] initWithView:containView];
    [containView addSubview:HUD];
    HUD.mode = mode;
    
    //HUD.labelText = message;
    HUD.label.text=message;
    //[HUD show:YES];
    [HUD showAnimated:YES];
    return HUD;
}
- (void)showPophudWithImage:(UIImage *)img showMessage:(NSString *)message backColor:(UIColor *)color inView:(UIView *)containView
{
    [MBProgressHUD hideHUDForView:containView animated:NO];
    MBProgressHUD* HUD = [[MBProgressHUD alloc] initWithView:containView];
    [containView addSubview:HUD];
    HUD.removeFromSuperViewOnHide = YES;
    HUD.customView =[[UIImageView alloc] initWithImage:img];
    HUD.mode = MBProgressHUDModeCustomView;
    
    //HUD.labelText = message;
    HUD.label.text=message;
    //HUD.userCanTouch = YES;//是否可以触摸消失
    //HUD.dimBackground = YES;
    //[HUD show:YES];
    [HUD showAnimated:YES];
    //[HUD hide:YES afterDelay:3];
    [HUD hideAnimated:YES afterDelay:3];
}

#pragma clang diagnostic pop
@end
