//
//  IMUtil.m
//  倒计时封装
//
//  Created by public on 15/11/5.
//  Copyright © 2015年 public. All rights reserved.
//

#import "IMUtil.h"

@implementation IMUtil
// NSString转NSDate
+ (NSDate *) getDateFromString:(NSString *)str{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    return [dateFormatter dateFromString:str];
}
@end
