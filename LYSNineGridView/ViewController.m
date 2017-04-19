//
//  ViewController.m
//  LYSNineGridView
//
//  Created by jk on 2017/4/19.
//  Copyright © 2017年 Goldcard. All rights reserved.
//

#import "ViewController.h"
#import "LYSNineGridView.h"
#import "UIColor+Hex.h"

@interface ViewController ()

@property(nonatomic,strong)LYSNineGridView *gridView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.gridView];
    self.view.backgroundColor = [UIColor greenColor];
    self.gridView.backgroundColor = [UIColor colorWithHexString:@"f2f2f2"];
    self.gridView.items = @[
                             @{@"title":@"账单缴费",
                               @"bgColor":[UIColor whiteColor],
                               @"image":@"bill_charge_icon",
                               @"fontSize":[UIFont systemFontOfSize:12],
                               @"textColor":[UIColor colorWithHexString:@"414141"],
                               @"bgHightlightedColor":[UIColor whiteColor]
                               },
                             @{@"title":@"账单缴费",
                               @"bgColor":[UIColor whiteColor],
                               @"image":@"bind_table_icon",
                               @"fontSize":[UIFont systemFontOfSize:12],
                               @"textColor":[UIColor colorWithHexString:@"414141"],
                               @"bgHightlightedColor":[UIColor whiteColor]
                               },
                             @{@"title":@"账单缴费",
                               @"bgColor":[UIColor whiteColor],
                               @"image":@"consult_icon",
                               @"fontSize":[UIFont systemFontOfSize:12],
                               @"textColor":[UIColor colorWithHexString:@"414141"],
                               @"bgHightlightedColor":[UIColor whiteColor]
                               },
                             @{@"title":@"账单缴费",
                               @"bgColor":[UIColor whiteColor],
                               @"image":@"helper_menu_icon",
                               @"fontSize":[UIFont systemFontOfSize:12],
                               @"textColor":[UIColor colorWithHexString:@"414141"],
                               @"bgHightlightedColor":[UIColor whiteColor]
                               },
                             @{@"title":@"账单缴费",
                               @"bgColor":[UIColor whiteColor],
                               @"image":@"ic_card_buy_icon",
                               @"fontSize":[UIFont systemFontOfSize:12],
                               @"textColor":[UIColor colorWithHexString:@"414141"],
                               @"bgHightlightedColor":[UIColor whiteColor]
                               },
                             @{@"title":@"账单缴费",
                               @"bgColor":[UIColor whiteColor],
                               @"image":@"online_service_icon",
                               @"textColor":[UIColor colorWithHexString:@"414141"],
                               @"fontSize":[UIFont systemFontOfSize:12],
                               @"bgHightlightedColor":[UIColor whiteColor]
                               }];

}

-(LYSNineGridView*)gridView{
    if (!_gridView) {
        _gridView = [[LYSNineGridView alloc]initWithFrame:CGRectMake(0, 120, CGRectGetWidth(self.view.frame), 0)];
        _gridView.colums = 4;
        _gridView.rowSpacing = 1.f;
        _gridView.columnSpacing = 1.f;
        _gridView.itemH = 100.f;
    }
    return _gridView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
