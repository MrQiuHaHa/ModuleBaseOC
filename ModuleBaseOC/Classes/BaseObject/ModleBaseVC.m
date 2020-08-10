//
//  ModleBaseVC.m
//  Pods
//
//  Created by 邱俊荣 on 2020/8/10.
//

#import "ModleBaseVC.h"
#import "UIImage+bundleResource.h"
#import <FDFullscreenPopGesture/UINavigationController+FDFullscreenPopGesture.h>

@interface ModleBaseVC ()
@property (nonatomic, strong) UIView * noDataView;
@end

@implementation ModleBaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithHexCode:@"#F3F4F5"];
    
    self.fd_prefersNavigationBarHidden = [self prefersNavigationBarHidden];
    
    [self ym_setNodataView];
}


- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    [self ym_setLeftBackBtn];
    
    [self getNavigationBarHeight];
    
    [self.navigationController setNavigationBarHidden:[self prefersNavigationBarHidden] animated:[self prefersNavigationBarUpdateAnimation]];
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor]}];
    
}

- (void)dealloc
{
    NSLog(@"\n *** dealloc *** : %@", self);
}

- (void)ym_setLeftBackBtn
{
    UIButton *leftBtn = [self createBarButtonItem:@"YMNavigationBar_Left_back" title:nil action:@selector(onBackButtonClick) isRight:NO];
    [self setButtonsWithButton:leftBtn twoButton:nil isRight:NO];
}

- (void)setRightBtnImage:(NSString *)imageStr
{
    UIButton *rightBtn = [self createBarButtonItem:imageStr title:nil action:@selector(onRightButtonClick) isRight:YES];
    [self setButtonsWithButton:rightBtn twoButton:nil isRight:YES];
}

- (void)setRightBtnTitle:(NSString *)titleStr
{
    UIButton *rightBtn = [self createBarButtonItem:nil title:titleStr action:@selector(onRightButtonClick) isRight:YES];
    [self setButtonsWithButton:rightBtn twoButton:nil isRight:YES];
}

- (void)onBackButtonClick
{
    UINavigationController *na = (UINavigationController *)[UIApplication sharedApplication].keyWindow.rootViewController;
    [na popViewControllerAnimated:YES];
}

- (void)onRightButtonClick{};

- (void)setShowNoMessageStyle:(BOOL)showNoMessageStyle
{
    _showNoMessageStyle = showNoMessageStyle;
    self.noDataView.hidden = !showNoMessageStyle;
}

#pragma mark - 无数据页面
- (void)ym_setNodataView
{
    
    self.noDataView = [[UIView alloc] initWithFrame:self.view.bounds];
    self.noDataView.hidden = YES;
    [self.view addSubview:self.noDataView];
    
    UIImage *nodataImage = [UIImage imageWithName:@"BaseErrorTip_Image" withBundleName:@"ModuleBaseOCKit"];
    UIImageView *tipImageV = [[UIImageView alloc] initWithImage:nodataImage];
    tipImageV.center = CGPointMake(SCR_WIDTH_BASE/2.0, 104*SCR_WIDTH_BASE/375 + nodataImage.size.height/2.0);
    [self.noDataView addSubview:tipImageV];
    
    UILabel *tipLab = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(tipImageV.frame)+14, SCR_WIDTH_BASE, 22)];
    tipLab.text = @"暂无消息";
    tipLab.textAlignment = NSTextAlignmentCenter;
    tipLab.font = [UIFont systemFontOfSize:16];
    tipLab.textColor = [UIColor colorWithHexCode:@"#999999"];
    [self.noDataView addSubview:tipLab];
}

