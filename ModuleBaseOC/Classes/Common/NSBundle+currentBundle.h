//
//  NSBundle+currentBundle.h
//  Pods
//
//  Created by 邱俊荣 on 2020/8/10.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSBundle (currentBundle)

+ (NSBundle *)moduleBaseBundleLocal:(NSString *)resourceName;

@end

NS_ASSUME_NONNULL_END
