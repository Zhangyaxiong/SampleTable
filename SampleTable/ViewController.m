//
//  ViewController.m
//  SampleTable
//
//  Created by 张亚雄 on 15/5/22.
//  Copyright (c) 2015年 张亚雄. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize listData=_listData;
@synthesize tableView = _tableView;
@synthesize tableViewCell =_tableViewCell;

- (void)viewDidLoad
{
    [super viewDidLoad];
    // 初始化表格
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height - 20) style:UITableViewStylePlain];
    // 设置协议，意思就是UITableView类的方法交给了tabView这个对象，让完去完成表格的一些设置操作
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    //把tablView添加到视图之上
    [self.view addSubview:self.tableView];
    NSArray *array = [NSArray arrayWithObjects: @"哈士奇",@"秋田",nil];
    self.listData = array;
    arr_numbers = [[NSArray alloc]initWithObjects:@"NO.1",@"NO.2", nil];
   }
    //返回多少个分组

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
//返回多少行，也就是返回数组中所存储的数据，是分组部分的元素（内容）。
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.listData count];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //    声明静态字符串型对象，用来标记重用单元格
    static NSString *TableSampleIdentifier = @"人气王";
    //    用TableSampleIdentifier表示需要重用的单元
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TableSampleIdentifier];
    //    如果如果没有多余单元，则需要创建新的单元
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:TableSampleIdentifier];
    }
    
    else {
        while ([cell.contentView.subviews lastObject ]!=nil) {
            [(UIView*)[cell.contentView.subviews lastObject]removeFromSuperview];
        }
    }
    //    获取当前行信息值
    NSUInteger row = [indexPath row];
    //    填充行的详细内容
    cell.detailTextLabel.text = [arr_numbers objectAtIndex:row];
    //    把数组中的值赋给单元格显示出来
    cell.textLabel.text=[self.listData objectAtIndex:row];
    

    //    表视图单元提供的UILabel属性，设置字体大小
    cell.textLabel.font = [UIFont boldSystemFontOfSize:20.0f];
    
    //    设置单元格UILabel属性背景颜色
    cell.textLabel.backgroundColor=[UIColor clearColor];
   
    //    正常情况下现实的图片
    UIImage *image = [UIImage imageNamed:@"1"];
    cell.imageView.image=image;
    
    
  
    //    被选中后高亮显示的照片
    UIImage *highLightImage = [UIImage imageNamed:@"4"];
    cell.imageView.highlightedImage = highLightImage;
    return cell;
}
-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

@end
