//
//  ViewController.m
//  urlTest
//
//  Created by MAC on 16/3/22.
//  Copyright © 2016年 chenzuo. All rights reserved.
//

#import "ViewController.h"
#import "MyWebView.h"

#define TRUSTED_HOST @"http://192.168.1.27:8080/pc/pay/toPinganPay?orderId=2016032210004798&amount=6406.4&type=2&payType=2&bankType=jjk&plantBankId=ICBC-D&custId=100000000002677&isApp=true"

#define TRUSTED_HOST2 @"https://testebank.sdb.com.cn/khpayment/khPayment_bind.do"

@interface ViewController ()<NSURLConnectionDelegate,NSURLConnectionDataDelegate>
{
    NSURLConnection * _urlConnection;
    NSURLRequest * _request;
    
    NSMutableData *contentData;
    NSURLConnection *conn;
}

/**
 -  存储data数据
 */
@property(nonatomic,strong)NSMutableData *dataM;
/**
 -  访问url链接
 */
@property(nonatomic,strong)NSURL *url;

@property (weak, nonatomic) IBOutlet MyWebView *mainView;
@property (weak, nonatomic) IBOutlet UITextField *urlTextField;

@property (assign, nonatomic) BOOL authenticated;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}
- (IBAction)loadRequest:(id)sender {
    
//    self.url = [NSURL URLWithString:TRUSTED_HOST2];
//    _request = [NSURLRequest requestWithURL:self.url];
//    [NSURLConnection connectionWithRequest:_request delegate:self];
    
    NSURL * url = [NSURL URLWithString:@"http://192.168.1.27:8080/pc/bank/testWebView.do"];
    NSURLRequest * req = [NSURLRequest requestWithURL:url];
    [self.mainView loadRequest:req];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




# pragma - mark 222
//- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType;
//{
//    NSLog(@"Did start loading: %@ auth:%d", [[request URL] absoluteString], _authenticated);
//    
//    if (!_authenticated) {
//        _authenticated = NO;
//        
//        _urlConnection = [[NSURLConnection alloc] initWithRequest:_request delegate:self];
//        
//        [_urlConnection start];
//        
//        return NO;
//    }
//    
//    return YES;
//}
//
//
//#pragma mark - NURLConnection delegate
//
//- (void)connection:(NSURLConnection *)connection didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge;
//{
//    NSLog(@"WebController Got auth challange via NSURLConnection");
//    
//    if ([challenge previousFailureCount] == 0)
//    {
//        _authenticated = YES;
//        
//        NSURLCredential *credential = [NSURLCredential credentialForTrust:challenge.protectionSpace.serverTrust];
//        
//        [challenge.sender useCredential:credential forAuthenticationChallenge:challenge];
//        
//    } else
//    {
//        [[challenge sender] cancelAuthenticationChallenge:challenge];
//    }
//}
//
//- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response;
//{
//    NSLog(@"WebController received response via NSURLConnection");
//    
//    // remake a webview call now that authentication has passed ok.
//    _authenticated = YES;
//    [self.mainView loadRequest:_request];
//    
//    // Cancel the URL connection otherwise we double up (webview + url connection, same url = no good!)
//    [_urlConnection cancel];
//}
//
//// We use this method is to accept an untrusted site which unfortunately we need to do, as our PVM servers are self signed.
//- (BOOL)connection:(NSURLConnection *)connection canAuthenticateAgainstProtectionSpace:(NSURLProtectionSpace *)protectionSpace
//{
//    return [protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodServerTrust];
//}


@end
