//
//  ThemeLabel.m
//  XiaoChentiku
//
//  Created by erice on 16/1/6.
//  Copyright © 2016年 erice. All rights reserved.
//

#import "ThemeLabel.h"

@implementation ThemeLabel


- (instancetype)init
{
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(themeNotification:) name:kThemeDidChangeNotifiaction object:nil];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.font = [UIFont systemFontOfSize:15.0];
        self.backgroundColor = [UIColor clearColor];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(themeNotification:) name:kThemeDidChangeNotifiaction object:nil];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(themeNotification:) name:kThemeDidChangeNotifiaction object:nil];
    }
    return self;
}


- (void)setColorname:(NSString *)colorname
{
    if (_colorname != colorname) {
        _colorname = colorname;
    }
    
    UIColor *textColor = [[ThemeManager shared] getThemeColor:_colorname];
    if (textColor != nil) {
        self.textColor = textColor;
    }
}





@end