-(void)getNavigationBarHeight
{
    self.edgesForExtendedLayout = UIRectEdgeNone;//视图是否覆盖到四周的区域 UIRectEdgeNone视图控制器将在导航栏下方不会被覆盖
    self.extendedLayoutIncludesOpaqueBars = YES;//当Bar使用了不透明图片时，视图是否延伸至Bar所在区域
    self.modalPresentationCapturesStatusBarAppearance = NO;//模态演示捕获状态栏外观
    self.navigationController.navigationBar.translucent = NO;//设置导航栏是否为半透明
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithHexCode:@"#333333"]}];
    
    [self.navigationController.navigationBar setBackgroundImage:[self navigationBarBackgroundImage] forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    if ([self prefersNavigationBarLinView]) {
        [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    }else {
        [self.navigationController.navigationBar setShadowImage:[UIImage imageWithName:@"YMNavigationBar_Bottom_line" withBundleName:@"ModuleBaseOCKit"]];
    }
    
}

#pragma mark - 是否隐藏导航栏
- (BOOL)prefersNavigationBarHidden
{
    return NO;
}
- (BOOL)prefersNavigationBarUpdateAnimation
{
    return NO;
}

- (BOOL)prefersNavigationBarLinView {
    
    return NO;
}

#pragma mark - 导航栏背景图片
- (UIImage *)navigationBarBackgroundImage {
    return [UIImage new];
}

#pragma mark - 设置导航栏按钮适配
- (UIButton *)createBarButtonItem:(NSString *)image title:(NSString *)title action:(SEL)action isRight:(BOOL)isRight {
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    button.height = 40;
    [button addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    
    int x = 0;
    if (@available(iOS 13.0, *)) {
        
        x = isRight ? 16: 0;
    }else {
    
        x = 8;
    }
    
    // UI规范，不存在图文并存，有icon优先显示icon
    if (image) {
        button.width = 40;
        
        UIImageView *icon = [[UIImageView alloc]initWithFrame:CGRectMake(x, 8, button.width - 16, button.height - 16)];
        icon.contentMode = UIViewContentModeCenter;
        icon.image = [UIImage imageWithName:image withBundleName:@"ModuleBaseOCKit"];
        [button addSubview:icon];
    }else if (title) {
        CGSize size = [title boundingRectWithSize:CGSizeMake(MAXFLOAT, 40) options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:17]} context:nil].size;
        button.width = size.width < 40 ? 56: size.width + 16;
        UILabel * titleLab = [[UILabel alloc]initWithFrame:CGRectMake(x, 8, button.width - 16, button.height - 16)];
        titleLab.font = [UIFont systemFontOfSize:17];
        titleLab.text = title;
        titleLab.textAlignment = isRight ? NSTextAlignmentRight: NSTextAlignmentLeft;
        titleLab.textColor = [UIColor colorWithHexCode:@"#0B58EE"];
        [button addSubview:titleLab];
    }else {
        return nil;
    }
    return button;
}
- (void)setButtonsWithButton:(UIButton *)button
                   twoButton:(UIButton *)twoButton
                     isRight:(BOOL)isRight
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, button.frame.size.width + twoButton.frame.size.width + 16, button.frame.size.height)];
    
    view.backgroundColor = [UIColor clearColor];
    
    if (button) {
        if (@available(iOS 13.0, *)) {
            
            button.X = isRight ? 16: 0;
        }else {
        
            button.X = 8;
        }
        
        [view addSubview:button];
    }
    if (twoButton) {
        if (@available(iOS 13.0, *)) {
                   
           twoButton.X = button.width + (isRight ? 16: 0);
       } else {
       
           twoButton.X = button.width + 8;
       }
        [view addSubview:twoButton];
    }
    
    if (isRight) {
        view.tag = 999;
        UIBarButtonItem *rightBtnItem = [[UIBarButtonItem alloc]initWithCustomView:view];
        self.navigationItem.rightBarButtonItem = rightBtnItem;
        
    }else {
        view.tag = 998;
        UIBarButtonItem *leftBtnItem = [[UIBarButtonItem alloc]initWithCustomView:view];
        self.navigationItem.leftBarButtonItem = leftBtnItem;
        
    }
}

@end
