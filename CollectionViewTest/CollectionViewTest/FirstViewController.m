//
//  FirstViewController.m
//  CollectionViewTest
//
//  Created by ChenZuo on 16/8/28.
//  Copyright © 2016年 ChenZuo. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UICollectionView *mainCollectionView;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 3;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 3;
}




- (IBAction)backClick:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
    
}




@end
