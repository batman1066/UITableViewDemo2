#import <Foundation/Foundation.h>

@interface NumberGroup : NSObject
@property (nonatomic,copy) NSString *groupHeader;
@property (nonatomic,copy) NSString *groupFooter;
@property (nonatomic,copy) NSString *groupIndex;
@property (nonatomic,copy) NSMutableArray *groupNumbers;
+(instancetype)numberGroup;

@end
