//
//  BaseToastView.m
//  Pods
//
//  Created by 邱俊荣 on 2020/8/10.
//

#import "BaseToastView.h"
#import <NSObjectExtend/NSObjectExtend.h>

@interface BaseToastView ()

@property (nonatomic, strong) UILabel * textLabel;

@end

@implementation BaseToastView

+ (id)alloc
{
    __block BOOL hasExisting = NO;
    __block BaseToastView * alert = nil;
    
    [[UIApplication sharedApplication].keyWindow.subviews enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop)
     {
         if ([obj isKindOfClass:[BaseToastView class]])
         {
             hasExisting = YES;
             alert = (BaseToastView *)obj;
             *stop = YES;
         }
     }];
    
    if (hasExisting && alert)
    {
        [alert removeFromSuperview];
    }
    
    return [super alloc];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor colorWithHexCode:@"#25262D90"];
        self.layer.cornerRadius = 2;
    }
    return self;
}
- (UILabel *)textLabel{
    
    if (!_textLabel) {
        _textLabel = [[UILabel alloc] init];
        _textLabel.textColor = [UIColor whiteColor];
        _textLabel.backgroundColor = [UIColor clearColor];
        _textLabel.font = [UIFont systemFontOfSize:14];
        _textLabel.numberOfLines = 0;
        _textLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_textLabel];
    }
    return _textLabel;
}

- (void)dealloc
{
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(dismiss) object:nil];
}

- (void)showAlertMsg:(NSString *)msg withType:(LocationType)type
{
    self.textLabel.text = msg;
    
    CGFloat cx;
    CGFloat cy;
    CGFloat vw = [UIScreen mainScreen].bounds.size.width-120;
    CGFloat vh;
    CGFloat splitW = 20;
    CGFloat labW = vw-splitW*2;
    
    CGFloat tempH = [self.textLabel.text boundingRectWithSize:CGSizeMake(labW, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:self.textLabel.font} context:nil].size.height;
    
    tempH = tempH < 300 ? tempH : 300;
    
    CGFloat tempW = [self.textLabel.text sizeWithAttributes:@{NSFontAttributeName:self.textLabel.font}].width;
    
    if (tempW < labW) {
        labW = tempW;
        vw = labW+40;
    }
    
    
    cx = splitW;
    cy = 10;
    
    self.textLabel.frame = CGRectMake(cx, cy, labW, tempH);
    
    cx = ([UIScreen mainScreen].bounds.size.width-vw)/2;
    vh = CGRectGetMaxY(self.textLabel.frame)+10;
    
    switch (type) {
        case top:
            cy = [UIScreen mainScreen].bounds.size.height >=  812.0 ? 88.0 : 64.0;
            break;
        case middle:
            cy = ([UIScreen mainScreen].bounds.size.height - vh)/2.0;
            break;
        case bottom:
            cy = [UIScreen mainScreen].bounds.size.height - vh - 60 - ([UIScreen mainScreen].bounds.size.height >= 812 ? 34.0 : 0);
            break;
    }
    
    self.frame = CGRectMake(cx, cy, vw, vh);
    
    [self removeFromSuperview];
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    [[UIApplication sharedApplication].keyWindow bringSubviewToFront:self];
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(dismiss) object:nil];
    [self performSelector:@selector(dismiss) withObject:nil afterDelay:2];
}

+ (void)showToastMsg:(NSString*)msg{
    
    [self showToastMsg:msg withType:bottom];
}

+ (void)showToastMsg:(NSString*)msg withType:(LocationType)type {
    
    if (msg.length == 0) { return; }
    
    BaseToastView *alertV = [[BaseToastView alloc] init];
    [alertV showAlertMsg:msg withType:type];
}

- (void)dismiss
{
    [self removeFromSuperview];
}

@end
