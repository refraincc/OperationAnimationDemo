//
//  HRRoseView.m
//  OperationDemo
//
//  Created by user on 2016/11/3.
//  Copyright © 2016年 cc. All rights reserved.
//

#import "HRRoseView.h"
#import "UIView+Extension.h"
#define Scrren_H  [UIScreen mainScreen].bounds.size.height
#define Scrren_W  [UIScreen mainScreen].bounds.size.width
#define Scrren_CenterX  Scrren_W / 2
#define Scrren_CenterY  Scrren_H / 2
@interface HRRoseView () <CAAnimationDelegate>


@property (strong, nonatomic) IBOutlet UIImageView *rose1;
@property (strong, nonatomic) IBOutlet UIImageView *rose2;
@property (strong, nonatomic) IBOutlet UIImageView *rose3;
@property (strong, nonatomic) IBOutlet UIImageView *rose4;
@property (strong, nonatomic) IBOutlet UIImageView *rose5;
@property (strong, nonatomic) IBOutlet UIImageView *rose6;
@property (strong, nonatomic) IBOutlet UIImageView *rose7;
@property (strong, nonatomic) IBOutlet UIImageView *rose8;
@property (strong, nonatomic) IBOutlet UIImageView *rose9;
@property (strong, nonatomic) IBOutlet UIImageView *rose10;
@property (strong, nonatomic) IBOutlet UIImageView *rose11;
@property (strong, nonatomic) IBOutlet UIImageView *rose12;
@property (strong, nonatomic) IBOutlet UIImageView *rose13;
@property (strong, nonatomic) IBOutlet UIImageView *rose14;
@property (strong, nonatomic) IBOutlet UIImageView *rose15;
@property (strong, nonatomic) IBOutlet UIImageView *rose16;
@property (strong, nonatomic) IBOutlet UIImageView *rose17;
@property (strong, nonatomic) IBOutlet UIImageView *rose18;
@property (strong, nonatomic) IBOutlet UIImageView *rose19;
@property (strong, nonatomic) IBOutlet UIImageView *rose20;
@property (strong, nonatomic) IBOutlet UIImageView *rose21;
@property (strong, nonatomic) IBOutlet UIImageView *rose22;
@property (strong, nonatomic) IBOutlet UIImageView *rose23;
@property (strong, nonatomic) IBOutlet UIImageView *rose24;
@property (strong, nonatomic) IBOutlet UIImageView *rose25;


@end




@implementation HRRoseView



- (void)setFrame:(CGRect)frame{
    CGRect newFrame = frame;
    newFrame.size = CGSizeMake(310, 310);
    newFrame.origin = CGPointMake(20, 100);
    [super setFrame:newFrame];
}

- (void)setCenter:(CGPoint)center{
    CGPoint newCenter = center;
    newCenter.x = Scrren_W / 2;
    newCenter.y = Scrren_H / 2;
    [super setCenter:newCenter];
}

- (instancetype)init{
    if (self = [super init]) {
        
        self = [[NSBundle mainBundle] loadNibNamed:@"HRRoseView" owner:nil options:nil].lastObject;
        
    }
    return self;
}

