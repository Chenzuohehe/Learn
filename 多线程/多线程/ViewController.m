//
//  ViewController.m
//  多线程
//
//  Created by ChenZuo on 16/5/31.
//  Copyright © 2016年 ChenZuo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 线程创建
- (void)NSThreadInit
{
    /**
     *  创建并开始线程
     *
     *  @param thread1 多线程事件1
     *
     *  @return
     */
    [NSThread detachNewThreadSelector:@selector(doThread1) toTarget:self withObject:nil];
    
    /**
     创建线程
     */
    NSThread * thread2 = [[NSThread alloc]initWithTarget:self selector:@selector(doThread2) object:nil];
    [thread2 start];
    
    
    /**
     *  隐式创建线程
     *
     *  @param doThread3 多线程事件3
     *
     *  @return
     */
    [self performSelector:@selector(doThread3) withObject:nil];
    
}

#pragma mark - 线程方法 （参考源码）
- (void)DoNSThread{
    
    //获取当前线程
    NSThread * currentThread = [NSThread currentThread];
    NSLog(@"currentThread %@",currentThread);
    
    
//    //number == 1,主线程 != 1后台线程
//    int number = [NSThread currentThread];
//    NSLog(@"%d",number);
    
    
    //创建并开始线程
    [NSThread detachNewThreadSelector:@selector(doThread1) toTarget:self withObject:nil];
    
    //是否多线程
    BOOL isMultiThread = [NSThread isMultiThreaded];
    if (isMultiThread) {
        NSLog(@"isMutliThread");
    }else{
        NSLog(@"isNotMutliThread");
    }
    
    //线程阻塞到
    [NSThread sleepUntilDate:[NSDate date]];
    //线程阻塞多长时间
    [NSThread sleepForTimeInterval:NSTimeIntervalSince1970];
    //退出线程
    [NSThread exit];
    //线程优先级 0.0 － 1.0 默认0.5
    [NSThread threadPriority];
    //设置优先级吧
    [NSThread setThreadPriority:0.6];
    
    NSLog(@"currentThread.threadDictionary %@",currentThread.threadDictionary);
    
    
    /**
     *  NSQualityOfService枚举定义了以下值：
     - UserInteractive：在实现图形密集型相关工作时使用UserInteractive QoS，比如滚动或动画。
     - UserInitiated：在实现用户精确请求请求相关工作时使用UserInitiated QoS，但不要求精确到毫秒，比如动画。例如，如果用户打开email app马上查看邮件。
     - Utility:Utility QoS用于执行已经由用户请求自动发生的任务。例如，电子邮件应用程序可以被配置为每隔5分钟自动检查邮件。如果系统是非常有限的资源，而电子邮件检查被推迟几分钟这也是被允许的。
     - Background: Background QoS用于执行用户可能甚至都没有意识到正在发生的工作，比如email app可能使用它来执行索引搜索
     
     优先级从高到低
     */
    currentThread.qualityOfService = NSQualityOfServiceDefault;
    currentThread.name = @"当前线程名称";
    NSLog(@"currentThread.name = %@",currentThread.name);
    //堆的大小
    NSInteger size = currentThread.stackSize;
    NSLog(@"currentThread.size %ld",size);
    
    
    BOOL isMain = currentThread.isMainThread;
    if (isMain) {
        NSLog(@"isMain");
    }else{
        NSLog(@"noMain");
    }
    
    //主线程的对象
    NSThread * mainThread = [NSThread mainThread];
    
    
}




- (void)doThread1{
    
    NSLog(@"1");
}

- (void)doThread2{
    NSLog(@"2");
}

- (void)doThread3{
    NSLog(@"3");
}

@end
