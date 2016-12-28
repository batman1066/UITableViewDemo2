#import "TableViewController.h"
#import "NumberGroup.h"
#import "MyCell.h"
#import "Number.h"
@interface TableViewController ()<UITableViewDataSource,UITableViewDelegate>

@end
@implementation TableViewController
- (NSMutableArray *)dataList {
    if(_dataList==nil){
        _dataList=[NSMutableArray array];
        for (int i=0; i<4; i++) {
            NumberGroup *numberGroup=[NumberGroup numberGroup];
            [_dataList addObject:numberGroup];
        }
    }
    return _dataList;
  }
- (void)viewDidLoad {
     
    [super viewDidLoad];
    self.tableView.sectionIndexColor=[UIColor redColor];
    self.tableView.sectionIndexBackgroundColor=[UIColor clearColor];
    
    //self.tableView.estimatedRowHeight=80;
   //self.tableView.rowHeight=UITableViewAutomaticDimension;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
//#pragma mark - Table view data source
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataList.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //取出对应的section
    NumberGroup *tempGroup=self.dataList[section];
    return tempGroup.groupNumbers.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //初始化
    MyCell * mycell=[MyCell myCellWithTableView:tableView];
    //从模型中取出数据
    NumberGroup *tempGroup=self.dataList[indexPath.section];
    NSString *numberString=tempGroup.groupNumbers[indexPath.row];
    mycell.cellData=numberString;
    //传递数据给view
    return mycell;
    
//    UITableViewCell *uiTableViewCell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
//    //获取数据源
//    NumberGroup *tempGroup=self.dataList[indexPath.section];
//    NSString *numberString=tempGroup.groupNumbers[indexPath.row];

//    uiTableViewCell.textLabel.text=numberString;
//    uiTableViewCell.detailTextLabel.text=numberString;
//    uiTableViewCell.imageView.image= [UIImage imageNamed:@"image"];
//    uiTableViewCell.accessoryType=UITableViewCellAccessoryCheckmark;
//    return uiTableViewCell;
}
- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    NumberGroup *numberGroup=self.dataList[section];
    return numberGroup.groupIndex;
}// fixed font style. use custom view (UILabel) if you want something different
- (nullable NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    NumberGroup *numberGroup=self.dataList[section];
    return numberGroup.groupFooter;
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    NumberGroup *numberGroup=self.dataList[section];
    UIImageView *imageView=[[UIImageView alloc] initWithFrame:CGRectMake(5,5,20,20)];
    imageView.image=[UIImage imageNamed:@"image"];
    UILabel *label=[[UILabel alloc] initWithFrame:CGRectMake(30,5,100,20)];
    label.text= [NSString stringWithFormat:@"猜你妹%@",numberGroup.groupIndex]  ;
    label.font=[UIFont systemFontOfSize:14.0];
    UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
    button.frame=CGRectMake(250, 5, 60, 20);
    [button setBackgroundImage:[UIImage imageNamed:@"1"] forState:UIControlStateNormal];
    
    [button addTarget:self action:@selector(clickOpenButton) forControlEvents:UIControlEventTouchUpInside];
    
    UIView *headerView=[[UIView alloc] init];
    [headerView addSubview:imageView];
    [headerView addSubview:label];
    [headerView addSubview:button];
    headerView.backgroundColor=[UIColor whiteColor];
    
    return headerView;
}

-(void)clickOpenButton{
    UIAlertView *uiAlertView=[[UIAlertView alloc] initWithTitle:@"提示" message:@"点击了OPEN" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [uiAlertView show];
}

- (nullable NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    NSMutableArray *indexArray=[NSMutableArray array];
    for (NumberGroup *numberGroup in self.dataList) {
        [indexArray addObject:numberGroup.groupIndex];
    }
    return indexArray;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *message=[NSString stringWithFormat:@"第%ld段，第%ld行",indexPath.section,indexPath.row ];
    UIAlertView *uiAlertView=[[UIAlertView alloc] initWithTitle:@"提示" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [uiAlertView show];
}
- (nullable NSArray <UITableViewRowAction *>*)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewRowAction *action1 = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"添加" handler:nil];
    UITableViewRowAction *action2 = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"移动" handler:nil];
    UITableViewRowAction *action3 = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"删除" handler:
    ^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        [self.dataList removeObjectAtIndex:indexPath.row];
        [tableView reloadData];
        
    }];
    UITableViewRowAction *action4 = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"刷新" handler:
                                     ^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
                                         [tableView reloadData];
                                     }];
    NSArray *actionArray = @[action1,action2,action3,action4];
    return actionArray;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    //取出数据对象
    NumberGroup *group=self.dataList[indexPath.section];
    Number *number=group.groupNumbers[indexPath.row];
    
    
    
    return number.cellHeight;
}
@end
