/*********************************************************************
 * 文件名称： RGHudModular.h 遮罩弹出工具类
 * 内容摘要： 遮罩弹出工具类
 **********************************************************************/
#import <Foundation/Foundation.h>
//临时代码
//#import "MBProgressHUD.h"
#import <MBProgressHUD/MBProgressHUD.h>
//end
@interface MBHudModular : NSObject

/*****************************************************************************
 * 方法名称: + (RGHudModular *)getRGHud
 * 功能描述: 获取单例对象
 * 输入参数:
 * 输出参数: RGHudModular
 * 返回值:   此单例类
 * 其它说明:
 *****************************************************************************/
+ (MBHudModular *)getMBHud;

/*****************************************************************************
 * 方法名称: - (void)showPopHudWithMessage:(NSString *)message inWindow:(UIView *)containView
 * 功能描述: 弹出带文字的菊花框整体视图
 * 输入参数: message--弹出的文字;
 * 输出参数:
 * 返回值:
 * 其它说明:
 *****************************************************************************/
- (MBProgressHUD *)showPopHudWithMessage:(NSString *)message inWindow:(UIView *)containView;

/*****************************************************************************
 * 方法名称: - (void)showPopHudWithMessage:(NSString *)message inView:(UIView *)containView
 * 功能描述: 弹出带文字的菊花框
 * 输入参数: message--弹出的文字;containView--父级视图
 * 输出参数:
 * 返回值:
 * 其它说明:
 *****************************************************************************/
- (void)showPopHudWithMessage:(NSString *)message inView:(UIView *)containView;

/*****************************************************************************
 * 方法名称: - (void)hidePopHudInView:(UIView *)containView*)containView
 * 功能描述: 隐藏弹出框
 * 输入参数: containView--父级视图
 * 输出参数:
 * 返回值:
 * 其它说明:
 *****************************************************************************/
- (void)hidePopHudInView:(UIView *)containView;

/*****************************************************************************
 * 方法名称: - (void)hidePopHudInWindow:(UIView *)containView
 * 功能描述: 隐藏弹出框
 * 输入参数: containView--父级视图
 * 输出参数:
 * 返回值:
 * 其它说明:
 *****************************************************************************/
- (void)hidePopHudInWindow:(UIView *)containView;

/*****************************************************************************
 * 方法名称: - (void)showAutoHudWithMessage:(NSString *)message inView:(UIView *)containView
 * 功能描述: 弹出只文字的提示并自动消失
 * 输入参数: message--弹出的文字;containView--父级视图
 * 输出参数:
 * 返回值:
 * 其它说明:
 *****************************************************************************/
- (MBProgressHUD *)showAutoHudWithMessage:(NSString *)message inView:(UIView *)containView afterTime:(float)afterTime;

/*****************************************************************************
 * 方法名称: - (void)showPophudWithImage:(UIImage *)img showMessage:(NSString *)message backColor:(UIColor *)color inView:(UIView *)containView
 * 功能描述: 弹出图片，文字，背景色自定义
 * 输入参数: img--图片；message--文字(可为空);color--背景色（空的话为默认值;containView--父级视图
 * 输出参数:
 * 返回值:
 * 其它说明:
 *****************************************************************************/
- (void)showPophudWithImage:(UIImage *)img showMessage:(NSString *)message backColor:(UIColor *)color inView:(UIView *)containView;

/*****************************************************************************
 * 方法名称: - (void)showTopHudWithMessage:(NSString *)message inView:(UIView *)containView
 * 功能描述: 在父级View顶部中间弹出一段文字提示并自动消失
 * 输入参数: message--弹出的文字;containView--父级视图
 * 输出参数:
 * 返回值:
 * 其它说明:
 *****************************************************************************/
- (void)showTopHudWithMessage:(NSString *)message inView:(UIView *)containView;

/*****************************************************************************
 * 方法名称: - (void)showBottomHudWithMessage:(NSString *)message inView:(UIView *)containView
 * 功能描述: 在父级View底部中间弹出一段文字提示并自动消失
 * 输入参数: message--弹出的文字;containView--父级视图
 * 输出参数:
 * 返回值:
 * 其它说明:
 *****************************************************************************/
- (void)showBottomHudWithMessage:(NSString *)message inView:(UIView *)containView;
////MBProgressHUDModeDeterminate MBProgressHUDModeDeterminateHorizontalBar MBProgressHUDModeAnnularDeterminate
//- (MBProgressHUD *)showProgressHud:(MBProgressHUDMode)mode withMessage:(NSString *)message inView:(UIView *)containView;

- (void)showAutoHudWithMessageTransform:(NSString *)message inView:(UIView *)containView afterTime:(float)afterTime;

- (void)showPopHudWithMessageTransForm:(NSString *)message inView:(UIView *)containView;
@end
