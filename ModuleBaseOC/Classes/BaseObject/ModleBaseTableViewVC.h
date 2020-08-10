//
//  ModleBaseTableViewVC.h
//  Pods
//
//  Created by 邱俊荣 on 2020/8/10.
//

#import "ModleBaseVC.h"

NS_ASSUME_NONNULL_BEGIN

@interface ModleBaseTableViewVC : ModleBaseVC

@property (nonatomic, strong) UITableView * tableView;

@property (nonatomic, assign) BOOL isSupportHeaderRefresh; //是否支持下拉刷新，默认不支持
@property (nonatomic, assign) BOOL isSupportFooterRefresh; //是否支持上拉加载更多，默认不支持
@property (nonatomic, assign) BOOL hiddenFooterRefresh;//隐藏底部刷新

@property (nonatomic, assign) BOOL hasMore;
@property (nonatomic, assign) BOOL loadMore;
@property (nonatomic, assign) NSInteger pageIndex;


- (void)refreshDataLoading;

- (void)loadMoreData;

@end

NS_ASSUME_NONNULL_END
