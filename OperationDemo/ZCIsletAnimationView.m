//
//  HRIsletAnimationView.m
//  OperationDemo
//
//  Created by user on 16/8/24.
//  Copyright © 2016年 cc. All rights reserved.
//

#import "ZCIsletAnimationView.h"
#import "UIView+Extension.h"
#define Scrren_H  [UIScreen mainScreen].bounds.size.height
#define Scrren_W  [UIScreen mainScreen].bounds.size.width
#define Scrren_CenterX  Scrren_W / 2
#define Scrren_CenterY  Scrren_H / 2
@interface ZCIsletAnimationView ()


@property (weak, nonatomic) IBOutlet UIView *contenView;

@property (strong, nonatomic) IBOutlet UIImageView *tree1;
@property (strong, nonatomic) IBOutlet UIImageView *tree2;
@property (strong, nonatomic) IBOutlet UIImageView *tree3;
@property (strong, nonatomic) IBOutlet UIImageView *tree4;
@property (strong, nonatomic) IBOutlet UIImageView *water1;
@property (strong, nonatomic) IBOutlet UIImageView *water2;
@property (strong, nonatomic) IBOutlet UIImageView *water3;
@property (strong, nonatomic) IBOutlet UIImageView *water4;
@property (strong, nonatomic) IBOutlet UIImageView *water5;
@property (strong, nonatomic) IBOutlet UIImageView *water6;
@property (strong, nonatomic) IBOutlet UIImageView *islet;

@end

@implementation ZCIsletAnimationView
+ (ZCIsletAnimationView *)isletAniumationView{
    return [[NSBundle mainBundle] loadNibNamed:@"ZCIsletAnimationView" owner:nil options:nil].lastObject;
}

- (void)awakeFromNib{
    NSMutableArray *images = [NSMutableArray array];
    for (int i = 1; i < 25; i++) {
        NSString  *str;
        
        if (i < 10) {
            str = @"01000";
        }else{
            str = @"0100";
        }
        NSString *imageName = [NSString stringWithFormat:@"%@%d",str,i];
        UIImage *image = [UIImage imageNamed:imageName];
        [images addObject:image];
    }
    
    self.water1.animationImages = images;
    self.water2.animationImages = images;
    self.water3.animationImages = images;
    self.water4.animationImages = images;
    self.water5.animationImages = images;
    self.water6.animationImages = images;
    
}


- (void)showAnimationWithComplete:(animationWithComplete)animationWithComplete{
    _animationWithComplete = animationWithComplete;
    
    
    
    [self.water1 startAnimating];
    [self.water2 startAnimating];
    [self.water3 startAnimating];
    [self.water4 startAnimating];
    [self.water5 startAnimating];
    [self.water6 startAnimating];
    
    
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
    anim.keyPath = @"position";
    anim.values = @[[NSValue valueWithCGPoint:CGPointMake(Scrren_CenterX, Scrren_H )],
                    [NSValue valueWithCGPoint:CGPointMake(Scrren_CenterX, Scrren_H  * 0.55)],
                    [NSValue valueWithCGPoint:CGPointMake(Scrren_CenterX, Scrren_H  * 0.6)],
                    [NSValue valueWithCGPoint:CGPointMake(Scrren_CenterX, Scrren_H  * 0.55)],
                    [NSValue valueWithCGPoint:CGPointMake(Scrren_CenterX, Scrren_H  * 0.6)],
                    [NSValue valueWithCGPoint:CGPointMake(Scrren_CenterX, Scrren_H  * 0.55)]];
    anim.keyTimes = @[@0, @0.16, @0.32, @0.48, @0.64, @0.76 ,@1];
    
    anim.duration = 5.0;
    anim.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
    
    anim.fillMode = kCAFillModeForwards;
    anim.removedOnCompletion = NO;
    anim.delegate = self;
    [self.contenView.layer addAnimation:anim forKey:@"position"];
    
    self.contenView.alpha = 0.3;
    [UIView animateWithDuration:1.0 animations:^{
        self.contenView.alpha = 1.0;
    }];
    
    [self setupTreeKeyframeAnimationWithRotation:5
                                        keyTimes:@[@0,@0.1,@0.2,@0.3,@0.4,@0.5,@0.6,@0.7,@0.8,@0.9,@1]
                                            view:self.tree1];
    
    
    [self setupTreeKeyframeAnimationWithRotation:10
                                        keyTimes:@[@0, @0.16, @0.32, @0.48, @0.64, @0.76 ,@1]
                                            view:self.tree2];
    
    
    [self setupTreeKeyframeAnimationWithRotation:5
                                        keyTimes:@[@0,@0.1,@0.2,@0.3,@0.4,@0.5,@0.6,@0.7,@0.8,@0.9,@1]
                                            view:self.tree3];
    
    [self setupTreeKeyframeAnimationWithRotation:3
                                        keyTimes:@[@0,@0.1,@0.2,@0.3,@0.4,@0.5,@0.6,@0.7,@0.8,@0.9,@1]
                                            view:self.tree4];
    
    
}

- (void)setupTreeKeyframeAnimationWithRotation:(NSInteger)rota keyTimes:(NSArray *)keyTimes  view:(UIView *)view{
    
    NSNumber *rotation = [NSNumber numberWithFloat:M_PI / 180 * rota];
    
    
    NSMutableArray *valuse = [NSMutableArray array];
    
    for (int i = 0; i < keyTimes.count; i++) {
        if (i % 2 == 1) {
            [valuse addObject:@0];
        }else{
            [valuse addObject:rotation];
        }
    }
    CAKeyframeAnimation *tree1 = [CAKeyframeAnimation animation];
    tree1.keyPath = @"transform.rotation.z";
    tree1.values = valuse.copy;
    tree1.keyTimes = keyTimes;
    tree1.duration = 5.0;
    [view.layer addAnimation:tree1 forKey:@"transform.rotation.z"];
}


- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    !_animationWithComplete ? : _animationWithComplete();
}



@end
