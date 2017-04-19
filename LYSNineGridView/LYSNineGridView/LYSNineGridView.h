//
//  LYSNineGridView.h
//  LYSNineGridView
//
//  Created by jk on 2017/4/19.
//  Copyright © 2017年 Goldcard. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger,LYSNineGridViewType){
    TYPE_ONE,
    TYPE_TWO
};

@interface LYSNineGridView : UIView

#pragma mark - 数据
@property(nonatomic,copy)NSArray *items;

#pragma mark - 每页显示的列数
@property(nonatomic,assign)NSUInteger colums;

#pragma mark - 行间距
@property(nonatomic,assign)CGFloat rowSpacing;

#pragma mark - item的高度
@property(nonatomic,assign)CGFloat itemH;

#pragma mark - 类型
@property(nonatomic,assign)LYSNineGridViewType type;

#pragma mark - 标题离图片的顶部的距离
@property(nonatomic,assign)CGFloat titleTopMargin;

#pragma mark - 列间距
@property(nonatomic,assign)CGFloat columnSpacing;

#pragma mark - item选中时的回调
@property(nonatomic,copy) void(^ItemSelectedBlock)(id item,NSUInteger index);

@end
