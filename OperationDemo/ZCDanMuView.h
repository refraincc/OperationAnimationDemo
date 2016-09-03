//
//  ZCDanMuView.h
//  OperationDemo
//
//  Created by user on 16/8/16.
//  Copyright © 2016年 cc. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZCDanmuModel;
typedef void(^AnimationComplete)();

@interface ZCDanMuView : UIView


@property (nonatomic, copy)AnimationComplete AnimationComplete;


@property (nonatomic, strong)ZCDanmuModel *danMuModel;


+ (ZCDanMuView *)danMuView;


- (void)showAnimationWithComplete:(AnimationComplete)AnimationComplete;
@end