- (void)awakeFromNib{
    [super awakeFromNib];
    
    self.rose1.transform = CGAffineTransformMakeRotation(M_PI * 0.16);
    self.rose2.transform = CGAffineTransformMakeRotation(M_PI * 0.18);
    
    self.rose3.transform = CGAffineTransformMakeRotation(M_PI * 0.15);
    self.rose6.transform = CGAffineTransformMakeRotation(M_PI * -0.2);
    self.rose7.transform = CGAffineTransformMakeRotation(M_PI * -0.3);
    self.rose8.transform = CGAffineTransformMakeRotation(M_PI * -0.31);
    self.rose9.transform = CGAffineTransformMakeRotation(M_PI * -0.36);
    self.rose10.transform = CGAffineTransformMakeRotation(M_PI * -0.41);
    self.rose11.transform = CGAffineTransformMakeRotation(M_PI * -0.51);
    self.rose12.transform = CGAffineTransformMakeRotation(M_PI * -0.65);
    self.rose13.transform = CGAffineTransformMakeRotation(M_PI * -0.65);
    self.rose14.transform = CGAffineTransformMakeRotation(M_PI * -0.90);
    self.rose15.transform = CGAffineTransformMakeRotation(M_PI * -0.95);
    self.rose16.transform = CGAffineTransformMakeRotation(M_PI * -1.1);
    self.rose17.transform = CGAffineTransformMakeRotation(M_PI * -1.2);
    self.rose18.transform = CGAffineTransformMakeRotation(M_PI * -1.2);
    self.rose19.transform = CGAffineTransformMakeRotation(M_PI * -1.3);
    self.rose20.transform = CGAffineTransformMakeRotation(M_PI * -1.3);
    self.rose21.transform = CGAffineTransformMakeRotation(M_PI * -1.5);
    self.rose22.transform = CGAffineTransformMakeRotation(M_PI * -1.6);
    self.rose23.transform = CGAffineTransformMakeRotation(M_PI * -1.7);
    self.rose24.transform = CGAffineTransformMakeRotation(M_PI * -1.8);
    self.rose25.transform = CGAffineTransformMakeRotation(M_PI * -1.85);
    
    
    for (UIView *view in self.subviews) {
        view.alpha = 0;
    }
    
    
}


- (void)startAnimation{
    
    [self setupAimationWith:self.rose1 beginTime:0];
    [self setupAimationWith:self.rose2 beginTime:0.05];
    [self setupAimationWith:self.rose25 beginTime:0.05];
    [self setupAimationWith:self.rose3 beginTime:0.1];
    [self setupAimationWith:self.rose24 beginTime:0.1];
    [self setupAimationWith:self.rose4 beginTime:0.15];
    [self setupAimationWith:self.rose23 beginTime:0.15];
    [self setupAimationWith:self.rose5 beginTime:0.2];
    [self setupAimationWith:self.rose22 beginTime:0.2];
    [self setupAimationWith:self.rose6 beginTime:0.25];
    [self setupAimationWith:self.rose21 beginTime:0.25];
    [self setupAimationWith:self.rose7 beginTime:0.3];
    [self setupAimationWith:self.rose20 beginTime:0.3];
    [self setupAimationWith:self.rose8 beginTime:0.35];
    [self setupAimationWith:self.rose19 beginTime:0.35];
    [self setupAimationWith:self.rose9 beginTime:0.4];
    [self setupAimationWith:self.rose18 beginTime:0.4];
    [self setupAimationWith:self.rose10 beginTime:0.45];
    [self setupAimationWith:self.rose17 beginTime:0.45];
    [self setupAimationWith:self.rose11 beginTime:0.5];
    [self setupAimationWith:self.rose16 beginTime:0.5];
    [self setupAimationWith:self.rose12 beginTime:0.55];
    [self setupAimationWith:self.rose15 beginTime:0.55];
    [self setupAimationWith:self.rose13 beginTime:0.6];
    [self setupAimationWith:self.rose14 beginTime:0.6];
    
    
    
    
}

- (void)setupAimationWith:(UIImageView *)roseImageView beginTime:(CFTimeInterval)beginTime{
    
    
    CFTimeInterval duration = 0.5 + 0.5 + beginTime + beginTime + 1.8;
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"opacity";
    animation.duration = duration;
    animation.removedOnCompletion = NO;
    animation.keyTimes = @[@0,
                           @(beginTime / duration),
                           @((0.5 + beginTime)/ duration),
                           @((2 * beginTime + 0.5 + 1.8) / duration),
                           @1];
    animation.values = @[@0, @0, @1, @1, @0];
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.beginTime = CACurrentMediaTime() + beginTime;
    [roseImageView.layer addAnimation:animation forKey:@""];
    
}


@end
