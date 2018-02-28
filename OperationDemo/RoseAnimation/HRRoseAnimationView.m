//
//  HRRoseAnimationView.m
//  OperationDemo
//
//  Created by user on 2016/11/3.
//  Copyright © 2016年 cc. All rights reserved.
//


#define Scrren_H  [UIScreen mainScreen].bounds.size.height
#define Scrren_W  [UIScreen mainScreen].bounds.size.width
#define Scrren_CenterX  Scrren_W / 2
#define Scrren_CenterY  Scrren_H / 2
#import "HRRoseAnimationView.h"

#import "HRRoseView.h"
#import "UIView+Extension.h"

@interface HRRoseAnimationView()

@property (strong, nonatomic) IBOutlet UIImageView *rose;

@property (nonatomic, weak)HRRoseView *bigRoseView;
@property (nonatomic, weak)HRRoseView *smallRoseView;
@property (strong, nonatomic) IBOutlet UILabel *nickNameLabel;

@end


@implementation HRRoseAnimationView



- (instancetype)init{
    if (self = [super init]) {
        self = [[NSBundle mainBundle] loadNibNamed:@"HRRoseAnimationView" owner:nil options:nil].lastObject;
        self.frame = CGRectMake(0, 0, Scrren_W, Scrren_H);
        
        
        HRRoseView *bigRoseView = [[HRRoseView alloc]init];
        self.bigRoseView = bigRoseView;
        bigRoseView.center = self.center;
        [self addSubview:bigRoseView];
        
        HRRoseView *smallRoseView = [[HRRoseView alloc]init];
        self.smallRoseView = smallRoseView;
        smallRoseView.center = self.center;
        smallRoseView.transform = CGAffineTransformMakeScale(0.65, 0.65);
        [self addSubview:smallRoseView];
        
    }
    return self;
}


- (void)showAnimationWithComplete:(animationWithComplete)animationWithComplete{
    
    _animationWithComplete = animationWithComplete;
    
    [self.bigRoseView startAnimation];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.smallRoseView startAnimation];
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        for (int i = 0; i < 30; i++) {
            NSInteger randomNum2 = arc4random() % 100;
            [self addRoseWithBeginTime:randomNum2 / 100.0];
        }
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        !_animationWithComplete ? : _animationWithComplete();
    });
    
}


- (void)addRoseWithBeginTime:(CFTimeInterval)beginTime{
    
    NSInteger randomNum = arc4random() % 2;
    NSInteger randomNumSize = arc4random() % 50;
    NSString *imageName;
    if (randomNum == 1) {
        imageName = @"rose";
    }else{
        imageName = @"rose_2";
    }
    
    UIImageView *roseImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:imageName]];
    roseImageView.frame = CGRectMake(0, -65 - randomNumSize  , 65 + randomNumSize, 65 + randomNumSize);
    [self addSubview:roseImageView];
    
    [roseImageView.layer addAnimation:[self positionAnimatinWithBeginTime:beginTime] forKey:@""];
    [roseImageView.layer addAnimation:[self alphaAnimatin] forKey:@""];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)( (2.3 + beginTime ) * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [roseImageView removeFromSuperview];
    });
    
    
}


- (CAKeyframeAnimation *)positionAnimatinWithBeginTime:(CFTimeInterval)beginTime{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position";
    
    NSInteger randomNum2 = arc4random() % 40;
    
    CGFloat w = (Scrren_H - 40 + randomNum2) / 6;
    
    UIBezierPath* aPath = [UIBezierPath bezierPath];
    
    NSInteger randomNum = arc4random() % (NSInteger)Scrren_W;
    if (randomNum < Scrren_W / 10) {
        randomNum += Scrren_W / 10;
    }
    if (randomNum > Scrren_W - (Scrren_W / 10)) {
        randomNum -= Scrren_W / 7;
    }
    
    CGFloat startX = randomNum ;
    
    
    [aPath moveToPoint:CGPointMake(startX, 0)];
    
    
    if (randomNum % 2 == 1) {
        
        [aPath addCurveToPoint:CGPointMake(startX, w * 3) controlPoint1:CGPointMake(startX + (w / 2 + randomNum2),  w) controlPoint2:CGPointMake(startX - (w / 2 - randomNum2), w * 2)];
        [aPath addCurveToPoint:CGPointMake(startX, w * 6) controlPoint1:CGPointMake(startX + (w / 2 + randomNum2),  w * 4) controlPoint2:CGPointMake(startX - (w / 2 - randomNum2), w * 5)];
    }else{
        [aPath addCurveToPoint:CGPointMake(startX, w * 3) controlPoint1:CGPointMake(startX - (w / 2 - randomNum2),  w) controlPoint2:CGPointMake(startX + (w / 2 + randomNum2), w * 2)];
        [aPath addCurveToPoint:CGPointMake(startX, w * 6) controlPoint1:CGPointMake(startX - (w / 2 - randomNum2),  w * 4) controlPoint2:CGPointMake(startX + (w / 2 + randomNum2), w * 5)];
    }
    
    
    animation.path = aPath.CGPath;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    animation.duration = 2.8;
    
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    animation.beginTime = CACurrentMediaTime() + beginTime;
    
    return animation;
}


- (CABasicAnimation *)alphaAnimatin{
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"opacity";
    animation.duration = 1.5;
    animation.removedOnCompletion = NO;
    animation.fromValue = @1.0;
    animation.toValue = @0.0;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    animation.beginTime = CACurrentMediaTime() + 1.9;
    return animation;
}



@end
