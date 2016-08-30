//
//  ViewController.m
//  urlTest
//
//  Created by ChenZuo on 16/8/23.
//  Copyright © 2016年 ChenZuo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIWebViewDelegate>
@property(strong ,nonatomic)UIWebView * mainWebView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    self.mainWebView = [[UIWebView alloc]init];
    self.mainWebView.frame = CGRectMake(0, 0, 375, 600);
    [self.view addSubview:self.mainWebView];
    
    self.mainWebView.delegate = self;
    [self.mainWebView loadHTMLString:@"<p>1. 努力提高自身的知名度、信用度、美誉度，维护好自身光辉形象。 </p>\n<p>2. 利用自己的人脉资源,通过各种分享和传播渠道，帮助企业添加有效客户。</p>\n<p>3. 与客户保持良好沟通，提高企业在客户中的口碑。</p>" baseURL:nil];
    
    CGRect frame = self.mainWebView.frame;
    frame.size.height = 1;
    self.mainWebView.frame = frame;
    frame = self.mainWebView.frame;
    frame.size = [self.mainWebView sizeThatFits:CGSizeZero];
    self.mainWebView.frame = frame;
    
    
    /**
     基本上完美解决
     */
    UILabel * label = [[UILabel alloc]init];
    NSString *strHtml = @"<p>1. 努力提高自身的知名度、信用度、美誉度，维护好自身光辉形象。 </p>\n<p>2. 利用自己的人脉资源,通过各种分享和传播渠道，帮助企业添加有效客户。</p>\n<p>3. 与客户保持良好沟通，提高企业在客户中的口碑。</p>";
    NSAttributedString * strAtt = [[NSAttributedString alloc] initWithData:[strHtml dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes:nil error:nil];
    
//    CGSize size = [strHtml boundingRectWithSize:CGSizeMake(0, 375) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName :[UIFont systemFontOfSize:17]} context:nil].size;
//    label.frame = CGRectMake(0, 200, 375, size.height);
    label.attributedText = strAtt;
    label.numberOfLines = 0;
    label.backgroundColor = [UIColor yellowColor];
    CGFloat h = [label sizeThatFits:CGSizeMake(375,CGFLOAT_MAX)].height;
    NSLog(@"%f",h);
    label.frame = CGRectMake(0, 200, 375, h);
    [self.view addSubview:label];
    
//    NSAttributedString *attrStr = ... // your attributed string
//    CGFloat width = 300; // whatever your desired width is
//    CGRect rect = [attrStr boundingRectWithSize:CGSizeMake(width, 10000) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading context:nil];
    
    
    
    //    label.attributedText = strAtt;
    
    
//    NSURL *url = [[NSBundle mainBundle] URLForResource:@"iOS-OC中加载html5调用html方法和修改HTML5内容 - 简书" withExtension:@"html"];
//    NSURLRequest *request = [NSURLRequest requestWithURL:url];
//    [self.mainWebView loadRequest:request];
    
    
    //    NSURL *url = [[NSURL alloc]initWithString:self.urlString];
    //
    //    [self.mainWebView loadRequest:[NSURLRequest requestWithURL:url]];
    
    self.mainWebView.scrollView.bounces = NO;
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    CGFloat documentWidth = [[self.mainWebView stringByEvaluatingJavaScriptFromString:@"document.getElementById('content').offsetWidth"] floatValue];
    CGFloat documentHeight = [[self.mainWebView stringByEvaluatingJavaScriptFromString:@"document.getElementById(\"content\").offsetHeight;"] floatValue];
    NSLog(@"documentSize = {%f, %f}", documentWidth, documentHeight);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
