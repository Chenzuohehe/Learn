//
//  ViewController.m
//  calendar
//
//  Created by MAC on 16/3/31.
//  Copyright © 2016年 chenzuo. All rights reserved.
//

#import "ViewController.h"
#import "FSCalendar.h"

@interface ViewController ()<FSCalendarDataSource>
@property (weak, nonatomic) IBOutlet FSCalendar *calendar;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
}

- (nullable NSString *)calendar:(FSCalendar *)calendar subtitleForDate:(NSDate *)date
{
    
    NSString *stringDate = @"3/31/2016";
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"MM/dd/yyyy"];
    NSDate *dateCheck = [dateFormatter dateFromString:stringDate];
    if ([dateCheck isEqual:date]) {
        return @"今天";
    }
    return nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
