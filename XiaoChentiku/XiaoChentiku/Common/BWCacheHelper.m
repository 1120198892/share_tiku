//
//  BWCacheHelper.m
//  XiaoChentiku
//
//  Created by erice on 16/2/24.
//  Copyright © 2016年 erice. All rights reserved.
//



// 数据库核心
@interface BWDataBase : NSObject

{
    NSString*  dbPath;
}

- (BOOL)deleteCacheContent;
- (BOOL)saveCacheContent:(NSDictionary *)dic;
- (NSString*)getCacheContent:(NSString*)paperId;


@end

#import "DataCenter.h"
#import "FMDatabase.h"
@implementation BWDataBase


- (id) initWithPath:(NSString*)path
{
    self = [super init];
    if (self) {
        dbPath = [[NSString alloc] initWithString:path];
        NSFileManager * fileManager = [NSFileManager defaultManager];
        if ([fileManager fileExistsAtPath:dbPath] == NO)
        {
            [self createCacheDB];
            
        }
    }
    
    return self;
}

- (BOOL)createCacheDB{
    
    FMDatabase * db = [FMDatabase databaseWithPath:dbPath];
    if ([db open]) {
        NSString * sql = @"CREATE TABLE IF NOT EXISTS BWCACHETABLE (userId text, content text)";
        if (![db executeUpdate:sql]) {
            [db close];
            return NO;
        }
        [db close];
        return YES;
    }
    return NO;
    
    
}

#pragma mark - api

// 只存 data
- (BOOL)saveCacheContent:(NSDictionary *)dic
{
    if (dic == nil)
    {
        return NO;
    }
    
    FMDatabase *db = [FMDatabase databaseWithPath:dbPath];
    
    if ([db open])
    {
        BOOL res = [db executeUpdate:@"DELETE FROM BWCACHETABLE WHERE userId=?",[NSString stringWithFormat:@"%@",[DataCenter shared].userId]];
        
        if (!res)
        {
            [db close];
        }
        
        [db close];
    }
    
    if ([db open])
    {
        NSString * sql = @"Replace into BWCACHETABLE (userId,content) values(?,?)";
        BOOL res = [db executeUpdate:sql,[NSString stringWithFormat:@"%@",[DataCenter shared].userId],[dic objectForKey:@"data"]];
        
        if (!res)
        {
            [db close];
            return NO;
        }
        
        [db close];
        
        return YES;
    }
    return NO;
}

- (NSString*)getCacheContent:(NSString*)paperId
{
    FMDatabase *db = [FMDatabase databaseWithPath:dbPath];
    if ([db open])
    {
        NSString *sql = @"SELECT * FROM BWCACHETABLE WHERE userId=? ";
        FMResultSet *result = [db executeQuery:sql,[NSString stringWithFormat:@"%@",[DataCenter shared].userId]];
        NSString *str = nil;
        
        while ([result next])
        {
            str = [NSString stringWithFormat:@"%@",[result stringForColumn:@"content"]];
        }
        
        [db close];
        return str;
    }
    
    return nil;
}

- (BOOL)deleteCacheContent
{
    FMDatabase * db = [FMDatabase databaseWithPath:dbPath];
    if ([db open])
    {
        BOOL res = [db executeUpdate:@"DELETE FROM BWCACHETABLE WHERE userId=?",[NSString stringWithFormat:@"%@",[DataCenter shared].userId]];
        
        if (!res)
        {
            [db close];
            return NO;
        }
        
        [db close];
        return YES;
    }
    
    return NO;
}




@end


#import "BWCacheHelper.h"

@interface BWCacheHelper ()

{
    BWDataBase *CacheDB;
}




@end

@implementation BWCacheHelper

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        NSString *dataBaseName = [NSString stringWithFormat:@"%@DownLoad.dm",@"Cache"];
        NSString *filePath = [NSTemporaryDirectory() stringByAppendingPathComponent:dataBaseName];
         CacheDB = [[BWDataBase alloc] initWithPath:filePath];
        
    }
    return self;
}

//dic  有一个key-value  是 data- text
- (void)cache:(NSDictionary*)dic{

    [CacheDB saveCacheContent:dic];
    
}

#warning 暂时没用，唯一标识
//uniqueIdentifier  暂时没用，唯一标识 不知，确定后添加
// 返回数据是json  需要自己进一步封装一层 添加解析 返回model
- (NSString*)getCache:(NSString*)uniqueIdentifier{

    return [CacheDB getCacheContent:uniqueIdentifier];
    
}

- (void)deleteCache{

    [CacheDB deleteCacheContent];
    
}





@end









