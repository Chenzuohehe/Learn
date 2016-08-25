//
//  SearchOfFlowLayout.h
//  CollectionViewTest
//
//  Created by ChenZuo on 16/8/24.
//  Copyright © 2016年 ChenZuo. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SearchOfFlowLayoutDelegate <NSObject>

// 获取item高度
- (CGFloat)widthForItemIndexPath:(NSIndexPath *)indexPath AndCollectioinView:(UICollectionView *)collectionView;

@end



@interface SearchOfFlowLayout : UICollectionViewFlowLayout


@property (nonatomic, assign) id<SearchOfFlowLayoutDelegate>delegate;
// item 间距
@property (nonatomic,assign)CGFloat insertItemSpacing;
@property (nonatomic,assign)NSInteger sectionNumber;


@end
