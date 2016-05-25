//
//  ZWWebViewManager.m
//  ECharts-OC
//
//  Created by rayootech on 16/5/24.
//  Copyright © 2016年 rayootech. All rights reserved.
//

#import "ZWWebViewManager.h"
#import <JavaScriptCore/JavaScriptCore.h>
@interface ZWWebViewManager()<UIWebViewDelegate>
/*webView*/
@property(nonatomic,weak)UIWebView *webView ;
//执行的js
@property(nonatomic,copy)NSString *js;
//执行的frame
@property(nonatomic,copy)NSString *jsframe;
/*JSContext*/
@property(nonatomic,strong)JSContext *context;
@end

@implementation ZWWebViewManager

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIWebView *webView = [[UIWebView alloc]initWithFrame:self.bounds];
        webView.delegate = self;
        webView.scrollView.scrollEnabled = NO;
        webView.backgroundColor = [UIColor greenColor];
        self.webView = webView;
        [self addSubview:webView];
        //首先创建JSContext 对象（此处通过当前webView的键获取到jscontext）
        JSContext *context=[self.webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
        self.context = context;
    }
    return self;
}

-(void)createZhuZhuangTuWithLegend:(NSString *)legend ValueX:(NSArray *)arrayX showNumber:(NSArray *)numberArray{
    
    if (!legend) {
        legend = @"";
    }
    NSString *path = [[NSBundle mainBundle]pathForResource:@"localjs_zhuzhuangtu" ofType:@"html"];
    NSURL *url = [NSURL URLWithString:path];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
    NSMutableArray *msarray = [NSMutableArray arrayWithCapacity:arrayX.count];
    for (NSString *value  in arrayX) {
        [msarray addObject:[NSString stringWithFormat:@"'%@'",value]];
    }
    NSString * _value = [msarray componentsJoinedByString:@","];
    
    //显示数据
    NSString * _value2 = [numberArray componentsJoinedByString:@","];
    
    self.jsframe = [NSString  stringWithFormat:@"divframe(%.0f,%.0f,%.0f,%.0f)",0.0,0.0,self.bounds.size.width,self.bounds.size.height];
    self.js= [NSString  stringWithFormat:@"ZZT('%@',[%@],[%@])",legend,_value,_value2]; //准备执行的js代码
}

#pragma mark - 创建柱状图
-(void)createZhuZhuangTuWithLegend:(NSString *)legend ValueX:(NSArray *)arrayX
                        showNumber:(NSArray *)numberArray margin:(CGRect)frame{
    NSString *path = [[NSBundle mainBundle]pathForResource:@"localjs_zhuzhuangtu" ofType:@"html"];
    NSURL *url = [NSURL URLWithString:path];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
    NSMutableArray *msarray = [NSMutableArray arrayWithCapacity:arrayX.count];
    for (NSString *value  in arrayX) {
        [msarray addObject:[NSString stringWithFormat:@"'%@'",value]];
    }
    NSString * _value = [msarray componentsJoinedByString:@","];
    
    //显示数据
    NSString * _value2 = [numberArray componentsJoinedByString:@","];
    
    self.jsframe = [NSString  stringWithFormat:@"divframe(%.0f,%.0f,%.0f,%.0f)",frame.origin.x,frame.origin.y,frame.size.width,frame.size.height];
    self.js= [NSString  stringWithFormat:@"ZZT('%@',[%@],[%@])",legend,_value,_value2]; //准备执行的js代码
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self.context evaluateScript:self.jsframe];//通过oc方法调用js的alert
    [self.context evaluateScript:self.js];//通过oc方法调用js的alert
    
}
@end
