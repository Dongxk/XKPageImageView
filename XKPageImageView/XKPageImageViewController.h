//
//  XKPageImageViewController.h
//  WeChat
//
//  Created by Dongxk on 2018/4/8.
//  Copyright © 2018年 WeChat. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XKPhotoView;

@interface XKPageImageViewController : UIViewController

@property (strong, nonatomic) NSArray *imageArr;
@property (nonatomic, strong) XKPhotoView *photoView;
@property (nonatomic, assign) NSInteger pageIndex;

@end
