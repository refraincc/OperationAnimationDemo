//
//  ZCAirplaneAnimationView.m
//  OperationDemo
//
//  Created by user on 16/8/15.
//  Copyright © 2016年 cc. All rights reserved.
//

#import "ZCAirplaneAnimationView.h"
#import "UIView+Extension.h"

#define Scrren_H  [UIScreen mainScreen].bounds.size.height
#define Scrren_W  [UIScreen mainScreen].bounds.size.width
#define Scrren_CenterX  Scrren_W / 2
#define Scrren_CenterY  Scrren_H / 2
@interface ZCAirplaneAnimationView ()


@property (weak, nonatomic) IBOutlet UIImageView *airplane;

@property (weak, nonatomic) IBOutlet UIImageView *cloud1;
@property (weak, nonatomic) IBOutlet UIImageView *cloud2;
@property (weak, nonatomic) IBOutlet UIImageView *cloud3;
@property (weak, nonatomic) IBOutlet UIImageView *cloud4;
@property (weak, nonatomic) IBOutlet UIImageView *cloud5;

@end

@implementation ZCAirplaneAnimationView


+ (ZCAirplaneAnimationView *)airplaneAnimationView{
    return [[NSBundle mainBundle] loadNibNamed:@"ZCAirplaneAnimationView" owner:nil options:nil].lastObject;
}

- (void)awakeFromNib{
    
    
}

- (void)showAnimationWithComplete:(animationWithComplete)animationWithComplete{
    
    _animationWithComplete = animationWithComplete;
    
    
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
    anim.keyPath = @"position";
    anim.values = @[[NSValue valueWithCGPoint:CGPointMake(-100, Scrren_H  * 0.5)],[NSValue valueWithCGPoint:CGPointMake(Scrren_CenterX - 25, Scrren_H  * 0.63)],[NSValue valueWithCGPoint:CGPointMake(Scrren_CenterX  , Scrren_H  * 0.65 )],[NSValue valueWithCGPoint:CGPointMake(Scrren_W + 100, Scrren_H  * 0.75)]];
    anim.keyTimes = @[@0, @0.3, @0.5, @1];
    
    anim.duration = 3.0;
    anim.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear],
                             [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn],
                             [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]
                             ];
    
    anim.fillMode = kCAFillModeForwards;
    anim.removedOnCompletion = NO;
    anim.delegate = self;
    [self.airplane.layer addAnimation:anim forKey:@"position"];
    
    
    
    CGFloat cloud1X = self.cloud1.x;
    CAKeyframeAnimation *cloud1 = [CAKeyframeAnimation animation];
    cloud1.keyPath = @"position.x";
    cloud1.values = @[@(cloud1X - 100),@(cloud1X - 150),@(cloud1X - 180)];
    cloud1.keyTimes = @[@0, @0.7,@1];
    cloud1.duration = 3.0;
    
    [self.cloud1.layer addAnimation:cloud1 forKey:nil];
    
    
    CGFloat cloud2X = self.cloud2.x;
    CAKeyframeAnimation *cloud2 = [CAKeyframeAnimation animation];
    cloud2.keyPath = @"position.x";
    cloud2.values = @[@(cloud2X - 100),@(cloud2X - 150),@(cloud2X - 180)];
    cloud2.keyTimes = @[@0, @0.7,@1];
    cloud2.duration = 3.0;
    
    [self.cloud2.layer addAnimation:cloud2 forKey:nil];
    
    
    CGFloat cloud3X = self.cloud3.x;
    CAKeyframeAnimation *cloud3 = [CAKeyframeAnimation animation];
    cloud3.keyPath = @"position.x";
    cloud3.values = @[@(cloud3X - 100),@(cloud3X - 150),@(cloud3X - 200)];
    cloud3.keyTimes = @[@0, @0.5,@1];
    cloud3.duration = 3.0;
    
    [self.cloud3.layer addAnimation:cloud3 forKey:nil];
    
    
    CGFloat cloud4X = Scrren_W;
    CAKeyframeAnimation *cloud4 = [CAKeyframeAnimation animation];
    cloud4.keyPath = @"position.x";
    cloud4.values = @[@(cloud4X),@(cloud4X -= cloud4X * 0.3)];
    cloud4.keyTimes = @[@0,@1];
    cloud4.duration = 3.0;
    
    [self.cloud4.layer addAnimation:cloud4 forKey:nil];
    
    
    CGFloat cloud5X = Scrren_W;
    CAKeyframeAnimation *cloud5 = [CAKeyframeAnimation animation];
    cloud5.keyPath = @"position.x";
    cloud5.values = @[@(cloud5X),@(cloud5X -= cloud5X * 0.3)];
    cloud5.keyTimes = @[@0,@1];
    cloud5.duration = 3.0;
    
    [self.cloud5.layer addAnimation:cloud5 forKey:nil];
    
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    !_animationWithComplete ? : _animationWithComplete();
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.cloud1.x -= 50;
    self.cloud2.x -= 50;
    self.cloud3.x -= 100;
    self.cloud4.x = Scrren_W;
    self.cloud5.x = Scrren_W;
    
    self.cloud1.y += 50;
    self.cloud2.y += 50;
    self.cloud3.y += 60;
    self.cloud4.y += 90;
    self.cloud5.y += 90;
}


@end
