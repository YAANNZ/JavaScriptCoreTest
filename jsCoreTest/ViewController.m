//
//  ViewController.m
//  jsCoreTest
//
//  Created by ZHUYN on 2017/10/12.
//  Copyright © 2017年 zynabc. All rights reserved.
//

#import "ViewController.h"
#import "MBProgressHUD.h"

@interface ViewController () <UIWebViewDelegate>

@property (nonatomic, strong) UIWebView *webView;
@property (nonatomic, strong) JSContext *jsContext;
@property (nonatomic, strong) UIImageView *imgView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    // webView
    self.webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height/2, self.view.bounds.size.width, self.view.bounds.size.height/2)];
    self.webView.delegate = self;
    [self.view addSubview:self.webView];
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"index" ofType:@"html" inDirectory:@"web"]]]];
    
    // img Option
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 20, self.view.bounds.size.width-20, 30)];
    titleLabel.textColor = [UIColor blackColor];
    titleLabel.backgroundColor = [UIColor redColor];
    titleLabel.text = @"原生区域";
    [self.view addSubview:titleLabel];
    
    UIButton *operationBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [operationBtn setBackgroundColor:[UIColor brownColor]];
    operationBtn.frame = CGRectMake(10, 55, 100, 30);
    operationBtn.layer.cornerRadius = 5;
    [operationBtn setTitle:@"传给H5" forState:UIControlStateNormal];
    [operationBtn addTarget:self action:@selector(operationBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:operationBtn];
    
    UIButton *revokeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [revokeBtn setBackgroundColor:[UIColor brownColor]];
    revokeBtn.frame = CGRectMake(120, 55, 100, 30);
    revokeBtn.layer.cornerRadius = 5;
    [revokeBtn setTitle:@"撤销" forState:UIControlStateNormal];
    [revokeBtn addTarget:self action:@selector(revokeBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:revokeBtn];
    
    UIImageView *orgimgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"original"]];
    orgimgView.frame = CGRectMake(10, 90, 80, 80);
    [self.view addSubview:orgimgView];
    
    self.imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"original"]];
    self.imgView.frame = CGRectMake(100, 90, 80, 80);
    [self.view addSubview:self.imgView];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    // 设置javaScriptContext上下文
    self.jsContext = [webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    
    // 将tianbai对象指向自身
    self.jsContext[@"jsCoreTest"] = self;
    self.jsContext.exceptionHandler = ^(JSContext *context, JSValue *exceptionValue) {
        context.exception = exceptionValue;
        NSLog(@"异常信息：%@", exceptionValue);
    };
}

// 1、接收js的调用并回调
- (void)callOC:(NSString *)imgPath
{
    self.imgView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:imgPath]]];
    JSValue *callOCBack = self.jsContext[@"callOCBack"];
    [callOCBack callWithArguments:@[@"success"]];
}

// 2、调用js并接收回调
- (void)operationBtnClicked
{
    NSString *imgPath = [[NSBundle mainBundle] pathForResource:@"original" ofType:@"png"];
    JSValue *callJs = self.jsContext[@"callJs"];
    [callJs callWithArguments:[NSArray arrayWithObject:imgPath]];
}

- (void)callJsBack:(NSString *)typeStr
{
    NSLog(@"%@", typeStr);
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.label.text = typeStr;
    [hud hideAnimated:YES afterDelay:1.8];
}


- (void)revokeBtnClicked
{
    self.imgView.image = [UIImage imageNamed:@"original"];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
