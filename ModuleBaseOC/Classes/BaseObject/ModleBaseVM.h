//
//  ModleBaseVM.h
//  Pods
//
//  Created by 邱俊荣 on 2020/8/10.
//

#import <Foundation/Foundation.h>
#import "ModleBaseItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface ModleBaseVM : NSObject

@property (nonatomic, strong) NSArray <ModleBaseItem *>* itemsArr;

/// 默认YES，设置为NO的时候VC刷新
@property (nonatomic, assign) BOOL loading;

/// 表单分组的数量
@property (nonatomic, readonly) NSInteger numberOfSections;

/// 给子类重写
- (instancetype)initWithParams:(NSDictionary *)parmDict;

/// 获取表单在某一个分组中的元素数量
- (NSInteger)numberOfRowsInSection:(NSInteger)section;


/// 获取在特定位置的表单元素
- (ModleBaseItem *)formItemAtIndexPath:(NSIndexPath *)indexPath;

@end

NS_ASSUME_NONNULL_END
