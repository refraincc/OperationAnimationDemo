//
//  HRFireworksAniamtionView.h
//  OperationDemo
//
//  Created by user on 2016/11/10.
//  Copyright © 2016年 cc. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "HRUserGiftModel.h"
typedef void(^animationWithComplete)();


@interface HRFireworksAniamtionView : UIView


//@property (nonatomic, strong)HRUserGiftModel *giftModel;

@property (nonatomic, copy)animationWithComplete animationWithComplete;

- (void)showAnimationWithComplete:(animationWithComplete)animationWithComplete;


- (void)stopAnimation;

@end
