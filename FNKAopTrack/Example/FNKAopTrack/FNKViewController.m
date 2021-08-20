//
//  FNKViewController.m
//  FNKAopTrack
//
//  Created by LWW on 03/30/2021.
//  Copyright (c) 2021 LWW. All rights reserved.
//

#import "FNKViewController.h"

@interface FNKViewController ()

@end

@implementation FNKViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self testAAA];
    [FNKViewController testFun];
}
+ (void)testFun{
    NSLog(@"testFun");
}

- (void)testAAA{
    NSLog(@"testAAA");
}
@end
