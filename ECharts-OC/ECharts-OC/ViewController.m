//
//  ViewController.m
//  ECharts-OC
//
//  Created by rayootech on 16/5/24.
//  Copyright © 2016年 rayootech. All rights reserved.
//

#import "ViewController.h"
#import "ZWZZTViewController.h"
#import "ZWZXTViewController.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
/*MainTableView*/
@property(nonatomic,strong)UITableView *listTableView;

/*数据源*/
@property(nonatomic,strong)NSArray *dataArray;
@end

NSString *const cellID = @"cell";

@implementation ViewController

#pragma mark - 懒加载
-(UITableView *)listTableView{
    if (_listTableView == nil) {
        _listTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 20, self.view.bounds.size.width, self.view.bounds.size.height -20) style:UITableViewStylePlain];
    }
    return _listTableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    //设置标题
    self.title = @"图表列表";
    
    self.listTableView.dataSource = self;
    self.listTableView.delegate = self;
    [self.view addSubview:self.listTableView];
    //去除tableview底部线
    self.listTableView.tableFooterView = [UIView new];
    self.dataArray = @[@"柱状图",@"折线图"];
    
}

#pragma mark - UITableView Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = self.dataArray[indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController *baseVC ;
    switch (indexPath.row) {
        case 0:
            baseVC = [[ZWZZTViewController alloc]init];
            break;
        case 1:
            baseVC = [[ZWZXTViewController alloc]init];
            break;
        default:
            break;
    }
    [self.navigationController pushViewController:baseVC animated:YES];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
