//
//  ZCCarAnimationView.h
//  OperationDemo
//
//  Created by user on 16/8/13.
//  Copyright © 2016年 cc. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void(^animationWithComplete)();

@interface ZCCarAnimationView : UIView

+ (ZCCarAnimationView *)carAnimationView;

- (void)showCarAnimationWithComplete:(animationWithComplete)animationWithComplete;

@property (nonatomic, copy)animationWithComplete animationWithComplete;

@end
