//
//  ThemeManager.h
//  XiaoChentiku
//
//  Created by erice on 16/1/6.
//  Copyright © 2016年 erice. All rights reserved.
//

#import <Foundation/Foundation.h>


static  NSString*const kThemeDidChangeNotifiaction = @"com.wantiku.Themedidchangenotifiaction";

@interface ThemeManager : NSObject

+ (instancetype)shared;


- (UIColor *)getThemeColor:(NSString *)name;
- (UIImage*)getThemeImage:(NSString*)imageName;

@end
