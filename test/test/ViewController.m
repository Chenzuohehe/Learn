//
//  ViewController.m
//  test
//
//  Created by MAC on 16/4/2.
//  Copyright © 2016年 chenzuo. All rights reserved.
//

#import "ViewController.h"
#import "FirstViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *numTextField;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    NSDecimalNumber * allPriceNum = [[NSDecimalNumber init]initWithString:@"8500"];
//    NSLog( @"%@",allPriceNum);
    
//    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"BankListXE"ofType:@"json"];
//    //根据文件路径读取数据
//    NSData *jdata = [[NSData alloc]initWithContentsOfFile:filePath];
    
    
    NSNumber * number;
    
    
    
    CGFloat row = ceil(3/4.0);
    NSLog(@"%f",row);
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(iWant) name:@"11123456" object:nil];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)firstBtn:(id)sender {
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"123456" object:nil];
    FirstViewController * nextViewController = [[FirstViewController alloc]initWithNibName:@"FirstViewController" bundle:nil];
    
    [self presentViewController:nextViewController animated:YES completion:^{
        
    }];
}
- (void)iWant
{
    NSLog(@"123456 已经被触发");
}


- (IBAction)Compute:(UIButton *)sender {
    CGFloat x = (CGFloat)[self.numTextField.text doubleValue];
    CGFloat row = ceil(x/4.0);
    [sender setTitle:[NSString stringWithFormat:@"%f",row] forState:UIControlStateNormal];
}


@end
