//
//  ZWWebViewController.m
//  ECharts-OC
//
//  Created by rayootech on 16/5/24.
//  Copyright © 2016年 rayootech. All rights reserved.
//

#import "ZWZZTViewController.h"
#import "ZWWebViewManager.h"
@interface ZWZZTViewController ()

@end

@implementation ZWZZTViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    ZWWebViewManager *manager = [[ZWWebViewManager alloc]initWithFrame:CGRectMake(0, 0, 450, 450)];
    
//        [manager createZhuZhuangTuWithLegend:@"销量" ValueX:@[@"衬衫",@"羊毛衫",@"雪纺衫",@"裤子",@"高跟鞋",@"袜子"] showNumber:@[@5, @20, @40, @10, @10, @20]  margin:CGRectMake(-10, -10, 400, 400)];
    
    [manager createZhuZhuangTuWithLegend:@"销量" ValueX:@[@"衬衫",@"羊毛衫",@"雪纺衫",@"裤子",@"高跟鞋",@"袜子"] showNumber:@[@5, @20, @40, @10, @10, @20]];
    [self.view addSubview:manager];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
