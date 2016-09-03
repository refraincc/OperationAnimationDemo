//
//  ZCCarAnimationView.m
//  OperationDemo
//
//  Created by user on 16/8/13.
//  Copyright © 2016年 cc. All rights reserved.
//

#import "ZCCarAnimationView.h"
#define Scrren_H  [UIScreen mainScreen].bounds.size.height
#define Scrren_W  [UIScreen mainScreen].bounds.size.width
#define Scrren_CenterX  Scrren_W / 2
#define Scrren_CenterY  Scrren_H / 2
#import "UIView+Extension.h"
@interface ZCCarAnimationView()


@property (weak, nonatomic) IBOutlet UIImageView *airImageView;
@property (weak, nonatomic) IBOutlet UIImageView *tyreImageView;
@property (weak, nonatomic) IBOutlet UIView *superView;
@property (weak, nonatomic) IBOutlet UIImageView *backTyreImageView;


@property (nonatomic, strong)UIImageView *imageView;

@property (nonatomic, strong)CAKeyframeAnimation *anim;

@end
@implementation ZCCarAnimationView


+ (ZCCarAnimationView *)carAnimationView{
    return [[NSBundle mainBundle] loadNibNamed:@"ZCCarAnimationView" owner:nil options:nil].lastObject;
}
- (void)awakeFromNib{
    
    self.tyreImageView.animationImages = @[[UIImage imageNamed:@"car_front_010001"],
                                           [UIImage imageNamed:@"car_front_010002"],
                                           [UIImage imageNamed:@"car_front_010003"],
                                           [UIImage imageNamed:@"car_front_010004"],
                                           [UIImage imageNamed:@"car_front_010005"],
                                           [UIImage imageNamed:@"car_front_010006"],
                                           [UIImage imageNamed:@"car_front_010007"]];
    
    self.backTyreImageView.animationImages = @[[UIImage imageNamed:@"car_back_010001"],
                                               [UIImage imageNamed:@"car_back_010002"],
                                               [UIImage imageNamed:@"car_back_010003"],
                                               [UIImage imageNamed:@"car_back_010004"],
                                               [UIImage imageNamed:@"car_back_010005"],
                                               [UIImage imageNamed:@"car_back_010006"],
                                               [UIImage imageNamed:@"car_back_010007"],];
    self.backTyreImageView.animationDuration = 0.5;
    self.tyreImageView.animationDuration = 0.5;
    self.airImageView.animationImages = @[[UIImage imageNamed:@"test_020001"],
                                          [UIImage imageNamed:@"test_020002"],
                                          [UIImage imageNamed:@"test_020003"],
                                          [UIImage imageNamed:@"test_020004"],
                                          [UIImage imageNamed:@"test_020005"],
                                          [UIImage imageNamed:@"test_020006"],
                                          [UIImage imageNamed:@"test_020007"],
                                          [UIImage imageNamed:@"test_020008"],
                                          [UIImage imageNamed:@"test_020009"],
                                          [UIImage imageNamed:@"test_020010"],
                                          [UIImage imageNamed:@"test_020011"],];
    [self.superView insertSubview:self.airImageView atIndex:0];
}

- (void)showCarAnimationWithComplete:(animationWithComplete)animationWithComplete{

    
    _animationWithComplete = animationWithComplete;
    
    [self.tyreImageView startAnimating];
    [self.airImageView startAnimating];
    [self.backTyreImageView startAnimating];
    
    
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
    anim.keyPath = @"position";
    anim.values = @[[NSValue valueWithCGPoint:CGPointMake(-100, Scrren_H * 0.3)],
                    [NSValue valueWithCGPoint:CGPointMake(Scrren_CenterX - 25, Scrren_H * 0.4)],
                    [NSValue valueWithCGPoint:CGPointMake(Scrren_CenterX  , Scrren_H * 0.42 )],
                    [NSValue valueWithCGPoint:CGPointMake(Scrren_W + 100, Scrren_H * 0.5)]];
    anim.keyTimes = @[@0, @0.3, @0.7, @1];
    
    anim.duration = 5.0;
    anim.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear],
                             [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn],
                             [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]
                             ];
    anim.fillMode = kCAFillModeForwards;
    anim.removedOnCompletion = NO;
    anim.delegate = self;
    self.anim = anim;
    [self.superView.layer addAnimation:anim forKey:@"position"];
    
    
    [NSTimer scheduledTimerWithTimeInterval:5.0 * 0.7 target:self selector:@selector(test:) userInfo:nil repeats:YES];
    
    

}

- (void)test:(NSTimer *)timer{
    
    UIImageView *imageView = [[UIImageView alloc]init];

    imageView.animationImages = @[
                                  [UIImage imageNamed:@"test_020005"],
                                  [UIImage imageNamed:@"test_020006"],
                                  [UIImage imageNamed:@"test_020007"],
                                  [UIImage imageNamed:@"test_020008"],
                                  [UIImage imageNamed:@"test_020009"],
                                  [UIImage imageNamed:@"test_020010"],
                                  [UIImage imageNamed:@"test_020011"],];
    imageView.animationRepeatCount = 2;
    imageView.animationDuration = 0.5;
    
    [imageView startAnimating];
    imageView.x = Scrren_CenterX - 110;
    imageView.y = Scrren_CenterY - 5;
    imageView.size = CGSizeMake(130, 85);
    
    [self insertSubview:imageView atIndex:0];
    
    [timer invalidate];
    timer = nil;
    
}



- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    !_animationWithComplete ? : _animationWithComplete();
}




@end
