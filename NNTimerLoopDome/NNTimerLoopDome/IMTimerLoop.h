//
//  IMTimerLoop.h
//  倒计时封装
//
//  Created by public on 15/11/5.
//  Copyright © 2015年 public. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^timerChangeBlock) (id result);

@protocol timeChangeDelegate <NSObject>
- (void)timeChange:(NSMutableArray *)timeArray;
@end
@interface IMTimerLoop : NSObject

/**
 *  调用方法并回调timer runloop
 *
 *  @param dateArray  服务器获得的字符串类型的时间格式
 *  @param timerBlock 把timer传过去
 */
- (void)straTimerWithDateArray:(NSMutableArray *)dateArray AndTimerChangeBlock:(timerChangeBlock)timerBlock;

@property (nonatomic,weak)id<timeChangeDelegate>delegate;
@end
