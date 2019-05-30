//
//  ViewController.h
//  UITableViewAdvanceDelegate
//
//  Created by Civet on 2019/5/24.
//  Copyright © 2019年 PandaTest. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *arrayData;
//添加导航按钮
@property(nonatomic,strong) UIBarButtonItem *editBtn;
@property(nonatomic,strong) UIBarButtonItem *finishBtn;
@property(nonatomic,strong) UIBarButtonItem *deleteBtn;
@property(nonatomic,assign) BOOL isEdit;
@end

