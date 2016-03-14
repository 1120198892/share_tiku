//
//  FoundationMacro.h
//  XiaoChentiku
//
//  Created by erice on 16/1/6.
//  Copyright © 2016年 erice. All rights reserved.
//

#ifndef FoundationMacro_h
#define FoundationMacro_h


// IOS
#define IOS6 [[[UIDevice currentDevice] systemVersion] floatValue] < 7.0
#define IOS7 [[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0
#define IOS8 [[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0


//width height

#define kScreenWidth [[UIScreen mainScreen] applicationFrame].size.width
#define kScreenHeight [[UIScreen mainScreen] applicationFrame].size.height









// singletion
#define DISPATCH_ONCE_CLASS \
static id shared = nil; \
\
+ (instancetype)shared \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
shared = [[self alloc] init]; \
}); \
return shared; \
} \
\
+ (instancetype)allocWithZone:(struct _NSZone *)zone \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
shared = [super allocWithZone:zone]; \
}); \
return shared; \
} \





#endif /* FoundationMacro_h */
