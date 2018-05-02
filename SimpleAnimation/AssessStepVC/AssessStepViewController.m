//
//  AssessStepViewController.m
//  NuoManDi
//
//  Created by Cai on 2018/4/11.
//  Copyright © 2018年 Cai. All rights reserved.
//

#import "AssessStepViewController.h"
#import "AssessStepTableViewCell.h"
#import "AssessStepModel.h"

static NSString * const RegisterIdentifier_AssessStepTableViewCell = @"AssessStepTableViewCell";
@interface AssessStepViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,  strong)  UITableView * assessStepTableView;
// Model数据模型
@property (nonatomic,  strong)  AssessStepModel * modelOne;

@property (nonatomic,  strong)  AssessStepModel * modelTwo;

@property (nonatomic,  strong)  AssessStepModel * modelThree;

@property (nonatomic,  strong)  AssessStepModel * modelFour;

@property (nonatomic,  strong)  AssessStepModel * modelFive;

@property (nonatomic,  strong)  AssessStepModel * modelSix;

@property (nonatomic,  strong)  NSMutableArray * dataArr;
/** 标题数组 */
@property (nonatomic,  strong)  NSArray * titleArr;
/** 内容数组 */
@property (nonatomic,  strong)  NSArray * contentArr;
/** 动画标记 */
@property (nonatomic,  assign)   NSInteger  k;

@end

@implementation AssessStepViewController

- (NSArray *)titleArr
{
    if (!_titleArr) {
        _titleArr = [NSArray array];
    }
    return _titleArr;
}

- (NSArray *)contentArr
{
    if (!_contentArr) {
        _contentArr = [NSArray array];
    }
    return _contentArr;
}

- (NSMutableArray *)dataArr
{
    if (!_dataArr) {
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"评估流程";
    self.titleArr = @[@"身份信息",@"工作信息",@"联系人信息",@"信息认证",@"征信入网信息",@"评估分数"];
    self.contentArr = @[@"身份信息提审成功!",@"工作信息提审成功!",@"联系人信息提审成功!",@"信用信息评估成功!",@"征信记录查询分析完成!",@"正在评估分数!"];
    self.view.backgroundColor = [UIColor colorWithRed:249 green:251 blue:251 alpha:1];
    [self.view addSubview:self.assessStepTableView];
    [self askForData];
    [self createReloadData];
}

- (void)createReloadData
{
    self.k = 0;
    // 定时器刷新section
    [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(UpdateColor) userInfo:nil repeats:NO];
}

- (void)UpdateColor
{
    if (self.k < 5) {
        [self UpdateColor:self.k];
    }
    self.k++;
    if (self.k < 5) {
        // 定时器刷新section
        [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(UpdateColor) userInfo:nil repeats:NO];
    }
}

- (void)UpdateColor:(NSInteger)i
{
    AssessStepModel * model = [[AssessStepModel alloc] init];
    model.isColor = YES;
    model.titleStr = self.titleArr[i];
    model.contentStr = self.contentArr[i];
    model.currentCell = i;
    [self.dataArr removeObjectAtIndex:i];
    [self.dataArr insertObject:model atIndex:i];
    // 刷新制定section
    NSIndexSet *indexSet=[[NSIndexSet alloc]initWithIndex:i];
    [self.assessStepTableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationNone];
}

- (void)askForData
{
    self.modelOne = [[AssessStepModel alloc] init];
    self.modelOne.titleStr = self.titleArr[0];
    self.modelOne.isColor = NO;
    self.modelOne.currentCell = 0;
    self.modelOne.contentStr = self.contentArr[0];
    
    self.modelTwo = [[AssessStepModel alloc] init];
    self.modelTwo.titleStr = self.titleArr[1];
    self.modelTwo.isColor = NO;
    self.modelTwo.currentCell = 1;
    self.modelTwo.contentStr = self.contentArr[1];
    
    self.modelThree = [[AssessStepModel alloc] init];
    self.modelThree.titleStr = self.titleArr[2];
    self.modelThree.isColor = NO;
    self.modelThree.currentCell = 2;
    self.modelThree.contentStr = self.contentArr[2];
    
    self.modelFour = [[AssessStepModel alloc] init];
    self.modelFour.titleStr = self.titleArr[3];
    self.modelFour.isColor = NO;
    self.modelFour.currentCell = 3;
    self.modelFour.contentStr = self.contentArr[3];
    
    self.modelFive = [[AssessStepModel alloc] init];
    self.modelFive.titleStr = self.titleArr[4];
    self.modelFive.isColor = NO;
    self.modelFive.currentCell = 4;
    self.modelFive.contentStr = self.contentArr[4];
    
    self.modelSix = [[AssessStepModel alloc] init];
    self.modelSix.titleStr = self.titleArr[5];
    self.modelSix.isColor = NO;
    self.modelSix.currentCell = 5;
    self.modelSix.contentStr = self.contentArr[5];
    
    [self.dataArr addObject:self.modelOne];
    [self.dataArr addObject:self.modelTwo];
    [self.dataArr addObject:self.modelThree];
    [self.dataArr addObject:self.modelFour];
    [self.dataArr addObject:self.modelFive];
    [self.dataArr addObject:self.modelSix];
    [self.assessStepTableView reloadData];
}

- (UITableView *)assessStepTableView
{
    if (!_assessStepTableView) {
        _assessStepTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height - 64) style:UITableViewStyleGrouped];
        _assessStepTableView.backgroundColor = [UIColor whiteColor];
        _assessStepTableView.showsVerticalScrollIndicator = NO;
        _assessStepTableView.showsHorizontalScrollIndicator = NO;
        _assessStepTableView.delegate = self;
        _assessStepTableView.dataSource = self;
        _assessStepTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_assessStepTableView registerNib:[UINib nibWithNibName:RegisterIdentifier_AssessStepTableViewCell bundle:nil] forCellReuseIdentifier:RegisterIdentifier_AssessStepTableViewCell];
    }
    return _assessStepTableView;
}

#pragma mark - tableView协议
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 6;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 15;
    }
    else
    {
        return 0.01;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 10;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 15)];
        view.backgroundColor = [UIColor whiteColor];
        return view;
    }
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 55;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AssessStepTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:RegisterIdentifier_AssessStepTableViewCell];
    cell.model = self.dataArr[indexPath.section];
    return cell;
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
