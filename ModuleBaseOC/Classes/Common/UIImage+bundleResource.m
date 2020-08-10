//
//  UIImage+bundleResource.m
//  Pods
//
//  Created by 邱俊荣 on 2020/8/10.
//

#import "UIImage+bundleResource.h"

@implementation UIImage (bundleResource)

+ (UIImage *)imageWithName:(NSString *)imgName withBundleName:(NSString *)bundleName {
    return [UIImage imageNamed:[NSString stringWithFormat:@"%@.bundle/%@",bundleName,imgName]];
}

@end
