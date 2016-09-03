//
//  ZCYachtAnimationView.m
//  OperationDemo
//
//  Created by user on 16/8/13.
//  Copyright © 2016年 cc. All rights reserved.
//

#import "ZCYachtAnimationView.h"
#import "UIView+Extension.h"
#define Scrren_H  [UIScreen mainScreen].bounds.size.height
#define Scrren_W  [UIScreen mainScreen].bounds.size.width
#define Scrren_CenterX  Scrren_W / 2
#define Scrren_CenterY  Scrren_H / 2
@interface ZCYachtAnimationView ()
@property (weak, nonatomic) IBOutlet UIView *shipView;
@property (weak, nonatomic) IBOutlet UIImageView *waveImageView;
@property (weak, nonatomic) IBOutlet UIImageView *leftFish;
@property (weak, nonatomic) IBOutlet UIImageView *rightFish;
@property (weak, nonatomic) IBOutlet UIImageView *tailImageView;
@property (weak, nonatomic) IBOutlet UIImageView *waveBackground1;
@property (weak, nonatomic) IBOutlet UIImageView *waveBackground2;

@end


@implementation ZCYachtAnimationView

+ (ZCYachtAnimationView *)yachtAnimationView{
    return [[NSBundle mainBundle] loadNibNamed:@"ZCYachtAnimationView" owner:nil options:nil].lastObject;
}

- (void)awakeFromNib{
    self.waveImageView.animationImages = @[[UIImage imageNamed:@"test_3-1"],[UIImage imageNamed:@"test_3-2"],[UIImage imageNamed:@"test_3-3"],[UIImage imageNamed:@"test_3-4"],[UIImage imageNamed:@"test_3-5"],[UIImage imageNamed:@"test_3-6"],[UIImage imageNamed:@"test_3-7"],[UIImage imageNamed:@"test_3-8"],];
    self.waveImageView.animationDuration = 1;
}


- (void)showAnimationWithComplete:(animationWithComplete)animationWithComplete{
    
    _animationWithComplete = animationWithComplete;

    [self.waveImageView startAnimating];
    
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
    anim.duration = 5.0;
    anim.keyPath = @"position.x";
    anim.values = @[@120 , @(Scrren_W - 80)];
    [self.waveBackground1.layer addAnimation:anim forKey:@"position.x"];
    
    
    CAKeyframeAnimation *anim2 = [CAKeyframeAnimation animation];
    anim2.duration = 5.0;
    anim2.keyPath = @"position.x";
    anim2.values = @[@100 , @(Scrren_W - 80)];
    [self.waveBackground2.layer addAnimation:anim2 forKey:@"position.x"];
    
    
    
    CAKeyframeAnimation *tailImageViewAnim = [CAKeyframeAnimation animation];
    tailImageViewAnim.duration = 5.0;
    tailImageViewAnim.keyPath = @"position.x";
    tailImageViewAnim.values = @[@250 , @600];
    [self.tailImageView.layer addAnimation:tailImageViewAnim forKey:@"position.x"];
    
    
    CAKeyframeAnimation *leftFishAnim = [CAKeyframeAnimation animation];
    leftFishAnim.duration = 5.0;
    leftFishAnim.keyPath = @"position.x";
    leftFishAnim.values = @[@(100), @(300)];
    leftFishAnim.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear],
                                   [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn],
                                   [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]
                                   ];
    [self.leftFish.layer addAnimation:leftFishAnim forKey:@"position.x"];
    
    CAKeyframeAnimation *rightFishAnim = [CAKeyframeAnimation animation];
    rightFishAnim.duration = 5.0;
    rightFishAnim.keyPath = @"position.x";
    rightFishAnim.values = @[@(250), @(320)];
    rightFishAnim.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear],
                                     [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn],
                                     [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]
                                     ];
    [self.rightFish.layer addAnimation:rightFishAnim forKey:@"position.x"];
    
    
    
    CAKeyframeAnimation *shipAnim = [CAKeyframeAnimation animation];
    shipAnim.duration = 5.0;
    shipAnim.keyPath = @"position";
    shipAnim.values = @[[NSValue valueWithCGPoint:CGPointMake(-40, Scrren_H - 200)],
                        [NSValue valueWithCGPoint:CGPointMake(140, Scrren_H - 175)],
                        [NSValue valueWithCGPoint:CGPointMake(Scrren_W - 200, Scrren_H - 165)],
                        [NSValue valueWithCGPoint:CGPointMake(Scrren_W , Scrren_H - 140)]];
    shipAnim.timingFunctions = @[
                                 [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear],
                                      [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn],
                                      [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]
                                      ];
    shipAnim.keyTimes = @[@0, @0.3, @0.7, @1];
    shipAnim.delegate = self;
    shipAnim.removedOnCompletion = NO;
    [self.shipView.layer addAnimation:shipAnim forKey:@"position.x"];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    !_animationWithComplete ? : _animationWithComplete();
}
- (void)layoutSubviews{
    [super layoutSubviews];
    self.waveBackground1.y = Scrren_H - 240;
    self.waveBackground2.y = Scrren_H - 240;
    self.leftFish.y = Scrren_H - 100;
    self.rightFish.y = Scrren_H - 180;
    self.tailImageView.y = Scrren_H - 200;
}

@end
