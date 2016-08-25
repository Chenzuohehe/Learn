//
//  ViewController.m
//  CollectionViewTest
//
//  Created by ChenZuo on 16/8/24.
//  Copyright © 2016年 ChenZuo. All rights reserved.
//

#import "ViewController.h"
#import "CustomCollectionViewCell.h"
#import "SearchOfFlowLayout.h"
#import "TypeCollectionViewCell.h"

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,SearchOfFlowLayoutDelegate>
//@property (strong, nonatomic) UICollectionView *mainCollectionView;
@property (strong, nonatomic) NSArray * hotTagArr;

@property (weak, nonatomic) IBOutlet UICollectionView *mainCollectionView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
//    self.mainCollectionView.collectionViewLayout = layout;
//    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    SearchOfFlowLayout *layout = [[SearchOfFlowLayout alloc]init];
    layout.delegate = self;
    layout.insertItemSpacing = 10;
    layout.sectionNumber = 3;
    self.mainCollectionView.collectionViewLayout = layout;
    
//    self.mainCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) collectionViewLayout:layout];
    
    self.mainCollectionView.delegate = self;
    self.mainCollectionView.dataSource = self;
    
    self.mainCollectionView.backgroundColor = [UIColor whiteColor];
    
    [self.mainCollectionView registerNib:[UINib nibWithNibName:@"CustomCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"CustomCell"];
    [self.mainCollectionView registerClass:[UICollectionViewCell class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"normalView"];
    [self.mainCollectionView registerNib:[UINib nibWithNibName:@"TypeCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"typeCell"];
    
    [self.view addSubview:self.mainCollectionView];
    
    
    self.hotTagArr = @[@"长度设定1",@"长度设定22",@"长度设定333",@"长度设定444444",@"长度设定5",@"长度设定66",@"长度设定777",@"长度设定8888",@"长度设定999999长度设定999999"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGFloat)widthForItemIndexPath:(NSIndexPath *)indexPath AndCollectioinView:(UICollectionView *)collectionView{
    
    if (indexPath.row == 0) {
        return [UIScreen mainScreen].bounds.size.width;
    }else{
        NSString *content = self.hotTagArr[indexPath.item];
        CGRect itemFrame = [content boundingRectWithSize:CGSizeMake(0, 20) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:17]} context:nil];
        
        CGFloat width = itemFrame.size.width + 10;
        return width;
    }
    
}

//
//-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
//{
//    return UIEdgeInsetsMake(0, 0, 0, 0);
//}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *content = self.hotTagArr[indexPath.row];
    CGRect itemFrame = [content boundingRectWithSize:CGSizeMake(0, 20) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:17]} context:nil];
    return CGSizeMake(itemFrame.size.width + 8, 50);
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        TypeCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"typeCell" forIndexPath:indexPath];
        return cell;
    }else{
        CustomCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CustomCell" forIndexPath:indexPath];
        cell.textLabel.text = self.hotTagArr[indexPath.row];
        
        return cell;
    }
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 9;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 5;
}

////header， footer
//- (UICollectionReusableView *) collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
//{
//    
//    UICollectionReusableView *reusableview = nil;
//    
//    UICollectionViewCell *cell = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"normalView" forIndexPath:indexPath];
//    
//    reusableview = cell;
//    
//    reusableview.backgroundColor = [UIColor yellowColor];
//    
//    return reusableview;
//}

////sectionHeader的size
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
//    
//    return CGSizeMake([UIScreen mainScreen].bounds.size.width, 100);
//}
@end
