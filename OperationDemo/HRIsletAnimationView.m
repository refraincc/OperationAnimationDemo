//
//  HRIsletAnimationView.m
//  OperationDemo
//
//  Created by user on 16/8/24.
//  Copyright © 2016年 cc. All rights reserved.
//

#import "HRIsletAnimationView.h"
//#import "HRUserGiftModel.h"
#define Scrren_H  [UIScreen mainScreen].bounds.size.height
#define Scrren_W  [UIScreen mainScreen].bounds.size.width
#define Scrren_CenterX  Scrren_W / 2
#define Scrren_CenterY  Scrren_H / 2

#define WS(weakSelf) __weak __typeof(&*self)weakSelf = self;
@interface HRIsletAnimationView ()<CAAnimationDelegate>

@property (strong, nonatomic) IBOutlet UILabel *nickNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *sunshine;

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
@property (weak, nonatomic) IBOutlet UIView *rainbowView;

@end

@implementation HRIsletAnimationView

+ (HRIsletAnimationView *)isletAniumationView{
    return [[NSBundle mainBundle] loadNibNamed:@"HRIsletAnimationView" owner:nil options:nil].lastObject;
}


- (void)awakeFromNib{
    
    [super awakeFromNib];
    NSMutableArray *images = [NSMutableArray array];
    for (int i = 1; i < 25; i++) {
        @autoreleasepool {
            NSString  *str = @"";
            if (i < 10) {
                str = @"01000";
            }else{
                str = @"0100";
            }
            NSString *imageName = [NSString stringWithFormat:@"%@%d",str,i];
            NSString *imagePath = [[NSBundle mainBundle] pathForResource:imageName ofType:@"png"];
            UIImage *image = [UIImage imageWithContentsOfFile:imagePath];
            [images addObject:image];
        }
    }
    self.water1.animationImages = images;
    self.water2.animationImages = images;
    self.water3.animationImages = images;
    self.water4.animationImages = images;
    self.water5.animationImages = images;
    self.water6.animationImages = images;
    
}

//- (void)setGiftModel:(HRUserGiftModel *)giftModel{
//    _giftModel = giftModel;
//
//    NSString *giftName = [HRGiftsManager selectSettingsGiftModelWithGiftId:giftModel.giftId].name;
//    self.nickNameLabel.attributedText = [NSMutableAttributedString setupAnimationViewTitleWith:[NSString stringWithFormat:@"%@%@%@",giftModel.nickName, LGLocalizedString(@"HRGIftShowView-sendOne-1", nil), giftName]];
//}


- (void)showAnimationWithComplete:(animationWithComplete)animationWithComplete{
    _animationWithComplete = animationWithComplete;
    
    WS(weakSelf);
    //瀑布动画
    [self.water1 startAnimating];
    [self.water2 startAnimating];
    [self.water3 startAnimating];
    [self.water4 startAnimating];
    [self.water5 startAnimating];
    [self.water6 startAnimating];
    
    
    //透明
    self.contenView.alpha = 0.3;
    [UIView animateWithDuration:1.0 animations:^{
        weakSelf.contenView.alpha = 1.0;
    }];
    
    
    //海岛整体位移
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
    
    [self.contenView.layer addAnimation:anim forKey:@"position"];
 
    //树动画
    [self setupTreeKeyframeAnimationWithRotation:8
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
    
    //彩虹动画
    [self setupRainbowAnimation];
    
    
}

- (void)setupRainbowAnimation{
    WS(weakSelf);
    
    CGFloat height  = 130;
    CGFloat width  = 240;
    CGFloat y = -10;
    NSArray *aray = [self rainBowColors];
    CGFloat j = 0;
    CGFloat margin = 10;
    for (int i = 0; i < 36; i += 1) {
        
        if (i < 5) {
            continue;
        }
        @autoreleasepool {
            CAShapeLayer *layer = [[CAShapeLayer alloc]init];
            
            layer.frame = CGRectMake(0, 0, width, height);
            UIBezierPath *path = [UIBezierPath bezierPath];
            [path moveToPoint:CGPointMake(margin + j, height - margin)];
            [path addCurveToPoint:CGPointMake(width - margin - j, height - margin) controlPoint1:CGPointMake(20, y + j) controlPoint2:CGPointMake(width - 20, y + j)];
            
            UIColor *color = aray[i];
            
            layer.strokeColor   = [color colorWithAlphaComponent:0.2].CGColor;   // 边缘线的颜色
            layer.fillColor     = [UIColor clearColor].CGColor;   // 闭环填充的颜色
            layer.lineWidth = 0.5;
            layer.lineCap       = kCALineCapRound;               // 边缘线的类型
            layer.path          = path.CGPath;
            layer.shadowRadius = 2;
            layer.shadowOffset = CGSizeMake(0, -0.5);
            layer.shadowColor = color.CGColor;
            layer.shadowOpacity = 0.5;
            
            CABasicAnimation *pathAnima = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
            pathAnima.duration = 4.0f;
            pathAnima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
            pathAnima.fromValue = [NSNumber numberWithFloat:0.0f];
            pathAnima.toValue = [NSNumber numberWithFloat:1.0f];
            pathAnima.fillMode = kCAFillModeForwards;
            pathAnima.removedOnCompletion = NO;
            [layer addAnimation:pathAnima forKey:@"strokeEndAnimation"];
            
            
            
            [self.rainbowView.layer addSublayer:layer];
        }
        j += 0.5;
    }
    
    self.sunshine.layer.anchorPoint = CGPointMake(0, 0);
    
    [UIView animateWithDuration:5.0 animations:^{
        
        weakSelf.sunshine.transform = CGAffineTransformMakeRotation(-M_PI / 180 * 10);
    }];
    
}

- (NSArray *)rainBowColors{
    NSMutableArray *aray = [NSMutableArray array];
    for (int hue = 0; hue <= 360; hue += 5) {
        @autoreleasepool {
            UIColor *color = [UIColor colorWithHue:1.0 * hue / 360.0 saturation:1.0 brightness:1.0 alpha:0.1];
            [aray addObject:color];
        }
    }
    return aray.copy;
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
    tree1.delegate = self;
    [view.layer addAnimation:tree1 forKey:@"transform.rotation.z"];
}


- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    !_animationWithComplete ? : _animationWithComplete();
}

- (void)dealloc{
    NSLog(@"%s",__func__);
}

@end
