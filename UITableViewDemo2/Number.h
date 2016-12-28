
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface Number : NSObject
@property (nonatomic, copy)  NSString *titleNumber;
@property (nonatomic, copy)  NSString *detailDescription;
//根据内容获取所需高度
@property(nonatomic,assign) CGFloat cellHeight;
+(instancetype) number;



@end
