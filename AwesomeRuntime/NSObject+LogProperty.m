//
//  NSObject+LogProperty.m
//  AwesomeRuntime
//
//  Created by apple2 on 16/7/19.
//  Copyright © 2016年 shiyuwudi. All rights reserved.
//

#import "NSObject+LogProperty.h"

@implementation NSDictionary (LogProperty)

// 自动打印属性字符串
-(void)logDict{
    // 拼接属性字符串代码
    NSMutableString *strM = [NSMutableString string];
    // 1.遍历字典，把字典中的所有key取出来，生成对应的属性代码
    [self enumerateKeysAndObjectsUsingBlock:^(id _Nonnull key, id _Nonnull obj, BOOL * _Nonnull stop) {
        //类型经常变，抽出来
        NSString *type;
        if ([obj isKindOfClass:NSClassFromString(@"__NSCFString")]) {
            type = @"NSString";
        }else if ([obj isKindOfClass:NSClassFromString(@"__NSCFArray")] || [obj isKindOfClass:NSClassFromString(@"__NSArrayI")]){
            type = @"NSArray";
        }else if ([obj isKindOfClass:NSClassFromString(@"__NSCFNumber")]){
//            type = @"int";
            NSNumber *num = obj;
            if (num.floatValue == num.intValue) {
                type = @"int";
            } else {
                type = @"float";
            }
        }else if ([obj isKindOfClass:NSClassFromString(@"__NSCFDictionary")] || [obj isKindOfClass:NSClassFromString(@"__NSDictionaryI")]){
            type = @"NSDictionary";
        }
        // 属性字符串
        NSString *str;
        if ([type isEqualToString:@"NSString"]) {
            str = [NSString stringWithFormat:@"@property (nonatomic, copy) %@ *%@;",type,key];
        } else if ([type containsString:@"NS"]) {
            str = [NSString stringWithFormat:@"@property (nonatomic, strong) %@ *%@;",type,key];
        }else{
            str = [NSString stringWithFormat:@"@property (nonatomic, assign) %@ %@;",type,key];
        }
        // 每生成属性字符串，就自动换行。
        [strM appendFormat:@"\n%@\n",str];
    }];
    // 把拼接好的字符串打印出来，就好了。
    NSLog(@"%@",strM);
}

@end
