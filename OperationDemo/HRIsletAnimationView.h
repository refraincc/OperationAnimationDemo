//
//  HRIsletAnimationView.h
//  OperationDemo
//
//  Created by user on 16/8/24.
//  Copyright © 2016年 cc. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HRUserGiftModel;

typedef void(^animationWithComplete)();

@interface HRIsletAnimationView : UIView

//@property (nonatomic, strong)HRUserGiftModel *giftModel;

+ (HRIsletAnimationView *)isletAniumationView;

@property (nonatomic, copy)animationWithComplete animationWithComplete;

- (void)showAnimationWithComplete:(animationWithComplete)animationWithComplete;
@end
