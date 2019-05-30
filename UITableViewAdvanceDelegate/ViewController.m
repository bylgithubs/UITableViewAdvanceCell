//
//  ViewController.m
//  UITableViewAdvanceDelegate
//
//  Created by Civet on 2019/5/24.
//  Copyright © 2019年 PandaTest. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    //自动调整子视图的大小
    _tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    _tableView.tableHeaderView = nil;
    _tableView.tableFooterView = nil;
    
    [self.view addSubview:_tableView];
    
    _arrayData = [[NSMutableArray alloc] init];
    for (int i = 1; i < 20; i++) {
        NSString *str = [NSString stringWithFormat:@"A %d",i];
        [_arrayData addObject:str];
    }
    
    //当数据的数据源发生变化时，更新数据库视图，重新加载数据
    [_tableView reloadData];
    [self createBtn];
    
}

- (void) createBtn{
    _isEdit = NO;
    //创建功能按钮
    _editBtn = [[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(pressEdit)];
    _finishBtn = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(pressFinish)];
    _deleteBtn = [[UIBarButtonItem alloc] initWithTitle:@"删除" style:UIBarButtonItemStylePlain target:self action:@selector(pressDelete)];
    self.navigationItem.rightBarButtonItem = _editBtn;
}

//可以显示编辑状态，当手指在单元格上移动时
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    //删除数据源对应的数据
    [_arrayData removeObjectAtIndex:indexPath.row];
    [_tableView reloadData];
    
}

//单元格显示效果协议
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    //UITableViewCellEditingStyleDelete:删除状态
    //UITableViewCellEditingStyleInsert:插入状态
    //UITableViewCellEditingStyleInsert|UITableViewCellEditingStyleDelete:多选状态
    //默认为删除
    return UITableViewCellEditingStyleDelete;
}
//选中单元格
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"选中%ld行%ld列单元格!",indexPath.section,indexPath.row);
}
//取消选中单元格
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"取消选中%ld行%ld列单元格!",indexPath.section,indexPath.row);
}


- (void)pressEdit{
    _isEdit = YES;
    self.navigationItem.rightBarButtonItem = _finishBtn;
    [_tableView setEditing:YES];
    self.navigationItem.leftBarButtonItem = nil;
}

- (void)pressFinish{
    _isEdit = NO;
    self.navigationItem.rightBarButtonItem = _editBtn;
    [_tableView setEditing:NO];
    self.navigationItem.leftBarButtonItem = nil;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _arrayData.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *strID = @"ID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:strID];
    if (cell == nil){
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:strID];
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:strID];
    }
    cell.textLabel.text = [_arrayData objectAtIndex:indexPath.row];
    cell.detailTextLabel.text = @"子标题";
    
    NSString *str = [NSString stringWithFormat:@"%ld.jpg",indexPath.row % 15 + 1];
    UIImage *image = [UIImage imageNamed:str];
    //UIImageView *imageV = [[UIImageView alloc] initWithImage:image];
    cell.imageView.image = image;
    
    
    return cell;
}
//单元格高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
