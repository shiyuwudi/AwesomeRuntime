//
//  NSArray+Bounds.m
//  AwesomeRuntime
//
//  Created by apple2 on 16/7/19.
//  Copyright © 2016年 shiyuwudi. All rights reserved.
//

#import "NSArray+Bounds.h"
#import "objc/runtime.h"

@implementation NSArray (Bounds)

+(void)load{
    //[@[] objectAtIndex:2];
    Method originalMethod = class_getInstanceMethod(self, @selector(objectAtIndex:));
    Method myMethod = class_getInstanceMethod(self, @selector(objectAtMyIndex:));
    method_exchangeImplementations(originalMethod, myMethod);
}

-(id)objectAtMyIndex:(NSUInteger)index{
    if (index >= self.count) {
        //数组越界
        return nil;
    }
    return [self objectAtMyIndex:index];
}

@end
