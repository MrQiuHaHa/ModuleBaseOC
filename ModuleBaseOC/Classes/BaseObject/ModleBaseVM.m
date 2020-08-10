//
//  ModleBaseVM.m
//  Pods
//
//  Created by 邱俊荣 on 2020/8/10.
//

#import "ModleBaseVM.h"

@implementation ModleBaseVM

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.loading = YES;
    }
    return self;
}

- (instancetype)initWithParams:(NSDictionary *)parmDict
{
    self = [super init];
    if (self) {}
    return self;
}

- (NSInteger)numberOfSections
{
    return 1;
}

- (NSInteger)numberOfRowsInSection:(NSInteger)section
{
    return self.itemsArr.count;
}

- (ModleBaseItem *)formItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    return self.itemsArr[indexPath.row];
}


@end
