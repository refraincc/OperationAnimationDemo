//
//  ZCDanMuView.m
//  OperationDemo
//
//  Created by user on 16/8/16.
//  Copyright © 2016年 cc. All rights reserved.
//

#import "ZCDanMuView.h"
#import "UIView+Extension.h"
#define Scrren_H  [UIScreen mainScreen].bounds.size.height
#define Scrren_W  [UIScreen mainScreen].bounds.size.width
#define Scrren_CenterX  Scrren_W / 2
#define Scrren_CenterY  Scrren_H / 2

@interface ZCDanMuView ()
@property (weak, nonatomic) IBOutlet UIImageView *headerImageView;
@property (weak, nonatomic) IBOutlet UILabel *desLabel;
@property (weak, nonatomic) IBOutlet UILabel *nickNameLabel;

@end

@implementation ZCDanMuView


+ (ZCDanMuView *)danMuView{
    return [[NSBundle mainBundle]loadNibNamed:@"ZCDanMuView" owner:nil options:nil].lastObject;
}



- (void)showAnimationWithComplete:(AnimationComplete)AnimationComplete{
    _AnimationComplete = AnimationComplete;
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position.x";
    animation.values = @[@(Scrren_W +self.width / 2 + 20), @(-self.width)];
    animation.duration = arc4random() % 5 + 5;
    animation.delegate = self;
    [self.layer addAnimation:animation forKey:@"position.x"];
    
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    !_AnimationComplete ? : _AnimationComplete();
}







@end
