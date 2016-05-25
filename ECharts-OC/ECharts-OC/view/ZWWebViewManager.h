//
//  ZWWebViewManager.h
//  ECharts-OC
//
//  Created by rayootech on 16/5/24.
//  Copyright © 2016年 rayootech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZWWebViewManager : UIView

//创建柱状图
-(void)createZhuZhuangTuWithLegend:(NSString *)legend ValueX:(NSArray *)arrayX showNumber:(NSArray *)numberArray;
//创建柱状图
-(void)createZhuZhuangTuWithLegend:(NSString *)legend ValueX:(NSArray *)arrayX showNumber:(NSArray *)numberArray  margin:(CGRect)frame;

//创建折线图
-(void)createZheXianTuWithTitle:(NSArray *)titles Legend:(NSArray *)legend ValueX:(NSArray *)arrayX data:(NSArray *)dataArray;
//创建折线图
-(void)createZheXianTuWithTitle:(NSArray *)titles Legend:(NSArray *)legend ValueX:(NSArray *)arrayX data:(NSArray *)dataArray  margin:(CGRect)frame;
@end
