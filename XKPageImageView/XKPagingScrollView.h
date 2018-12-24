//
//  XKPagingScrollView.h
//  WeChat
//
//  Created by Dongxk on 2018/4/8.
//  Copyright © 2018年 WeChat. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol XKPagingScrollViewDelegate;

@interface XKPagingScrollView : UIScrollView

@property (assign, nonatomic) IBOutlet id <XKPagingScrollViewDelegate> pagingViewDelegate;
@property (readonly) UIView *visiblePageView;
@property (assign) BOOL suspendTiling;

- (void)displayPagingViewAtIndex:(NSUInteger)index;
- (void)resetDisplay;

@end

@protocol XKPagingScrollViewDelegate <NSObject>

@required

- (Class)pagingScrollView:(XKPagingScrollView *)pagingScrollView classForIndex:(NSUInteger)index;
- (NSUInteger)pagingScrollViewPagingViewCount:(XKPagingScrollView *)pagingScrollView;
- (UIView *)pagingScrollView:(XKPagingScrollView *)pagingScrollView pageViewForIndex:(NSUInteger)index;
- (void)pagingScrollView:(XKPagingScrollView *)pagingScrollView preparePageViewForDisplay:(UIView *)pageView forIndex:(NSUInteger)index;

@end
