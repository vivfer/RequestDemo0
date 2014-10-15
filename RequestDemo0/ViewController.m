//
//  ViewController.m
//  RequestDemo0
//
//  Created by jianleer on 14-10-15.
//  Copyright (c) 2014年 jianleer. All rights reserved.
//

#import "ViewController.h"
#import "ASIFormDataRequest.h"
#import "JSONKit.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initView];
}

-(void)initView
{
    
    

    
    
    UIButton*getBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    getBtn.frame = CGRectMake(50, 150, 60, 44);
    [getBtn setTitle:@"GET" forState:UIControlStateNormal];
    [getBtn addTarget:self action:@selector(getRequest) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:getBtn];
    
    
    UIButton*postBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    postBtn.frame = CGRectMake(250, 150, 60, 44);
    [postBtn setTitle:@"POST" forState:UIControlStateNormal];
    [postBtn addTarget:self action:@selector(postRequst) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:postBtn];

    
    
    
    
    
}
-(void)getRequest
{
    NSLog(@"GET");
    NSString*str = @"http://api.map.baidu.com/telematics/v3/weather?location=北京&output=json&ak=5slgyqGDENN7Sy7pw29IUvrZ";
    NSString*encodingStr =[str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL*url = [NSURL URLWithString:encodingStr];
     ASIHTTPRequest*request = [ASIHTTPRequest requestWithURL:url];
    [request setCompletionBlock:^{
        NSLog(@"123");
        NSDictionary*dic= [request.responseData objectFromJSONData];
        NSLog(@"---GET Response Dic---:%@",dic);

    }];
    [request startAsynchronous];
    
}





-(void)postRequst
{
    NSLog(@"POST");
    NSURL*url = [NSURL URLWithString:@""];
  __block  ASIFormDataRequest*request = [ASIFormDataRequest requestWithURL:url];
    
//    [request setValue:<#(id)#> forKey:<#(NSString *)#>];
//    [request setValue:<#(id)#> forKey:<#(NSString *)#>];
    
    [request setCompletionBlock:^{
        NSDictionary*dic = [request.responseData objectFromJSONData];
        NSLog(@"---POST Response Dic---:%@",dic);
    }];
    [request startAsynchronous];
}








- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
