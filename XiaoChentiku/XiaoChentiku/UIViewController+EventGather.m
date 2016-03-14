//
//  UIViewController+EventGather.m
//  XiaoChentiku
//
//  Created by erice on 16/3/11.
//  Copyright © 2016年 erice. All rights reserved.
//

#import "UIViewController+EventGather.h"

@implementation UIViewController (EventGather)


- (void)viewDidLoad{

    NSLog(@"页面统计:%@", self);
    
}


- (void)dealloc{

    NSLog(@"页面释放:%@", self);
}

@end
