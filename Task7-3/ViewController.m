//
//  ViewController.m
//  Task7-3
//
//  Created by 🍋 on 16/8/26.
//  Copyright © 2016年 🍋. All rights reserved.
//

#import "ViewController.h"
#import "Scroll.h"

@interface ViewController ()

@property (nonatomic,strong) Scroll * scrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.scrollView = [[Scroll alloc]initWithFrame:self.view.bounds];
    self.scrollView.showTime = 2.0;
    [self.view addSubview:self.scrollView];
    
}

@end
