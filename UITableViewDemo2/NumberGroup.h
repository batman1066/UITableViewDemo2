#import <Foundation/Foundation.h>

@interface NumberGroup : NSObject
@property (nonatomic,strong) NSString *groupHeader;
@property (nonatomic,strong) NSString *groupFooter;
@property (nonatomic,strong) NSString *groupIndex;
@property (nonatomic,strong) NSMutableArray *groupNumbers;
+(instancetype)numberGroup;

@end
