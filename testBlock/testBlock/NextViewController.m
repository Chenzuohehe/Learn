//
//  NextViewController.m
//  testBlock
//
//  Created by ChenZuo on 2016/10/14.
//  Copyright © 2016年 ChenZuo. All rights reserved.
//

#import "NextViewController.h"

@interface NextViewController ()
@property (strong, nonatomic)void (^firstBlock)();
@property (strong, nonatomic)UITextField * mainTextField;
@end

@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 100, 100, 40);
    button.backgroundColor = [UIColor yellowColor];
    [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    self.mainTextField = [[UITextField alloc]init];
    self.mainTextField.frame = CGRectMake(100, 50, 100, 30);
    self.mainTextField.backgroundColor = [UIColor grayColor];
    [self.view addSubview:self.mainTextField];
    
    myBlock();
    
    
    __block int a = 10;
    
    void (^printBlock)(int) = ^(int b){
        a = a + b;
    };
    printBlock(8);
    NSLog(@"%d",a);
    
    NSString *(^block3)(NSString *) = ^(NSString *string) {
        string = [NSString stringWithFormat:@"%@_%@",string,string];
        return string;
    };
    NSLog(@"%@",block3(@"我是字符串"));
    
    
    int e = 0;
    void (^block)(void) = ^(){printf("e = %i\n",e);};
    e=10;
    block();
    
    self.firstBlock = ^{
        NSLog(@"123   321");
    };
    _firstBlock();
}

void (^ myBlock)() = ^(){
    NSLog(@"123");
};



- (void)back{
    
//    if (self.delegate && [self.delegate respondsToSelector:@selector(popTextValue:)]) {
//        [self.delegate popTextValue:self.mainTextField.text];
//    }
    if (self.myBlock) {
        self.myBlock(self.mainTextField.text);
    }
    if (self.colorBlock) {
        self.colorBlock([UIColor colorWithDisplayP3Red:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1]);
    }
    NSArray *viewcontrollers=self.navigationController.viewControllers;
    if (viewcontrollers.count>1) {
        if ([viewcontrollers objectAtIndex:viewcontrollers.count-1]==self) {
            //push方式
            [self.navigationController popViewControllerAnimated:YES];
        }
    }
    else{
        //present方式
        [self dismissViewControllerAnimated:YES completion:^{
            
        }];
    }
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
