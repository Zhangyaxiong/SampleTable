//
//  ViewController.h
//  SampleTable
//
//  Created by 张亚雄 on 15/5/22.
//  Copyright (c) 2015年 张亚雄. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
<UITableViewDataSource,UITableViewDelegate>
{
    NSArray *arr_numbers;
  
}
//                                  （列表数据）
@property(strong,nonatomic) NSArray *listData;
//                                      （表格）
@property(strong,nonatomic)UITableView *tableView;
//                                           （表格组数）
@property(strong,nonatomic)UITableViewCell *tableViewCell;



@end

