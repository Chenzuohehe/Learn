//
//  NextViewController.h
//  testBlock
//
//  Created by ChenZuo on 2016/10/14.
//  Copyright © 2016年 ChenZuo. All rights reserved.
//

#import "ViewController.h"

@protocol NextViewControllerDelegate <NSObject>

- (void)popTextValue:(NSString *)text;

@end


@interface NextViewController : ViewController
@property (assign, nonatomic)id <NextViewControllerDelegate>delegate;
@property (copy , nonatomic)void (^myBlock)(NSString *);
@property (copy, nonatomic)void (^colorBlock)(UIColor *);
@end
