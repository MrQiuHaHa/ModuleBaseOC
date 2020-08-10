//
//  ModleBaseCell.h
//  Pods
//
//  Created by 邱俊荣 on 2020/8/10.
//

#import <UIKit/UIKit.h>
#import "ModleBaseItem.h"
#import "ModleBaseDefine.h"
#import <NSObjectExtend/NSObjectExtend.h>
#import <Masonry/Masonry.h>

NS_ASSUME_NONNULL_BEGIN

@class ModleBaseCell;
@protocol ModleBaseCellDelegate <NSObject>

/// cell 的按钮被点击
/// @param cell 单元格实例
/// @param tag   被点击的按钮的tag（区分一个单元格多个按钮事件）
- (void)tableViewCell:(ModleBaseCell *)cell didClickButtonWithTag:(NSInteger)tag;

@end

@interface ModleBaseCell : UITableViewCell

///  表单单元格对应的元素对象
@property (nonatomic, strong) ModleBaseItem * baseItem;

///  响应表单单元格内部事件的委托
@property (nonatomic, weak) id <ModleBaseCellDelegate> delegate;


@end

NS_ASSUME_NONNULL_END
