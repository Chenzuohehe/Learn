//
//  MyWebView.m
//  urlTest
//
//  Created by MAC on 16/3/22.
//  Copyright © 2016年 chenzuo. All rights reserved.
//

#import "MyWebView.h"
#import <JavaScriptCore/JavaScriptCore.h>

@implementation MyWebView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(id)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    
    if( self ){
        self.webview=[[UIWebView alloc]initWithFrame:CGRectMake(0, 310, self.bounds.size.width, 300)];
        self.webview.backgroundColor=[UIColor lightGrayColor];
//        NSString *htmlPath=[[NSBundle mainBundle] resourcePath];
//        htmlPath=[htmlPath stringByAppendingPathComponent:@"html/index.html"];
//        NSURL *localURL=[[NSURL alloc]initFileURLWithPath:htmlPath];
        
        NSURL * url = [NSURL URLWithString:@"http://192.168.1.27:8080/pc/bank/testWebView.do"];
//        NSURLRequest * req = [NSURLRequest requestWithURL:url];
        [self.webview loadRequest:[NSURLRequest requestWithURL:url]];
        [self addSubview:self.webview];
        
        JSContext *context = [self.webview valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
        context[@"jakilllog"] = ^() {
            
            NSLog(@"+++++++Begin Log+++++++");
            NSArray *args = [JSContext currentArguments];
            
            for (JSValue *jsVal in args) {
                NSLog(@"%@", jsVal);
            }
            
            JSValue *this = [JSContext currentThis];
            NSLog(@"this: %@",this);
            NSLog(@"-------End Log-------");
            
        };
        
        
        //        [context evaluateScript:@"log('ider', [7, 21], { hello:'world', js:100 });"];
        
        
    }  
    return self;  
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self=[super initWithCoder:aDecoder];
    
    if( self ){
        self.webview=[[UIWebView alloc]initWithFrame:CGRectMake(0, 310, self.bounds.size.width, 300)];
        self.webview.backgroundColor=[UIColor lightGrayColor];
        //        NSString *htmlPath=[[NSBundle mainBundle] resourcePath];
        //        htmlPath=[htmlPath stringByAppendingPathComponent:@"html/index.html"];
        //        NSURL *localURL=[[NSURL alloc]initFileURLWithPath:htmlPath];
        
        NSURL * url = [NSURL URLWithString:@"http://192.168.1.27:8080/pc/bank/testWebView.do"];
        //        NSURLRequest * req = [NSURLRequest requestWithURL:url];
        [self.webview loadRequest:[NSURLRequest requestWithURL:url]];
        [self addSubview:self.webview];
        
        JSContext *context = [self.webview valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
        context[@"jakilllog"] = ^() {
            
            NSLog(@"+++++++Begin Log+++++++");
            NSArray *args = [JSContext currentArguments];
            
            for (JSValue *jsVal in args) {
                NSLog(@"%@", jsVal);
            }
            
            JSValue *this = [JSContext currentThis];
            NSLog(@"this: %@",this);
            NSLog(@"-------End Log-------");
            
        };
        
        
        //        [context evaluateScript:@"log('ider', [7, 21], { hello:'world', js:100 });"];
        
        
    }
    return self;
}
@end
