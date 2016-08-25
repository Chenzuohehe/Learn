//
//  SearchOfFlowLayout.m
//  CollectionViewTest
//
//  Created by ChenZuo on 16/8/24.
//  Copyright © 2016年 ChenZuo. All rights reserved.
//

#import "SearchOfFlowLayout.h"
#define WIDTH [UIScreen mainScreen].bounds.size.width


@interface SearchOfFlowLayout ()
//临时保存item的总宽度
@property (nonatomic, assign) CGFloat columnWidth;
//记录一共有多少行
@property (nonatomic, assign) NSInteger columnNumber;
//保存每一个item x y w h
@property (nonatomic, retain) NSMutableArray *arrForItemAtrributes;
//保存item总数
@property (nonatomic,assign) NSUInteger numberOfItems;
// 保存每个item的X值
@property (nonatomic, assign) CGFloat xForItemOrigin;
// 保存每个item的Y值
@property (nonatomic, assign) CGFloat yForItemOrigin;

@end


@implementation SearchOfFlowLayout

// 准备布局
- (void)prepareLayout {
    
    [super prepareLayout];
    
    /**
     *  临时宽度＝ 间距？
     */
    self.columnWidth = self.insertItemSpacing;
    self.columnNumber = 0;
    self.arrForItemAtrributes = [NSMutableArray array];
    self.xForItemOrigin = self.insertItemSpacing;
    self.yForItemOrigin = self.insertItemSpacing;
    
    NSLog(@"prepareLayout我被调用");
    
    
    for (NSInteger j = 0; j < self.sectionNumber; j++) {
        self.numberOfItems = [self.collectionView numberOfItemsInSection:j];
        for(int i = 0;i < self.numberOfItems;i++)
        {
            /** 确定每个Item的indexPath属性 */
            NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:j];
            /** 确定每个item的origin的x,y值 */
            /** 确定每个Item的frame属性,同时确定了每个Item的LayoutAttribute,放入到了布局属性数组中 */
            [self setFrame:indexPath];
        }
    }
    
    
//    //获取item的个数
//    /**
//     *  这边有个问题，section 都是0！
//     */
//    self.numberOfItems = [self.collectionView numberOfItemsInSection:0];
//    /** 为每个item确定LayoutAttribute属性,同时将这些属性放入布局数组中 */
//    for(int i = 0;i < self.numberOfItems;i++)
//    {
//        /** 确定每个Item的indexPath属性 */
//        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
//        /** 确定每个item的origin的x,y值 */
//        /** 确定每个Item的frame属性,同时确定了每个Item的LayoutAttribute,放入到了布局属性数组中 */
//        [self setFrame:indexPath];
//    }
    
}
// 计算contentView的大小
- (CGSize)collectionViewContentSize
{
    // 获取collectionView的Size
    CGSize contentSize = self.collectionView.frame.size;
    // 最大高度+bottom
    contentSize.height = self.insertItemSpacing + (self.itemSize.height + self.insertItemSpacing) * (self.columnNumber + 1);
    //设置collectionView的大小自适应
    self.collectionView.frame = CGRectMake(self.collectionView.frame.origin.x, self.collectionView.frame.origin.y, contentSize.width, contentSize.height);
    return contentSize;
}

// 返回每一个item的attribute
- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    // 返回每一个item的Attribute
    return self.arrForItemAtrributes;
}

// 设置属性和frame
- (void)setFrame:(NSIndexPath *)indexPath
{
    NSLog(@"setFrame我被调用");
    
    // 设置Item LayoutAttribute 属性
    UICollectionViewLayoutAttributes *layoutArr = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    // 获取item的高
    CGFloat itemWidth = 0;
    if (_delegate && [_delegate respondsToSelector:@selector(widthForItemIndexPath:AndCollectioinView:)]) {
        // 使用代理方法获取item的高
        itemWidth = [_delegate widthForItemIndexPath:indexPath AndCollectioinView:self.collectionView];
    }
    //之前item的宽总和 + 当前item的宽 + 间距 < 屏幕总款
    if (self.columnWidth + itemWidth + self.insertItemSpacing < WIDTH) {
        //设置x
        self.xForItemOrigin = self.columnWidth;
        self.columnWidth += itemWidth + self.insertItemSpacing;
    }else {
        self.xForItemOrigin = self.insertItemSpacing;
        //如果宽度超过屏幕从新计算宽度
        self.columnWidth = itemWidth + self.insertItemSpacing * 2;
        self.columnNumber++;
    }
    // 计算是第几行 乘以高度
    self.yForItemOrigin = self.insertItemSpacing + (self.itemSize.height + self.insertItemSpacing) * self.columnNumber  + 100;
    
    // 设置frame
    layoutArr.frame = CGRectMake(self.xForItemOrigin, self.yForItemOrigin, itemWidth, self.itemSize.height);
    // 放入数组
    [self.arrForItemAtrributes addObject:layoutArr];
}
@end
