//
//  NSBundle+currentBundle.m
//  Pods
//
//  Created by 邱俊荣 on 2020/8/10.
//

#import "NSBundle+currentBundle.h"

@implementation NSBundle (currentBundle)

+ (NSBundle *)moduleBaseBundleLocal:(NSString *)resourceName {
    
    return [NSBundle bundleWithURL:[[NSBundle mainBundle] URLForResource:resourceName withExtension:@"bundle"]];
}

@end
