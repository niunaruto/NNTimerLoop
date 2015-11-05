//
//  IMUtil.h
//  倒计时封装
//
//  Created by public on 15/11/5.
//  Copyright © 2015年 public. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IMUtil : NSObject
/**
 *  字符串转NSDate
 */
+ (NSDate *) getDateFromString:(NSString *)str;
@end
