#import <UIKit/UIKit.h>
#import "Number.h"
@interface MyCell : UITableViewCell
@property (nonatomic,copy) Number *cellData;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *descriptionLabel;
 
+(instancetype) myCellWithTableView:(UITableView *)tableView;
@end
