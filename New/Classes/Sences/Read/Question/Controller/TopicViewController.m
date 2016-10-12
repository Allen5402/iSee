//
//  TopicViewController.m
//  New
//
//  Created by nattinessYang on 16/8/12.
//  Copyright © 2016年 nattinessYang. All rights reserved.
//

#import "TopicViewController.h"
#import "TopicQueAndAnsTableViewCell.h"
#import "TopicQueAns.h"
#import <MJRefresh.h>
#import "UIView+Extension.h"
#import <UIImageView+WebCache.h>
#import "TopicInfoTableViewController.h"
#import "TopicCollectionViewCell.h"
#import "TopButton.h"
#import "ButtonInfoViewController.h"


#define kWith self.view.width
@interface TopicViewController ()<UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
/**topic顶部视图*/
@property (strong,nonatomic) UICollectionView *collectionView;

/**第一页话题视图*/
@property (strong,nonatomic) UITableView *topicTableView;

/**第一页数据源*/
@property (strong,nonatomic) NSMutableArray *topicArray;

/**第一页collectionView数据源数组*/
@property (strong,nonatomic) NSMutableArray *buttonArray;

/**上拉刷新参数变量*/
@property (assign,nonatomic) NSInteger currentPage;

@end

@implementation TopicViewController

- (NSMutableArray *)topicArray{
    if (!_topicArray) {
        _topicArray = [NSMutableArray array];
    }
    return _topicArray;
}

- (NSMutableArray *)buttonArray{
    if (!_buttonArray) {
        _buttonArray = [NSMutableArray array];
    }
    return _buttonArray;
}




- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
   
    //整体布局
    [self setup];
    
    //第一页数据请求
    [self request];
    self.currentPage = 0;
    
    //上拉下拉刷新
    [self refresh];
    
    //顶部collectionView的数据请求
    [self buttonRequest];
    
    
    
}


#pragma mark  初始化
- (void)setup{
    //collectionView初始化
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.itemSize = CGSizeMake(self.view.width/5 - 30, self.view.width/5 - 10);
    flowLayout.minimumLineSpacing = 10;
    flowLayout.minimumInteritemSpacing = 20;
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    flowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, self.view.width, (self.view.width/5 - 10)*2+20) collectionViewLayout:flowLayout];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    collectionView.backgroundColor = [UIColor whiteColor];
    collectionView.bounces = NO;
    collectionView.showsVerticalScrollIndicator = NO;
    self.collectionView = collectionView;
    [self.collectionView registerClass:[TopicCollectionViewCell class] forCellWithReuseIdentifier:@"collectionViewCell_id"];
    
    
    //topicTableView初始化
    UITableView *topicTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:(UITableViewStylePlain)];
    [topicTableView registerClass:[TopicQueAndAnsTableViewCell class] forCellReuseIdentifier:@"topic"];
    topicTableView.delegate = self;
    topicTableView.dataSource = self;
    topicTableView.separatorStyle = UITableViewCellSeparatorStyleNone;//去掉分割线
    topicTableView.autoresizingMask = UIViewAutoresizingNone;
    topicTableView.contentInset = UIEdgeInsetsMake(35, 0, 0, 0);
    self.navigationController.navigationBar.translucent = NO;
    topicTableView.tableHeaderView = collectionView;
    topicTableView.rowHeight = 220;
    self.topicTableView = topicTableView;
    [self.view addSubview:_topicTableView];//话题tableView添加到scrollView上
    
}


#pragma mark  button列表数据请求
- (void)buttonRequest{
    NSString *str = @"http://c.m.163.com/newstopic/list/classification.html";
    NSURL *url = [NSURL URLWithString:str];
    NSURLSession *sesion = [NSURLSession sharedSession];
    NSURLSessionTask *task = [sesion dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error == nil) {
            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingAllowFragments) error:nil];
            for (NSDictionary *dict in dic[@"data"]) {
                TopButton *topButton = [[TopButton alloc]init];
                [topButton setValuesForKeysWithDictionary:dict];
                [self.buttonArray addObject:topButton];
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.collectionView reloadData];
            });
        }else{
            
        }
        
    }];
    [task resume];
}

#pragma mark  第一页数据请求
- (void)request{
    [self.topicTableView.mj_header beginRefreshing];
    NSString *str = @"http://c.m.163.com/newstopic/list/expert/5YWo5Zu9/0-10.html";
    NSURL *url = [NSURL URLWithString:str];
    NSURLSession *sesion = [NSURLSession sharedSession];
    NSURLSessionTask *task = [sesion dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error == nil) {
            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingAllowFragments) error:nil];
                    for (NSDictionary *dict in dic[@"data"][@"expertList"]) {
                        TopicQueAns *topic = [[TopicQueAns alloc]init];
                        [topic setValuesForKeysWithDictionary:dict];
                        [self.topicArray addObject:topic];
                    }
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.topicTableView reloadData];
                [self.topicTableView.mj_header endRefreshing];
            
            });
        }else{
            [self.topicTableView.mj_header endRefreshing];
        }
        
    }];
    [task resume];
}

#pragma mark 刷新控件
- (void)refresh{
    //1.下拉刷新;
    self.topicTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self request];
    }];
    
    //上拉刷新
    self.topicTableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [self loadMore];
    }];
                            
}

#pragma mark 下拉刷新
- (void)loadNew{
    [self request];
}


#pragma mark  上拉加载
- (void)loadMore{
    self.currentPage += 10;
    NSLog(@"%ld",self.currentPage);
    NSString *str = [NSString stringWithFormat:@"http://c.m.163.com/newstopic/list/expert/5YWo5Zu9/%ld-10.html",self.currentPage];
    NSURL *url = [NSURL URLWithString:str];
    NSURLSession *sesion = [NSURLSession sharedSession];
    NSURLSessionTask *task = [sesion dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error == nil) {
            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingAllowFragments) error:nil];
            for (NSDictionary *dict in dic[@"data"][@"expertList"]) {
                TopicQueAns *topic = [[TopicQueAns alloc]init];
                [topic setValuesForKeysWithDictionary:dict];
                [self.topicArray addObject:topic];
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                if (self.currentPage < 100) {
                    [self.topicTableView.mj_footer endRefreshing];
                    [self.topicTableView reloadData];
                }else{
                    [self.topicTableView.mj_footer endRefreshingWithNoMoreData];
                }
            });
            
        }
        
    }];
    [task resume];
    

}








#pragma mark collectionView代理方法
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.buttonArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    TopicCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectionViewCell_id" forIndexPath:indexPath];
    cell.topButton = self.buttonArray[indexPath.row];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    ButtonInfoViewController *info = [ButtonInfoViewController new];
    
    TopButton *topButton = self.buttonArray[indexPath.row];
    info.parames = topButton.ID;
    
    [self.navigationController pushViewController:info animated:YES];
}
//切掉上下左右边距
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(nonnull UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(10, 20, 0, 20);
}




#pragma mark topicTableView代理方法

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.topicArray.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
        TopicQueAndAnsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"topic" forIndexPath:indexPath];
        cell.selectionStyle =UITableViewCellSelectionStyleNone;
        cell.topic = _topicArray[indexPath.row];
        return cell;
    
}


#pragma mark  点击cell进入详情
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
        TopicInfoTableViewController *info = [[TopicInfoTableViewController alloc]init];
        TopicQueAns *queAns = self.topicArray[indexPath.row];
        info.expertId = queAns.expertId;
        [self.navigationController pushViewController:info animated:YES];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
