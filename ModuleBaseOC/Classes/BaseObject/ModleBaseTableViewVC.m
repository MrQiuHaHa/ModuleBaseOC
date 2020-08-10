//
//  ModleBaseTableViewVC.m
//  Pods
//
//  Created by 邱俊荣 on 2020/8/10.
//

#import "ModleBaseTableViewVC.h"
#import <MJRefresh/MJRefresh.h>
#import "ModleBaseCell.h"

@interface ModleBaseTableViewVC ()<UITableViewDelegate,UITableViewDataSource,ModleBaseCellDelegate>

@end

@implementation ModleBaseTableViewVC

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.hasMore = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    self.tableView.estimatedRowHeight = 0;
    self.tableView.estimatedSectionHeaderHeight = 0;
    self.tableView.estimatedSectionFooterHeight = 0;
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(0);
        make.bottom.mas_equalTo(-BOTTOM_HEIGHT_BASE);
    }];
    
    if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
}

- (void)setIsSupportHeaderRefresh:(BOOL)isSupportHeaderRefresh
{
    _isSupportHeaderRefresh = isSupportHeaderRefresh;
    if (isSupportHeaderRefresh) {
        self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(refreshDataLoading)];
    }
}


- (void)setIsSupportFooterRefresh:(BOOL)isSupportFooterRefresh
{
    _isSupportFooterRefresh = isSupportFooterRefresh;
    if (isSupportFooterRefresh) {
        MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
        [footer setTitle:@"正在加载更多" forState:MJRefreshStateRefreshing];
        [footer setTitle:@"没有更多数据" forState:MJRefreshStateNoMoreData];
        [footer setTitle:@"点击或上拉加载更多" forState:MJRefreshStateIdle];
        footer.stateLabel.font = [UIFont systemFontOfSize:10];
        footer.stateLabel.textColor = [UIColor colorWithHexCode:@"#999999"];
        self.tableView.mj_footer = footer;
        self.hiddenFooterRefresh = true; //默认隐藏底部刷新控件
    }
}

- (void)setHiddenFooterRefresh:(BOOL)hiddenFooterRefresh
{
    _hiddenFooterRefresh = hiddenFooterRefresh;
    self.tableView.mj_footer.hidden = hiddenFooterRefresh;
}

- (void)refreshDataLoading{
    self.loadMore = false;
    self.hasMore = true;
    self.pageIndex = 0;
    [self.tableView.mj_header endRefreshing];
    [self.tableView.mj_footer resetNoMoreData];
};

- (void)loadMoreData{
    [self.tableView.mj_footer endRefreshing];
    if (self.hasMore) {
        [self.tableView.mj_footer endRefreshingWithNoMoreData];
        return;
    }
    self.loadMore = true;
    self.pageIndex += 1;
};

- (void)tableViewCell:(ModleBaseCell *)cell didClickButtonWithTag:(NSInteger)tag {};

#pragma mark - TableView Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}


@end
