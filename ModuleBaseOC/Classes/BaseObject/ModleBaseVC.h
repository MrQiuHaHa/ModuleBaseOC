//
//  ModleBaseVC.h
//  Pods
//
//  Created by 邱俊荣 on 2020/8/10.
//

#import <UIKit/UIKit.h>
#import "ModleBaseDefine.h"
#import <NSObjectExtend/NSObjectExtend.h>
#import <Masonry/Masonry.h>
#import <ReactiveObjC/ReactiveObjC.h>

NS_ASSUME_NONNULL_BEGIN

@interface ModleBaseVC : UIViewController

@property (nonatomic, strong) id param;

/// 是否展示无数据/异常页面
@property (nonatomic, assign) BOOL showNoMessageStyle;

/// 子类重载来决定当前界面显示的时候是否开启导航栏, default return NO
- (BOOL)prefersNavigationBarHidden;
/// 是否使用动画 default return YES
- (BOOL)prefersNavigationBarUpdateAnimation;

/// 是否隐藏导航栏下划线 default return false 不隐藏
- (BOOL)prefersNavigationBarLinView;

/// 导航栏背景图片可重写
- (UIImage *)navigationBarBackgroundImage;

/// 导航返回事件
- (void)onBackButtonClick;

/// 设置右按钮
- (void)setRightBtnImage:(NSString *)imageStr;
- (void)setRightBtnTitle:(NSString *)titleStr;

- (void)onRightButtonClick;

@end

NS_ASSUME_NONNULL_END
