//
//  BWCacheHelper.h
//  XiaoChentiku
//
//  Created by erice on 16/2/24.
//  Copyright © 2016年 erice. All rights reserved.
//

#import <Foundation/Foundation.h>

#warning 使用说明
/*
 
1. [DataCenter shared].userId  可以替换成你自己的全局 用户ID 不修改会编译错误
 
2.  缓存的时候 需要缓存到 data。 可以创建一个字典把 data里边的数据加进来，或者自己解析字典到data那一层传进去
    [dic objectForKey:@"data"] 需要有这个 key-value
 
3. 获取的时候 应该是需要唯一标识的，你不知道我就暂时没用，就写了一个标识，读数据库的时候没有用地啊，回来你找到唯一标示的时候，加进去，修改下
 
4. 使用方法，直接 实例化这个类， BWCacheHelper * helper =[[BWCacheHelper alloc] init];
   然后用这个类调取实例方法把要缓存的数据传进来就行
 
5. 数据库删除是删除所有的缓存数据
*/


@interface BWCacheHelper : NSObject


- (void)deleteCache;
- (void)cache:(NSDictionary*)dic;
- (NSString*)getCache:(NSString*)uniqueIdentifier;


@end
