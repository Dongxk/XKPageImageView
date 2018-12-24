//
//  XKPageImageViewController.m
//  WeChat
//
//  Created by Dongxk on 2018/4/8.
//  Copyright © 2018年 WeChat. All rights reserved.
//


#import "XKPageImageViewController.h"
#import "XKPagingScrollView.h"
#import "XKPhotoView.h"


@interface XKPageImageViewController ()<XKPagingScrollViewDelegate, XKPhotoViewDelegate, UIScrollViewDelegate>

@property (strong, nonatomic) XKPagingScrollView *pagingScrollView;
@property (strong, nonatomic) UILabel *pageLabel;
@end

@implementation XKPageImageViewController

-(void)backPreviousPage
{
    [self.navigationController popViewControllerAnimated:NO];
    _pagingScrollView.delegate = nil;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationController.navigationBar.barTintColor = [UIColor blackColor];
    
    //避免scrollView自动往下偏移64个像素
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
    
    [self initControl];
}

-(void)initControl
{
    _pagingScrollView = [[XKPagingScrollView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height)];
    _pagingScrollView.pagingViewDelegate = self;
    _pagingScrollView.pagingEnabled = YES;
    _pagingScrollView.userInteractionEnabled = YES;
    _pagingScrollView.bounces = NO;
    [self.view addSubview:_pagingScrollView];
    [self.pagingScrollView displayPagingViewAtIndex:_pageIndex];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0.0 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        self.pagingScrollView.contentInset = UIEdgeInsetsMake(0.0, 0.0, 0.0, 0.0);
    });
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(10, 64, 44, 44);
    [button addTarget:self action:@selector(closeImage:) forControlEvents:UIControlEventTouchUpInside];
    [button setImage:[UIImage imageNamed:@"close"] forState:UIControlStateNormal];
    [self.view addSubview:button];
    
   self.pageLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width / 2 - 30, self.view.frame.size.height - 80, 60, 30)];

    self.pageLabel.text = [NSString stringWithFormat:@"%ld / %ld", _pageIndex+1,  _imageArr.count];
    self.pageLabel.layer.cornerRadius = 3;
    self.pageLabel.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.64];
    self.pageLabel.font = [UIFont boldSystemFontOfSize:19];
    self.pageLabel.textColor = [UIColor whiteColor];
    [self.view addSubview:self.pageLabel];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.hidden = NO;
}

//不支持横屏
-(BOOL)shouldAutorotate
{
    return NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)toggleFullScreen
{
    [self backPreviousPage];
}

#pragma mark - PZPagingScrollViewDelegate
#pragma mark -

- (Class)pagingScrollView:(XKPagingScrollView *)pagingScrollView classForIndex:(NSUInteger)index
{
    return [XKPhotoView class];
}

- (NSUInteger)pagingScrollViewPagingViewCount:(XKPagingScrollView *)pagingScrollView
{
    return self.imageArr.count;
}

- (UIView *)pagingScrollView:(XKPagingScrollView *)pagingScrollView pageViewForIndex:(NSUInteger)index
{
    XKPhotoView *photoView = [[XKPhotoView alloc] initWithFrame:self.view.bounds];
    photoView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    photoView.photoViewDelegate = self;
    return photoView;
}

- (void)pagingScrollView:(XKPagingScrollView *)pagingScrollView preparePageViewForDisplay:(UIView *)pageView forIndex:(NSUInteger)index
{
    assert([pageView isKindOfClass:[XKPhotoView class]]);
    assert(index < self.imageArr.count);
    
    if (self.imageArr.count) {
        self.pageLabel.text = [NSString stringWithFormat:@"%ld / %ld",index+1, self.imageArr.count];
    }
    self.photoView = (XKPhotoView *)pageView;
    NSString * object = [self.imageArr objectAtIndex:index];
    NSURL *imageUrl = [NSURL URLWithString:object];
    [self.photoView displayImage:imageUrl];
}

#pragma mark - PZPhotoViewDelegate
#pragma mark -

- (void)photoViewDidSingleTap:(XKPhotoView *)photoView {

    [self dismissViewControllerAnimated:NO completion:nil];
}

- (void)photoViewDidDoubleTap:(XKPhotoView *)photoView{
    
    
}
- (void)photoViewDidTwoFingerTap:(XKPhotoView *)photoView{
    
    
}
- (void)photoViewDidDoubleTwoFingerTap:(XKPhotoView *)photoView{
    
}

- (void)closeImage:(UIButton *) button
{
    [self dismissViewControllerAnimated:NO completion:nil];
//    self.pagingViewDelegate = nil;
    
}

@end
