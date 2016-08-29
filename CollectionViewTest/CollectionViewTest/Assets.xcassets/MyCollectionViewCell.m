//
//  MyCollectionViewCell.m
//  CollectionViewTest
//
//  Created by ChenZuo on 16/8/29.
//  Copyright © 2016年 ChenZuo. All rights reserved.
//

#import "MyCollectionViewCell.h"

@implementation MyCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    
}

- (UICollectionViewLayoutAttributes *)preferredLayoutAttributesFittingAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes
{
    UICollectionViewLayoutAttributes * attr = [super preferredLayoutAttributesFittingAttributes:layoutAttributes];
    
    CGRect frame =[self.textLabel.text boundingRectWithSize:CGSizeMake(0, 50) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:17]} context:nil];
    
    attr.frame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width + 10, frame.size.height);
    NSLog(@"attrFrame.w:%f",attr.frame.size.width);
    
    return attr;
    /**
     attributes.frame = NSString(string: textLabel.text!).boundingRectWithSize(CGSize(width: intmax_t(), height: Int(textLabel.frame.size.height)), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [NSFontAttributeName:textLabel.font], context: nil)
     */
    
}



@end
