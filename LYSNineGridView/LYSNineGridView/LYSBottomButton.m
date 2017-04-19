//
//  LYSBottomButton.m
//  LYSBottomButton
//
//  Created by jk on 2017/4/19.
//  Copyright © 2017年 Goldcard. All rights reserved.
//

#import "LYSBottomButton.h"

@implementation LYSBottomButton

-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    if (self.imageView.image){
        
        self.layer.masksToBounds = YES;
        CGPoint imageCenter = self.imageView.center;
        imageCenter.x = self.bounds.size.width / 2;
        imageCenter.y = (self.bounds.size.height - self.titleLabel.bounds.size.height - self.imageTopPadding)/ 2;
        self.imageView.center = imageCenter;
        
        CGRect newFrame = self.titleLabel.frame;
        newFrame.origin.x = 0;
        newFrame.origin.y = CGRectGetMaxY(self.imageView.frame) + self.titlePadding;
        newFrame.size.width = self.bounds.size.width;
        self.titleLabel.frame = newFrame;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        
    }
}

@end
