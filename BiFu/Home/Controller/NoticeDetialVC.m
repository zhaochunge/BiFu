//
//  NoticeDetialVC.m
//  BiFu
//
//  Created by zcg on 2018/11/22.
//  Copyright © 2018年 Xue. All rights reserved.
//

#import "NoticeDetialVC.h"

@interface NoticeDetialVC ()
@property(nonatomic,strong)UIScrollView *scroll;
@property(nonatomic,strong)UILabel *titleLab;
@property(nonatomic,strong)UILabel *dateLab;
@property(nonatomic,strong)UILabel *content;
@end

@implementation NoticeDetialVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"币富公告";
    [self leftItemBlack];
    [self createView];
}
-(void)createView{
    self.scroll =[[UIScrollView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.scroll];
    self.scroll.showsHorizontalScrollIndicator = YES;
    self.scroll.showsVerticalScrollIndicator = YES;
    self.scroll.contentSize = CGSizeMake(0, HEIGHT*2);
    self.titleLab=[UILabel new];
    self.titleLab.frame = CGRectMake(15, 10, WIDTH-30, 30);
    self.titleLab.text = @"我是标题titititititi";
    self.titleLab.font =[UIFont systemFontOfSize:19];
    [self.scroll addSubview:self.titleLab];
    UIImageView *clock = [UIImageView new];
    clock.frame = CGRectMake(15, _titleLab.bottom+8, 15, 15);
    clock.image =[UIImage imageNamed:@"时间-icon"];
    [self.scroll addSubview:clock];
    self.dateLab =[UILabel new];
    self.dateLab.frame = CGRectMake(35, _titleLab.bottom, WIDTH-60, 30);
    [self.scroll addSubview:_dateLab];
    self.dateLab.text = @"2109/23/12 12:22:11";
    self.dateLab.font =[UIFont systemFontOfSize:15];
    self.dateLab.textColor =[UIColor lightGrayColor];
    UILabel *lab =[UILabel new];
    lab.frame = CGRectMake(15, _dateLab.bottom+20, 100, 30);
    lab.text = @"尊敬的用户";
    [_scroll addSubview:lab];
    UILabel *hello =[UILabel new];
    hello.frame = CGRectMake(15, lab.bottom, 100, 30);
    hello.text = @"您好";
    [_scroll addSubview:hello];
    self.content= [UILabel new];
    self.content.frame = CGRectMake(15, hello.bottom, WIDTH-30, 1000);
    self.content.numberOfLines = 0;
    self.content.text = @"山东理工回复了卡萨丁好烦是就卡萨丰厚的拉斯科技的 海枯石烂的家伙发了斯柯达就考山东理工回复了卡萨丁好烦是就卡萨丰厚的拉斯科技的 海枯石烂的家伙发了斯柯达山东理工回复了卡萨丁好烦是就卡萨丰厚的拉斯科技的 海枯石烂的家伙发了斯柯达就考山东理工回复了卡萨丁好烦是就卡萨丰厚的拉斯科技的 海枯石烂的家伙发了斯柯达就考试了的回复了sad开户费省考的经理发货试了的回复了sad开户费省考的经理发货就考试了山东理工回复了卡萨丁好烦是就卡萨丰厚的拉斯科技的 海枯石烂的家伙发了斯柯达就考试了的回复了sad开户费省考的经理发货的山东理工回复了卡萨丁好烦是就卡萨丰厚的拉斯科技的 海枯石烂的家伙发了斯柯达就考试了的回复了sad开户费省考的经理发货回复了sad开户费省考的经理发货山东理工回复了卡萨丁好烦是就卡萨丰厚的拉斯科技的 海枯石烂的达山东理工回复了卡萨丁好烦是就卡萨丰厚的拉斯科技的 海枯石烂的家伙发了斯柯达就考山东理工回复了卡萨丁好烦是就卡萨丰厚的拉斯科技的 海枯石烂的家伙发了斯柯达就考试了的回复了sad开户费省考的经理发货试了的回复了sad开户费省考的经理发货就考试了山东理工回复了卡萨丁好烦是就卡萨丰厚的拉斯科技的 海枯石烂的家伙发了斯柯达就考试了的回复了sad开户费省考的经理发货的山东理工回复了卡萨丁好烦是就卡萨丰厚的拉斯科技的 海枯石烂的家伙发了斯柯达就考试了的回复了sad开户费省考的经理发货回复了sad开达山东理工回复了卡萨丁好烦是就卡萨丰厚的拉斯科技的 海枯石烂的家伙发了斯柯达就考山东理工回复了卡萨丁好烦是就卡萨丰厚的拉斯科技的 海枯石烂的家伙发了斯柯达就考试了的回复了sad开户费省考的经理发货试了的回复了sad开户费省考的经理发货就考试了山东理工回复了卡萨丁好烦是就卡萨丰厚的拉斯科技的 海枯石烂的家伙发了斯柯达就考试了的回复了sad开户费省考的经理发货的山东理工回复了卡萨丁好烦是就卡萨丰厚的拉斯科技的 海枯石烂的家伙发了斯柯达就考试了的回复了sad开户费省考的经理发货回复了sad开户费省考的经理发货山东理工回复了卡萨丁好烦是就卡萨丰厚的拉斯科技的 海枯石烂的家伙发了斯柯达就考试了的回复了sad开户费省考的经理发货试了的回复了sad开户费省考的经理发户费省考的经理发货山东理工回复了卡萨丁好烦是就卡萨丰厚的拉斯科技的 海枯石烂的家伙发了斯柯达就考试了的回复了sad开户费省考的经理发货试了的回复了sad开户费省考的经理发家伙发了斯柯达就考试了的回复了sad开户费省考的经理发货试了的回复了sad开户费省考的经理发货拉斯科技的卡兰蒂斯就会发史莱克的电视剧客服哈斯考辣椒是;代理费护卫欧派凤凰网破IE哦我人回复我去配发货";
    [self.scroll addSubview:self.content];
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
