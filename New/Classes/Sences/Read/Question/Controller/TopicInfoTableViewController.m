//
//  TopicInfoTableViewController.m
//  New
//
//  Created by allen on 16/8/13.
//  Copyright © 2016年 nattinessYang. All rights reserved.
//

#import "TopicInfoTableViewController.h"
#import "TopicInfoTableViewCell.h"
#import "TopicQuestion.h"
#import "TopicAnswer.h"
#import <MJRefresh.h>
@interface TopicInfoTableViewController ()

@property (strong,nonatomic) NSMutableArray *questionArray;
@property (strong,nonatomic) NSMutableArray *answerArray;

@property (assign,nonatomic) NSInteger currentPage;

@end

@implementation TopicInfoTableViewController

- (NSMutableArray *)questionArray{
    if (!_questionArray) {
        _questionArray = [NSMutableArray array];
    }
    return _questionArray;
}
- (NSMutableArray *)answerArray{
    if (!_answerArray) {
        _answerArray = [NSMutableArray array];
    }
    return _answerArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //注册
    [self.tableView registerClass:[TopicInfoTableViewCell class] forCellReuseIdentifier:@"infoCell_id"];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self request];
    [self refresh];
    self.currentPage = 0;
}

#pragma mark  第一页数据请求
- (void)request{
    NSString *str = [NSString stringWithFormat:@"http://c.m.163.com/newstopic/qa/%@.html",self.expertId];
    NSURL *url = [NSURL URLWithString:str];
    NSURLSession *sesion = [NSURLSession sharedSession];
    NSURLSessionTask *task = [sesion dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error == nil) {
            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingAllowFragments) error:nil];
            for (NSDictionary *dict in dic[@"data"][@"hotList"]) {
                TopicQuestion *question = [TopicQuestion new];
                TopicAnswer *answer = [TopicAnswer new];
                [question setValuesForKeysWithDictionary:dict[@"question"]];
                [answer setValuesForKeysWithDictionary:dict[@"answer"]];
                [self.questionArray addObject:question];
                [self.answerArray addObject:answer];
            }
            NSLog(@"%@",[NSThread currentThread]);
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.tableView reloadData];
                [self.tableView.mj_header endRefreshing];
            });
        }else{
                [self.tableView.mj_header endRefreshing];
        }
        
    }];
    [task resume];
}


#pragma mark  上拉加载
- (void)loadMore{
    self.currentPage += 10;
    NSLog(@"%ld",self.currentPage);
    NSString *str = [NSString stringWithFormat:@"http://c.m.163.com/newstopic/list/latestqa/%@/%ld-10.html",self.expertId,self.currentPage];
    NSURL *url = [NSURL URLWithString:str];
    NSURLSession *sesion = [NSURLSession sharedSession];
    NSURLSessionTask *task = [sesion dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error == nil) {
            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingAllowFragments) error:nil];
            for (NSDictionary *dict in dic[@"data"]) {
                TopicQuestion *question = [TopicQuestion new];
                TopicAnswer *answer = [TopicAnswer new];
                [question setValuesForKeysWithDictionary:dict[@"question"]];
                [answer setValuesForKeysWithDictionary:dict[@"answer"]];
                [self.questionArray addObject:question];
                [self.answerArray addObject:answer];
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.tableView reloadData];
                [self.tableView.mj_footer endRefreshing];
            });
        }
        
    }];
    [task resume];
}

#pragma mark  上拉加载下拉刷新
//刷新数据
- (void)refresh{
    //1.下拉刷新;
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self request];
    }];
    
    //上拉刷新
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [self loadMore];
    }];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.questionArray.count;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    TopicQuestion *question = self.questionArray[indexPath.row];
    TopicAnswer *answer = self.answerArray[indexPath.row];
    
    return (question.cellHeight + answer.cellHeight + 110);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TopicInfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"infoCell_id" forIndexPath:indexPath];
    cell.selectionStyle =UITableViewCellSelectionStyleNone;
    cell.question = self.questionArray[indexPath.row];
    cell.answer = self.answerArray[indexPath.row];
    
    return cell;
}



@end
