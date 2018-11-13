//
//  AssetCenterViewController.m
//  BiFu
//
//  Created by apple on 2018/11/13.
//  Copyright © 2018年 Xue. All rights reserved.
//

#import "AssetCenterViewController.h"
#import "AssetCenterCell.h"

@interface AssetCenterViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSArray *titleArray;

@end

@implementation AssetCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    self.navigationItem.title=@"资产中心";
    _titleArray=@[@"BTC（比特币）",@"ETC（以太坊）",@"LTC（莱特币）"];
    [self setupTableView];
}

-(void)setupTableView{
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT-49-20) style:UITableViewStylePlain];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    [self.view addSubview:_tableView];
    [_tableView registerClass:[AssetCenterCell class] forCellReuseIdentifier:@"assetCell"];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    AssetCenterCell *cell = [tableView dequeueReusableCellWithIdentifier:@"assetCell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.leiLab.text=_titleArray[indexPath.row];
    cell.kmLab.text=@"0";
    cell.dmLab.text=@"0";
    switch (indexPath.row) {
        case 0:{
            cell.yuanLab.backgroundColor=[UIColor orangeColor];
            cell.leiLab.textColor=[UIColor orangeColor];
            
            break;
        }
        case 1:{
            cell.yuanLab.backgroundColor=[UIColor blueColor];
            cell.leiLab.textColor=[UIColor blueColor];
            break;
        }
        case 2:{
            cell.yuanLab.backgroundColor=[UIColor lightGrayColor];
            cell.leiLab.textColor=[UIColor lightGrayColor];
            break;
        }
        default:
            break;
    }
    
    
    
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 300;
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
