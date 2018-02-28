//
//  HRRoseAnimationView.h
//  OperationDemo
//
//  Created by user on 2016/11/3.
//  Copyright © 2016年 cc. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^animationWithComplete)();
@interface HRRoseAnimationView : UIView



@property (nonatomic, copy)animationWithComplete animationWithComplete;

- (void)showAnimationWithComplete:(animationWithComplete)animationWithComplete;

@end
