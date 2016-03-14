//
//  NetworkHelper.m
//  Wantiku
//
//  Created by mayw on 15/11/10.
//  Copyright © 2015年 mayw. All rights reserved.
//

#import "NetworkHelper.h"
#import "AFNetworkReachabilityManager.h"
#import <CommonCrypto/CommonCrypto.h>
#import <netinet/in.h>
#import <SystemConfiguration/SCNetworkReachability.h>

@implementation NetworkHelper

DISPATCH_ONCE_CLASS

+ (BOOL)addSkipBackupAttributeToItemAtURL:(NSString*) path
{
    NSError *error = nil;
    NSURL* url = [NSURL fileURLWithPath:path];
    BOOL success = [url setResourceValue:[NSNumber numberWithBool:YES]
                                  forKey:NSURLIsExcludedFromBackupKey
                                   error:&error];
    return success;
}

- (void)startstartMonitoring
{
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    [manager startMonitoring];
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        if (status == AFNetworkReachabilityStatusNotReachable) {
            
        } else if (status == AFNetworkReachabilityStatusReachableViaWWAN || status == AFNetworkReachabilityStatusReachableViaWiFi) {
            
        }
    }];
}

- (BOOL)connectedToNetwork
{
    //创建零地址，0.0.0.0的地址表示查询本机的网络连接状态
    struct sockaddr_in zeroAddress;
    bzero(&zeroAddress, sizeof(zeroAddress));
    zeroAddress.sin_len = sizeof(zeroAddress);
    zeroAddress.sin_family = AF_INET;
    
    // Recover reachability flags
    SCNetworkReachabilityRef defaultRouteReachability = SCNetworkReachabilityCreateWithAddress(NULL, (struct sockaddr *)&zeroAddress);
    SCNetworkReachabilityFlags flags;
    //获得连接的标志
    BOOL didRetrieveFlags = SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags);
    CFRelease(defaultRouteReachability);
    //如果不能获取连接标志，则不能连接网络，直接返回
    if (!didRetrieveFlags)
    {
        return NO;
    }
    //根据获得的连接标志进行判断
    BOOL isReachable = flags & kSCNetworkFlagsReachable;
    BOOL needsConnection = flags & kSCNetworkFlagsConnectionRequired;
    BOOL isWWAN = flags & kSCNetworkReachabilityFlagsIsWWAN;
    return (isReachable && (!needsConnection || isWWAN)) ? YES : NO;
}

@end
