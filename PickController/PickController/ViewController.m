//
//  ViewController.m
//  PickController
//
//  Created by MAC on 16/3/24.
//  Copyright © 2016年 chenzuo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIPickerViewDelegate,UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UIPickerView *myPickView;
@property(nonatomic,strong)NSArray *bank;
@end

@implementation ViewController


#pragma mark-使用懒加载，把数据信息加载进来
-(NSArray *)bank
{
    if (_bank==nil) {
        NSString *fullpath=[[NSBundle mainBundle]pathForResource:@"BankList.plist" ofType:nil];
        NSArray *arrayM=[NSArray arrayWithContentsOfFile:fullpath];
        _bank=arrayM;
    }
    return _bank;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    [self.myPickView selectRow:2 inComponent:0 animated:YES];
    [self.myPickView selectRow:5 inComponent:1 animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 代理协议
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 5;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return 5;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    return 60;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 25;
}


- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return @"测试";
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
    CGFloat width = CGRectGetWidth([UIScreen mainScreen].bounds)/ 3 - 4;
    if (component == 0) {
        //省
        //        NSString *state = [self.provinceArray objectAtIndex:row];
//        ProvinceData *pro = [self.provinceArray objectAtIndex:row];
        
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, 32)];
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, 32)];
        label.font = [UIFont systemFontOfSize:14];
        label.textAlignment = NSTextAlignmentCenter;
        label.text = @"测试1";
        
        label.textColor = [UIColor blackColor];
//        
//        if ([pro.id isEqualToString:self.selectPro.id]) {
//            //选中颜色
//            label.textColor = [UIColor colorWithRed:0.9 green:0 blue:0 alpha:1];
//        }
        
        [view addSubview:label];
        return view;
        
    } else if (component == 1){
        //市
        //        NSString *state = [_cityArray objectAtIndex:row];
//        CityData *city = [_cityArray objectAtIndex:row];
        
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, 32)];
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, 32)];
        label.font = [UIFont systemFontOfSize:14];
        label.textAlignment = NSTextAlignmentCenter;
        label.text = @"测试2";
        
        label.textColor = [UIColor blackColor];
        
//        if ([city.id isEqualToString:self.selectCity.id]) {
//            //选中颜色
//            label.textColor = RGB(204, 0, 0);
//        }
        
        [view addSubview:label];
        return view;
        
    }else{
        //区域
        //        NSString *state = [_areaArray objectAtIndex:row];
//        AreaData *area = [_areaArray objectAtIndex:row];
        
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, 32)];
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, 32)];
        label.font = [UIFont systemFontOfSize:14];
        label.textAlignment = NSTextAlignmentCenter;
        label.text = @"测试3";
        
        label.textColor = [UIColor blackColor];
        
//        if ([area.id isEqualToString:self.selectArea.id]) {
//            //选中颜色
//            label.textColor = RGB(204, 0, 0);
//        }
        
        [view addSubview:label];
        return view;
    }
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSLog(@"选择 row:%ld component %ld",row,component);
}

@end
