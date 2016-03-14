//
//  DataCenter.h
//  XiaoChentiku
//
//  Created by erice on 16/2/24.
//  Copyright © 2016年 erice. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataCenter : NSObject


+ (instancetype)shared;


@property (nonatomic, strong) NSString *userId;
@property (nonatomic, strong) NSString *subjectParentID;

@end
