//
//  ZCAirplaneAnimationView.h
//  OperationDemo
//
//  Created by user on 16/8/15.
//  Copyright © 2016年 cc. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^animationWithComplete)();

@interface ZCAirplaneAnimationView : UIView
+ (ZCAirplaneAnimationView *)airplaneAnimationView;

- (void)showAnimationWithComplete:(animationWithComplete)animationWithComplete;

@property (nonatomic, copy)animationWithComplete animationWithComplete;

@end
