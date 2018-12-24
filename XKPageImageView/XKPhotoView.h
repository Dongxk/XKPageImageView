//
//  XKPhotoView.h
//  WeChat
//
//  Created by Dongxk on 2018/4/8.
//  Copyright © 2018年 WeChat. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol XKPhotoViewDelegate;

@interface XKPhotoView : UIScrollView

@property (assign, nonatomic) id<XKPhotoViewDelegate> photoViewDelegate;

- (void)prepareForReuse;
- (void)displayImage:(NSURL *)aImageUrl;

- (void)updateZoomScale:(CGFloat)newScale;
- (void)updateZoomScale:(CGFloat)newScale withCenter:(CGPoint)center;

@end

@protocol XKPhotoViewDelegate <NSObject>

@optional

- (void)photoViewDidSingleTap:(XKPhotoView *)photoView;
- (void)photoViewDidDoubleTap:(XKPhotoView *)photoView;
- (void)photoViewDidTwoFingerTap:(XKPhotoView *)photoView;
- (void)photoViewDidDoubleTwoFingerTap:(XKPhotoView *)photoView;

@end
