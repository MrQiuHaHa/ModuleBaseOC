//
//  BaseToastView.h
//  Pods
//
//  Created by 邱俊荣 on 2020/8/10.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum : NSUInteger {
    top    = 0,
    middle = 1,
    bottom = 2,
} LocationType;

@interface BaseToastView : UIView

+ (void)showToastMsg:(NSString*)msg;

+ (void)showToastMsg:(NSString*)msg withType:(LocationType)type;

@end

NS_ASSUME_NONNULL_END
