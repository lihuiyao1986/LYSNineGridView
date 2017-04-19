//
//  LYSNineGridView.m
//  LYSNineGridView
//
//  Created by jk on 2017/4/19.
//  Copyright © 2017年 Goldcard. All rights reserved.
//

#import "LYSNineGridView.h"
#import "LYSBottomButton.h"

@implementation LYSNineGridView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initConfig];
    }
    return self;
}

#pragma mark - 初始化配置
-(void)initConfig{
    [self setDefaults];
}

#pragma mark - 设置默认值
-(void)setDefaults{
    
    _colums = 4;
    
    _rowSpacing = 1.f;
    
    _columnSpacing = 1.f;
    
    _itemH = 30.f;
    
    _titleTopMargin = 5.f;
    
    _type = TYPE_ONE;
    
}

#pragma mark - 创建item按钮
-(LYSBottomButton*)createItemBtn:(NSString*)title bgColor:(UIColor*)bgColor hightlightedBgColor:(UIColor*)hightlightedBgColor image:(NSString*)image fontSize:(UIFont*)fontSize textColor:(UIColor*)textColor atIndex:(NSUInteger)index{
    LYSBottomButton *btn = [LYSBottomButton buttonWithType:UIButtonTypeCustom];
    btn.tag = 1000 + index;
    btn.titlePadding = self.titleTopMargin;
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitle:title forState:UIControlStateHighlighted];
    btn.titleLabel.font = fontSize ? fontSize : [UIFont systemFontOfSize:14];
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateHighlighted];
    textColor = textColor ? textColor : [UIColor blackColor];
    bgColor = bgColor ? bgColor : [UIColor whiteColor];
    hightlightedBgColor = hightlightedBgColor ? hightlightedBgColor : [UIColor whiteColor];
    [btn setTitleColor:textColor forState:UIControlStateNormal];
    [btn setTitleColor:textColor forState:UIControlStateHighlighted];
    [btn setBackgroundImage:[self colorToImage:bgColor] forState:UIControlStateNormal];
    [btn setBackgroundImage:[self colorToImage:hightlightedBgColor] forState:UIControlStateHighlighted];
    [btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    return btn;
}

#pragma mark - 颜色转图片
-(UIImage*)colorToImage:(UIColor*)color{
    CGRect newRect = CGRectMake(0.0, 0.0, 1.0, 1.0);
    UIGraphicsBeginImageContext(newRect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, newRect);
    UIImage* theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

#pragma mark - 更新子视图
-(void)updateSubViews{
    for(UIView *subView in self.subviews){
        [subView removeFromSuperview];
    }
    __weak typeof (self)MyWeakSelf = self;
    [self.items enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSString *title = obj[@"title"];
        UIColor *bgColor = obj[@"bgColor"];
        NSString *image = obj[@"image"];
        UIFont *fontSize = obj[@"fontSize"];
        UIColor *textColor = obj[@"textColor"];
        UIColor *hightlightedBgColor = obj[@"bgHightlightedColor"];
        UIButton *_itemBtn = [MyWeakSelf createItemBtn:title bgColor:bgColor hightlightedBgColor:hightlightedBgColor image:image fontSize:fontSize textColor:textColor atIndex:idx];
        [MyWeakSelf addSubview:_itemBtn];
    }];
    CGRect selfFrame = self.frame;
    selfFrame.size.height = [self containerH];
    self.frame = selfFrame;
}

#pragma mark - 重写layoutSubviews方法
-(void)layoutSubviews{
    [super layoutSubviews];
    __weak typeof (self)MyWeakSelf = self;
    [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        CGFloat itemW;
        CGFloat xOffset;
        CGFloat yOffset;
        if (MyWeakSelf.type ==  TYPE_ONE) {
            itemW = (CGRectGetWidth(MyWeakSelf.frame) - (MyWeakSelf.colums - 1) * MyWeakSelf.columnSpacing) / MyWeakSelf.colums;
            xOffset = (idx % MyWeakSelf.colums) * (itemW + MyWeakSelf.columnSpacing);
            yOffset= (idx / MyWeakSelf.colums) * (MyWeakSelf.itemH + MyWeakSelf.rowSpacing);
        }else{
             itemW = (CGRectGetWidth(MyWeakSelf.frame) - (MyWeakSelf.colums + 1) * MyWeakSelf.columnSpacing) / MyWeakSelf.colums;
            xOffset = (idx % MyWeakSelf.colums) * (itemW + MyWeakSelf.columnSpacing) + MyWeakSelf.columnSpacing;
            yOffset= (idx / MyWeakSelf.colums) * (MyWeakSelf.itemH + MyWeakSelf.rowSpacing) + MyWeakSelf.rowSpacing;
        }
        obj.frame = CGRectMake(xOffset, yOffset, itemW, MyWeakSelf.itemH);
    }];
}


#pragma mark - 设置数据
-(void)setItems:(NSArray *)items{
    _items = items;
    [self updateSubViews];
}

#pragma mark -  显示的行数
-(NSUInteger)rows{
    if (self.items.count % self.colums == 0) {
        return self.items.count / self.colums;
    }else{
        return self.items.count / self.colums + 1;
    }
}

#pragma mark - 高度
-(CGFloat)containerH{
    if (self.type == TYPE_ONE) {
        return (self.itemH)* [self rows] + self.rowSpacing *([self rows] - 1);
    }else{
        return (self.itemH + self.rowSpacing)* [self rows] + self.rowSpacing;
    }
}

#pragma mark - 按钮被点击
-(void)btnClicked:(UIButton*)sender{
    if (self.ItemSelectedBlock) {
        NSUInteger index = sender.tag - 1000;
        self.ItemSelectedBlock(self.items[index],index);
    }
}

@end
