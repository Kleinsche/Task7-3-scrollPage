//
//  Scroll.m
//  Task7-3
//
//  Created by 🍋 on 16/8/27.
//  Copyright © 2016年 🍋. All rights reserved.
//

#import "Scroll.h"

@implementation Scroll

-(void)drawRect:(CGRect)rect{
    [self addPic];
    [self initScrollView];
    [self setPageControl];
//    self.showTime = 2.0;
    [self addTimer];
}


-(void)addPic{
    NSString *strPath = [[NSBundle mainBundle]pathForResource:@"Pic.plist" ofType:nil];
    NSArray *arr = [NSArray arrayWithContentsOfFile:strPath];
    self.array = arr;
}


-(void)initScrollView{
    self.delegate = self;
    
    for (int i = 0; i<self.array.count; i++) {
        UIImageView * img = [[UIImageView alloc]initWithFrame:CGRectMake(kScreenWidth * i, 0, kScreenWidth, kScreenHeight)];
        img.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",self.array[i]]];
        [self addSubview:img];
    }
    //触摸拖动
    self.contentSize = CGSizeMake(kScreenWidth * self.array.count, kScreenHeight);
    self.pagingEnabled = YES;
}


-(void)setPageControl{
    self.pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(0, kScreenHeight - 40, kScreenWidth, 40)];
    self.pageControl.numberOfPages = self.array.count;
    self.pageControl.currentPageIndicatorTintColor = [UIColor greenColor];
    self.pageControl.pageIndicatorTintColor = [UIColor redColor];
    
    [self.superview addSubview:self.pageControl];
}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSInteger page = scrollView.contentOffset.x / kScreenWidth + 0.5;
    self.pageControl.currentPage = page;
}


-(void)addTimer{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:self.showTime target:self selector:@selector(nextPage) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop]addTimer:self.timer forMode:NSRunLoopCommonModes];
}


-(void)nextPage{
    int offset = self.contentOffset.x;
    offset += kScreenWidth;
    if (offset >= kScreenWidth * self.array.count) {
        offset = 0;
    }
    [self setContentOffset:CGPointMake(offset, 0) animated:YES];
}


-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self.timer invalidate];
    self.timer = nil;
}


-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self addTimer];
    });
}

@end
