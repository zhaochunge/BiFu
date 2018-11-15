//
//  MyViewController.m
//  BiFu
//
//  Created by apple on 2018/11/9.
//  Copyright © 2018年 Xue. All rights reserved.
//

#import "MyViewController.h"
#import "AboutViewController.h"
#import "ShareAppViewController.h"

@interface MyViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)UIView *headerView;
@property(nonatomic,strong)NSArray *titleArray;
@property(nonatomic,strong)NSArray *imageArray;
@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
    _titleArray=@[@[@"账户安全",@"支付方式",@"申诉记录",@"帮助中心"],@[@"关于我们",@"分享APP"]];
    _imageArray=@[@[@"账户安全-icon",@"支付方式-icon",@"申诉记录-icon",@"帮助中心-icon"],@[@"关于我们-icon",@"分享"]];
    [self setupHeaderView];
    [self setupTableView];
    
}
-(void)setupHeaderView{
    _headerView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 250)];
    _headerView.backgroundColor=[UIColor whiteColor];
    
}
-(void)setupTableView{
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT-49-20) style:UITableViewStyleGrouped];
    _tableView.backgroundColor=LINECOLOR;
    _tableView.delegate=self;
    _tableView.dataSource=self;
    [self.view addSubview:_tableView];
    _tableView.tableHeaderView = _headerView;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"myCell"];
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text=_titleArray[indexPath.section][indexPath.row];
    cell.imageView.image=[UIImage imageNamed:_imageArray[indexPath.section][indexPath.row]];
    if (indexPath.section==0&indexPath.row==0) {
        cell.detailTextLabel.text=@"实名认证，开启币富之路！";
        cell.detailTextLabel.font=[UIFont systemFontOfSize:13];
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.section) {
        case 0:{
            
            break;
        }
        case 1:{
            switch (indexPath.row) {
                case 0:{//关于我们
                    AboutViewController *aboutVC=[AboutViewController new];
                    [self.navigationController pushViewController:aboutVC animated:YES];
                    break;
                }
                case 1:{//分享APP
                    ShareAppViewController *shareVC=[ShareAppViewController new];
                    [self.navigationController pushViewController:shareVC animated:YES];
                    break;
                }
                default:
                    break;
            }
            
            break;
        }
        default:
            break;
    }
    
    NSLog(@"点我啦");
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0) {
        return 4;
    }else{
        return 2;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
