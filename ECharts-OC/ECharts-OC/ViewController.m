//
//  ViewController.m
//  ECharts-OC
//
//  Created by rayootech on 16/5/24.
//  Copyright © 2016年 rayootech. All rights reserved.
//

#import "ViewController.h"
#import "ZWWebViewManager.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    ZWWebViewManager *manager = [[ZWWebViewManager alloc]initWithFrame:CGRectMake(-50, 50, 400, 400)];
    
//    [manager createZhuZhuangTuWithLegend:@"销量" ValueX:@[@"衬衫",@"羊毛衫",@"雪纺衫",@"裤子",@"高跟鞋",@"袜子"] showNumber:@[@5, @20, @40, @10, @10, @20]  margin:CGRectMake(-10, -10, 400, 400)];
    
    [manager createZhuZhuangTuWithLegend:nil ValueX:@[@"衬衫",@"羊毛衫",@"雪纺衫",@"裤子",@"高跟鞋",@"袜子"] showNumber:@[@5, @20, @40, @10, @10, @20]];
    [self.view addSubview:manager];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
