//
//  ViewController.m
//  倒计时封装
//
//  Created by public on 15/11/5.
//  Copyright © 2015年 public. All rights reserved.
//

#import "ViewController.h"
#import "IMTimerLoop.h"
@interface ViewController ()<timeChangeDelegate>
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) NSMutableArray *timerArray;
@end
/**********************************我是华丽的分割线****************************************************/

//这个倒计时的dome有个问题就是加载tableView的时候，的第一秒，不会走要显示的时间数据的那个代理方法，
/**********************************我是华丽的分割线****************************************************/


@implementation ViewController

- (NSTimer *)timer{
    if (!_timer) {
        _timer = [[NSTimer alloc]init];
    }
    return _timer;
}
- (NSMutableArray *)timerArray{
    if (!_timerArray) {
        
        _timerArray = [[NSMutableArray alloc]initWithObjects:@"2016-05-27 07:00:00",@"2017-11-5 13:02:00",@"2017-11-5 13:02:00",@"2011-11-5 13:02:00",@"2017-11-5 13:02:00",@"2012-11-5 13:02:00",@"2017-11-5 13:02:00",@"2017-11-5 13:02:00",@"2011-12-5 13:02:00",@"2017-11-5 13:02:00",@"2017-11-5 13:02:00",@"2017-11-5 13:02:00",@"2017-11-5 13:02:00",@"2011-10-5 13:02:00",@"2017-11-5 13:02:00",@"2117-11-5 13:02:00",@"2017-11-5 13:02:00",@"2017-11-5 13:12:00",@"2071-1-5 13:02:00",@"2017-11-5 13:02:00",@"2017-11-5 13:02:00",@"2017-11-5 13:02:00",@"2017-11-5 13:12:00", nil];
    }
    return _timerArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    IMTimerLoop *loop = [[IMTimerLoop alloc]init];
    loop.delegate = self;
    [loop straTimerWithDateArray:self.timerArray AndTimerChangeBlock:^(id result) {
        NSTimer *time = (NSTimer *)result;
        [[NSRunLoop currentRunLoop] addTimer:time forMode:UITrackingRunLoopMode];
    }];
    
    
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.timerArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    
    cell.textLabel.text = self.timerArray[indexPath.row];
    
    return cell;
}
#pragma timerLoop的代理方法
/**
 *  timerLoop的代理方法
 *
 *  @param timeArray 返回的数据更新cell
 */
- (void)timeChange:(NSMutableArray *)timeArray{
    for (int i = 0; i<timeArray.count; i++) {
        
        [self.timerArray replaceObjectAtIndex:i withObject:timeArray[i]];
        
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
        UITableViewCell *cell1 = (UITableViewCell *)[self.tableView cellForRowAtIndexPath:indexPath];
        cell1.textLabel.text = self.timerArray[indexPath.row];
        
    }
    
    
}
@end
