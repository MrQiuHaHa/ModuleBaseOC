//
//  ModleBaseItem.h
//  Pods
//
//  Created by 邱俊荣 on 2020/8/10.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ModleBaseItem : NSObject

@property (nonatomic, assign) CGFloat cellHeight;

/// 重用标识字符串
+ (NSString *)reuseCellIdentifier;

@end

NS_ASSUME_NONNULL_END
