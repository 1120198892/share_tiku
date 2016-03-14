//
//  NSArray+BMWArray.m
//  XiaoChentiku
//
//  Created by erice on 16/3/11.
//  Copyright © 2016年 erice. All rights reserved.
//

#import "NSArray+BMWArray.h"
#import <objc/runtime.h>


@implementation NSArray (BMWArray)

+ (void)load{

    [super load];
    
    Method fromMethod = class_getInstanceMethod(objc_getClass("__NSArrayI"), @selector(objectAtIndex:));
    
    Method toMethod = class_getInstanceMethod(objc_getClass("__NSArrayI"), @selector(bmw_objectAtIndex:));
    
    method_exchangeImplementations(fromMethod, toMethod);
    
    
}

- (id)bmw_objectAtIndex:(NSInteger)index{
 
    if (self.count -1 < index) {
        
        @try {
            return [self bmw_objectAtIndex:index];
        }
        @catch (NSException *exception) {
            
            NSLog(@" object At inDex  creash");
            return nil;
        }
        @finally {
        }
        
    }else{
        
        return [self bmw_objectAtIndex:index];
        
    }
    
}


@end
