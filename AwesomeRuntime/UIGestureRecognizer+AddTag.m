//
//  UIGestureRecognizer+AddTag.m
//  AwesomeRuntime
//
//  Created by apple2 on 16/7/19.
//  Copyright © 2016年 shiyuwudi. All rights reserved.
//

#import "UIGestureRecognizer+AddTag.h"
#import "objc/runtime.h"

static const char *key = "name";

@implementation UIGestureRecognizer (AddTag)

-(int)tag{
    return ((NSNumber *)objc_getAssociatedObject(self, key)).intValue;
}

-(void)setTag:(int)tag{
    objc_setAssociatedObject(self, key, @(tag), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
