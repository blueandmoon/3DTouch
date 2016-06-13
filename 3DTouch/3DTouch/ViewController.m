//
//  ViewController.m
//  3DTouch
//
//  Created by 李根 on 16/6/13.
//  Copyright © 2016年 ligen. All rights reserved.
//

#import "ViewController.h"
#import "FirstViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:btn];
    btn.frame = CGRectMake(100, 100, 100, 50);
    btn.backgroundColor = [UIColor orangeColor];
    [btn addTarget:self action:@selector(jump:) forControlEvents:UIControlEventTouchUpInside];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getNotifications:) name:@"ddd" object:nil];
}

- (void)getNotifications:(NSNotification *)notice {
    NSString *type = notice.userInfo[@"type"];
    if ([type isEqualToString:@"1"]) {
        FirstViewController *firstVC = [[FirstViewController alloc] init];
        [self.navigationController pushViewController:firstVC animated:YES];
    } else {
        NSLog(@"henghengheng");
    }
}

- (void)jump:(id)sender {
    FirstViewController *firstVC = [[FirstViewController alloc] init];
    [self.navigationController pushViewController:firstVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
