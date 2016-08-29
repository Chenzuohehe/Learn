//
//  FirstViewController.m
//  CollectionViewTest
//
//  Created by ChenZuo on 16/8/28.
//  Copyright © 2016年 ChenZuo. All rights reserved.
//

#import "FirstViewController.h"
#import "MyCollectionViewCell.h"

@interface FirstViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UICollectionView *mainCollectionView;
@property (strong, nonatomic) NSArray * dataArray;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    [self.mainCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellID"];
    [self.mainCollectionView registerNib:[UINib nibWithNibName:@"MyCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"myCell"];
    
    
//    self.dataArray = @[@"长度设定1",@"长度设定22",@"长度设定333",@"长度设定444444",@"长度设定5",@"长度设定66",@"长度设定777",@"长度设定8888",@"长度设定999999长度设定999999"];
    self.dataArray = [@"The UICollectionViewFlowLayout class is a concrete layout object that organizes items into a grid with optional header and footer views for each section. The items in the collection view flow from one row or column (depending on the scrolling direction) to the next, with each row comprising as many cells as will fit. Cells can be the same sizes or different sizes."componentsSeparatedByString:@" "];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 9;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
//    NSString * titleString = self.dataArray[(indexPath.section + 1) * (indexPath.row + 1) -1];
    NSString * titleString = self.dataArray[indexPath.row];
    CGRect titileFrame = [titleString boundingRectWithSize:CGSizeMake(0, 50) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:17]} context:nil];
    
    NSLog(@"titleFrame.w:%f",titileFrame.size.width);
//    UILabel * titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, titileFrame.size.width, 30)];
    return CGSizeMake(titileFrame.size.width + 10, 50);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
//    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellID" forIndexPath:indexPath];
//    
//    NSString * titleString = self.dataArray[(indexPath.section + 1) * (indexPath.row + 1) -1];
//    CGRect titileFrame = [titleString boundingRectWithSize:CGSizeMake(0, 30) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:17]} context:nil];
//    
//    UILabel * titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, titileFrame.size.width, 30)];
//    titleLabel.tintColor = [UIColor blackColor];
//    titleLabel.backgroundColor = [UIColor redColor];
//    [cell.contentView addSubview:titleLabel];
//    cell.backgroundColor = [UIColor yellowColor];
    
    
    MyCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"myCell" forIndexPath:indexPath];
    cell.textLabel.text = self.dataArray[indexPath.row];
    
    return cell;
}

- (IBAction)backClick:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
    
}

//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
//    return 10;
//}
//
//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
//{
//    return 10;
//}

@end
