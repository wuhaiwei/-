//
//  ViewController.m
//  滑动来解锁
//
//  Created by  wuhiwi on 2017/7/26.
//  Copyright © 2017年 huijiayou.com. All rights reserved.
//

#import "ViewController.h"
#import "AnimatedMaskLabel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    AnimatedMaskLabel *label = [[AnimatedMaskLabel alloc] initWithFrame:CGRectMake(50, 200, 275, 50)];
    [self.view addSubview:label];
}


@end
