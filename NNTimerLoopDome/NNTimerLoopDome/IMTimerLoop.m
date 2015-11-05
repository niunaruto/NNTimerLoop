//
//  IMTimerLoop.m
//  倒计时封装
//
//  Created by public on 15/11/5.
//  Copyright © 2015年 public. All rights reserved.
//

#import "IMTimerLoop.h"

#import "IMUtil.h"
@interface IMTimerLoop()
/**
 *  接收服务器返回过来的string类型的数据，将其转换为NSDate
 */
@property (nonatomic, strong) NSMutableArray *dateArrayT;
/**
 *  最终要显示到视图上的时间数据
 */
@property (nonatomic, strong) NSMutableArray *timeForAll;
@end
@implementation IMTimerLoop

- (NSMutableArray *)dateArrayT{
    if (!_dateArrayT) {
        _dateArrayT = [NSMutableArray array];
    }
    return _dateArrayT;
}
- (NSMutableArray *)timeForAll{
    if (!_timeForAll) {
        _timeForAll = [NSMutableArray array];
    }
    return _timeForAll;
}

- (void)straTimerWithDateArray:(NSMutableArray *)dateArray AndTimerChangeBlock:(timerChangeBlock)timerBlock{
    

    
   NSTimer * timer1 = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(refreshLessTime) userInfo:@"" repeats:YES];
    
    
    for (int i = 0; i<dateArray.count; i++) {
        [self.dateArrayT addObject:[IMUtil getDateFromString:dateArray[i]]];
    }
    /**
     *  把这个timer传过去runLoop
     */
    timerBlock(timer1);
    for (int i= 0; i<self.dateArrayT.count; i++) {
        
        [self.timeForAll addObject:self.dateArrayT[i]];
    }
    
}

/**
 *  定时器时间
 */
-(void)refreshLessTime{
 
    for (int i = 0; i < self.dateArrayT.count ; i ++) {
        
        NSDate *date = self.dateArrayT[i];
        NSTimeInterval lefttime= [date timeIntervalSinceNow];
        __block NSInteger timeout = [[NSString stringWithFormat:@"%lf",lefttime] integerValue];
        NSInteger hour= timeout/3600;
        NSInteger day = hour/24;
        NSInteger hour2 = hour%24;
        NSInteger min=(timeout-hour*3600)/60;
        NSInteger sec=timeout%(60);
        NSString* leftTime;
        if(timeout<=0)// 倒计时关闭
        {
            
            
            [self.timeForAll replaceObjectAtIndex:i withObject:@"已结束"];
        }
        else
        {
            if (day>=1) {
                leftTime=[NSString stringWithFormat:@"%lu天%02lu:%02lu:%02lu",(long)day,(long)hour2,(long)min,(long)sec];
            }else{
                leftTime=[NSString stringWithFormat:@"%02lu:%02lu:%02lu",(long)hour2,(long)min,(long)sec];
            }
            if (timeout <0) {
                leftTime = @"已结束";
            }
            
        }
        
        if (leftTime==nil) {
            leftTime=@"已结束";
        }
        [self.timeForAll replaceObjectAtIndex:i withObject:leftTime];
        
        timeout--;
        
    }
    
    if ([_delegate respondsToSelector:@selector(timeChange:)]) {
        [_delegate timeChange:self.timeForAll];
        
    }
}

@end
