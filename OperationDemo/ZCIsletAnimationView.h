//
//  ZCIsletAnimationView.h
//  OperationDemo
//
//  Created by user on 16/8/24.
//  Copyright © 2016年 cc. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void(^animationWithComplete)();

@interface ZCIsletAnimationView : UIView



+ (ZCIsletAnimationView *)isletAniumationView;

@property (nonatomic, copy)animationWithComplete animationWithComplete;

- (void)showAnimationWithComplete:(animationWithComplete)animationWithComplete;
@end
