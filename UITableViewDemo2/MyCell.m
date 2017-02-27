#import "MyCell.h"


@implementation MyCell
+(instancetype) myCellWithTableView:(UITableView *)tableView{
    static NSString *cellID=@"mycell";
    MyCell *cell=[tableView dequeueReusableCellWithIdentifier:cellID];
    if(cell==nil){
        cell=[[[NSBundle mainBundle] loadNibNamed:@"MyCell" owner:self options:nil] lastObject];
    }
    return  cell;
}
-(void)setCellData:(Number *)cellData{
    _cellData=cellData;
    self.titleLabel.text=cellData.titleNumber;
    self.descriptionLabel.text=cellData.detailDescription;
    
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}
@end
