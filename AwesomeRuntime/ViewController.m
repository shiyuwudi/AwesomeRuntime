//
//  ViewController.m
//  AwesomeRuntime
//
//  Created by apple2 on 16/7/19.
//  Copyright © 2016年 shiyuwudi. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+LogProperty.h"
#import "UIGestureRecognizer+AddTag.h"
#import "NSArray+Bounds.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSDictionary *testDict = @{@"key": @"value", @"numberInt": @2, @"numberFloat": @2.3,@"arr": @[@"obj1", @"obj2"], @"dict": @{@"key":@"value"}};
    [testDict logDict];
    
    UITapGestureRecognizer *gr = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleTap:)];
    gr.tag = 12;
    [self.view addGestureRecognizer:gr];
    
    NSArray *arr = @[@1,@2,@3];
    NSLog(@"%@",[arr objectAtIndex:3]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)handleTap:(UIGestureRecognizer *)gr{
    NSLog(@"tag is %d", gr.tag);
}

@end
