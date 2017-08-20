//
//  Scroll.h
//  Task7-3
//
//  Created by 🍋 on 16/8/27.
//  Copyright © 2016年 🍋. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kScreenWidth [UIScreen mainScreen].bounds.size.width

@interface Scroll : UIScrollView<UIScrollViewDelegate>

@property (nonatomic,strong) NSTimer * timer;
@property (nonatomic,strong) NSArray * array;
@property (nonatomic,strong) UIPageControl * pageControl;
@property (nonatomic,assign) CGFloat showTime;

@end
