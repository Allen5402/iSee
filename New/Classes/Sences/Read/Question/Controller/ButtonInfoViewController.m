//
//  ButtonInfoViewController.m
//  New
//
//  Created by allen on 16/8/15.
//  Copyright © 2016年 nattinessYang. All rights reserved.
//

#import "ButtonInfoViewController.h"
#import "TopicQueAns.h"
#import "TopicQueAndAnsTableViewCell.h"
#import "TopicInfoTableViewController.h"
@interface ButtonInfoViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong,nonatomic) UITableView *tableView;

@property (strong,nonatomic) NSMutableArray *buttonInfoArray;

@end

@implementation ButtonInfoViewController

- (NSMutableArray *)buttonInfoArray{
    if (!_buttonInfoArray) {
        _buttonInfoArray = [NSMutableArray array];
    }
    return _buttonInfoArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    
    [self setup];
    [self request];
}


//初始化
- (void)setup{
    UITableView *tableView = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds style:(UITableViewStylePlain)];
    [self.view addSubview:tableView];
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView registerClass:[TopicQueAndAnsTableViewCell class] forCellReuseIdentifier:@"buttonInfo_id"];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;//去掉分割线
    self.tableView = tableView;
}


- (void)request{
    NSString *str = [NSString stringWithFormat:@"http://c.m.163.com/newstopic/list/expert/classification/%@/0-10.html",self.parames];
    NSURL *url = [NSURL URLWithString:str];
    NSURLSession *sesion = [NSURLSession sharedSession];
    NSURLSessionTask *task = [sesion dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error == nil) {
            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingAllowFragments) error:nil];
            for (NSDictionary *dict in dic[@"data"][@"expertList"]) {
                TopicQueAns *topic = [[TopicQueAns alloc]init];
                [topic setValuesForKeysWithDictionary:dict];
                [self.buttonInfoArray addObject:topic];
            }
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.tableView reloadData];
            });
        }else{
            
        }
        
    }];
    [task resume];
}


#pragma mark tableView 实现方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.buttonInfoArray.count;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 220;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TopicQueAndAnsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"buttonInfo_id" forIndexPath:indexPath];
    cell.topic = self.buttonInfoArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    TopicInfoTableViewController *info = [TopicInfoTableViewController new];
    TopicQueAns *topic = self.buttonInfoArray[indexPath.row];
    info.expertId = topic.expertId;
    [self.navigationController pushViewController:info animated:YES];
}

@end
