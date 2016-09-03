//
//  ZCYachtAnimationView.h
//  OperationDemo
//
//  Created by user on 16/8/13.
//  Copyright © 2016年 cc. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^animationWithComplete)();

@interface ZCYachtAnimationView : UIView

@property (nonatomic, copy)animationWithComplete animationWithComplete;

+ (ZCYachtAnimationView *)yachtAnimationView;
- (void)showAnimationWithComplete:(animationWithComplete)animationWithComplete;
@end
