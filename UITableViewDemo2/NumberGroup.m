#import "NumberGroup.h"
#import "Number.h"
static int numberOfIndexMy=0;
@implementation NumberGroup
+(instancetype)numberGroup{
    NumberGroup *numberGroup=[[NumberGroup alloc] init];
    //设置数据
    numberGroup.groupHeader=[NSString stringWithFormat:@"Header:%d",
    arc4random_uniform(10000) ];
    numberGroup.groupFooter=[NSString stringWithFormat:@"Footer:%d",
                            arc4random_uniform(10000) ];
    numberGroup.groupIndex=[NSString stringWithFormat:@"%d",
                            ++numberOfIndexMy ];
    NSMutableArray *tempArray=[NSMutableArray array];
    for(int i=0;i<10;i++){
        Number *number=[Number number];
        
        
        
        [tempArray addObject:number];
    }
    numberGroup.groupNumbers=tempArray;
    return numberGroup;

}
@end
