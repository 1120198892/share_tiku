//
//  NetworkHelper.h
//  Wantiku
//
//  Created by mayw on 15/11/10.
//  Copyright © 2015年 mayw. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkHelper : NSObject

@property (nonatomic, assign) BOOL enforeDownloading;

+ (instancetype)shared;

+ (BOOL)addSkipBackupAttributeToItemAtURL:(NSString *)path;

- (void)startstartMonitoring;

- (BOOL)connectedToNetwork;

@end
