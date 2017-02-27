//
//  NSObject+Extent.m
//  UITableViewDemo2
//
//  Created by yang ming on 2016/12/29.
//  Copyright © 2016年 yang ming. All rights reserved.
//

#import "NSObject+Extent.h"

@implementation NSObject (Extent)
-(CGFloat)heightWidthText:(NSString *)text font:(UIFont *)font width:(CGFloat)width{
    NSDictionary *attributes=@{NSFontAttributeName:font};
    
    
    CGSize contentSize=[text boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options: NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading
                                       attributes:attributes
        context:nil].size;
    return contentSize.height+21;
}
@end
