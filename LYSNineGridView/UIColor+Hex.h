//
//  UIColor+Hex.h
//  MyGas
//
//  Created by jk on 2016/12/13.
//  Copyright © 2016年 Goldcard. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Hex)
    
#pragma mark 将16进制字符串转换成UIColor color:支持@“#123456”、 @“0X123456”、 @“123456”三种格式
+ (UIColor *)colorWithHexString:(NSString *)color;
    
#pragma mark 将16进制字符串转换成 支持透明度
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;
    
@end
