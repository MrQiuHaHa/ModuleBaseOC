//
//  UIImage+bundleResource.h
//  Pods
//
//  Created by 邱俊荣 on 2020/8/10.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (bundleResource)

+ (UIImage *)imageWithName:(NSString *)imgName withBundleName:(NSString * _Nonnull )bundleName;

@end

NS_ASSUME_NONNULL_END
