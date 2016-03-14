//
//  ThemeManager.m
//  XiaoChentiku
//
//  Created by erice on 16/1/6.
//  Copyright © 2016年 erice. All rights reserved.
//

#import "ThemeManager.h"

@implementation ThemeManager

DISPATCH_ONCE_CLASS



- (UIImage*)getThemeImage:(NSString*)imageName
{
  
    if (imageName.length>0) {
        NSString *themPath =[self getThemePath];
        if ([[[UIDevice currentDevice] systemVersion] floatValue]<8.0) {
            imageName=[imageName stringByAppendingString:@"@2x.png"];
        }
        NSString *imagePath=[themPath stringByAppendingString:imageName];
        UIImage *image=[UIImage imageWithContentsOfFile:imagePath];
        return image;
    }else{
     
        return nil;
    }

    
}

- (NSString *)getThemePath
{
    NSString *resourcePath = [[NSBundle mainBundle] resourcePath];
    
    return resourcePath;
}



@end
