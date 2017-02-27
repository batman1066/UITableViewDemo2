
#import "Number.h"
#import "NSObject+Extent.h"
@implementation Number


+(instancetype)number{
    Number *number=[[Number alloc] init];
    number.titleNumber=[NSString stringWithFormat:@"%d",arc4random_uniform(10000)];
    int titleNumber=arc4random_uniform(2);
    if(titleNumber==1){
        number.detailDescription=@"这是灵魂呐喊的声音，老子3个月后又是一条好汉，谢谢大家，谢谢！这是灵魂呐喊的声音，老子3个月后又是一条好汉，谢谢大家，谢谢！这是灵魂呐喊的声音，老子3个月后又是一条好汉，谢谢大家，谢谢！这是灵魂呐喊的声音，老子3个月后又是一条好汉，谢谢大家，谢谢！这是灵魂呐喊的声音，老子3个月后又是一条好汉，谢谢大家，谢谢！这是灵魂呐喊的声音，老子3个月后又是一条好汉，谢谢大家，谢谢！1这是灵魂呐喊的声音，老子3个月后又是一条好汉，谢谢大家，谢谢！";
    }else{
        number.detailDescription=number.titleNumber;
    }
    //设置高度
    //1获取屏幕宽度
    CGFloat cellW=[UIScreen mainScreen].bounds.size.width;
    //2设置detailDescription的高度
    CGFloat marginW=8;
    CGFloat detailDescriptionLabelW=cellW-40;//-2*marginW;
    CGFloat detailDescriptionLabelH=[number.detailDescription heightWidthText:number.detailDescription font:[UIFont systemFontOfSize:17.0] width:detailDescriptionLabelW];
    //计算高度
    number.cellHeight=21+detailDescriptionLabelH;//8+21+8+detailDescriptionLabelH+8;
    return number;
}
@end
