//
//  HRFireworksAniamtionView.m
//  OperationDemo
//
//  Created by user on 2016/11/10.
//  Copyright © 2016年 cc. All rights reserved.
//

#import "HRFireworksAniamtionView.h"
#import "UIView+Extension.h"

@interface HRFireworksAniamtionView () <CAAnimationDelegate>

@property (strong, nonatomic) IBOutlet UIImageView *leftHeartImageView;

@property (strong, nonatomic) IBOutlet UIImageView *rightHeartImageView;

@property (strong, nonatomic) IBOutlet UIImageView *yellowPath1;
@property (strong, nonatomic) IBOutlet UIImageView *yellowFireworks1;
@property (strong, nonatomic) IBOutlet UIImageView *yellowPath2;
@property (strong, nonatomic) IBOutlet UIImageView *yellowFireworks2;
@property (strong, nonatomic) IBOutlet UIImageView *blueFireworkdsImage;
@property (strong, nonatomic) IBOutlet UIImageView *bluePath;
@property (strong, nonatomic) IBOutlet UIImageView *redPath1;
@property (strong, nonatomic) IBOutlet UIImageView *redFireworks1;
@property (strong, nonatomic) IBOutlet UIImageView *yellowPath3;
@property (strong, nonatomic) IBOutlet UIImageView *yellowFireworks3;
@property (strong, nonatomic) IBOutlet UIImageView *redFireworks2;
@property (strong, nonatomic) IBOutlet UIImageView *redPath2;
@property (strong, nonatomic) IBOutlet UIImageView *greenPath;
@property (strong, nonatomic) IBOutlet UIImageView *greenFireworks;

@property (strong, nonatomic) IBOutlet UIView *contenView;
@property (strong, nonatomic) IBOutlet UILabel *nickNameLabel;

@end


@implementation HRFireworksAniamtionView

- (void)layoutSubviews{
    [super layoutSubviews];
    
    
    self.contenView.size = CGSizeMake(320, 348);
    self.contenView.y = 150;
    self.contenView.x = ([UIScreen mainScreen].bounds.size.width - 320) / 2;
    
    
}


- (void)awakeFromNib{
    [super awakeFromNib];
    
    
    
    self.yellowPath1.transform = CGAffineTransformMakeRotation(M_PI * -0.16);
    
    self.yellowPath3.transform = CGAffineTransformMakeRotation(M_PI * 0.15);
    
    self.redPath2.transform = CGAffineTransformMake(-1.0, 0, 0 , 1.0, 0, 0);
    
    self.yellowPath1.transform = CGAffineTransformMake(-1.0, 0, 0, 1.0, 0, 0);
    
    self.yellowPath1.transform = CGAffineTransformRotate(self.yellowPath1.transform, M_PI * 0.25 );
    
    
    
    NSMutableArray *bluePath = [NSMutableArray array];
    NSMutableArray *redPath = [NSMutableArray array];
    NSMutableArray *yellowPath = [NSMutableArray array];
    NSMutableArray *greenPath = [NSMutableArray array];
    for (int i = 0; i < 12; i++) {
        
        @autoreleasepool {
            NSMutableString *blueImageName = @"x2_000".mutableCopy;
            NSMutableString *redImageName = @"x1_000".mutableCopy;
            NSMutableString *yellowImageName = @"x3_000".mutableCopy;
            NSMutableString *greenImageName = @"x4_000".mutableCopy;
            
            if (i < 10) {
                [blueImageName appendString:[NSString stringWithFormat:@"0%d",i]];
                [redImageName appendString:[NSString stringWithFormat:@"0%d",i]];
                [yellowImageName appendString:[NSString stringWithFormat:@"0%d",i]];
                [greenImageName appendString:[NSString stringWithFormat:@"0%d",i]];
            }else{
                [blueImageName appendString:[NSString stringWithFormat:@"%d",i]];
                [redImageName appendString:[NSString stringWithFormat:@"%d",i]];
                [yellowImageName appendString:[NSString stringWithFormat:@"%d",i]];
                [greenImageName appendString:[NSString stringWithFormat:@"%d",i]];
            }
            
            
            NSString *blueImagePath = [[NSBundle mainBundle] pathForResource:blueImageName ofType:@"png"];
            
            UIImage *blueImage = [UIImage imageWithContentsOfFile:blueImagePath];
            
            
            NSString *redImagePath = [[NSBundle mainBundle] pathForResource:redImageName ofType:@"png"];
            
            UIImage *redImage = [UIImage imageWithContentsOfFile:redImagePath];
            
            NSString *greenImagePath = [[NSBundle mainBundle] pathForResource:greenImageName ofType:@"png"];
            UIImage *greenImage = [UIImage imageWithContentsOfFile:greenImagePath];
            
            NSString *yellowImagePath = [[NSBundle mainBundle] pathForResource:yellowImageName ofType:@"png"];
            UIImage *yellowImage = [UIImage imageWithContentsOfFile:yellowImagePath];
            
            [bluePath addObject:blueImage];
            [redPath addObject:redImage];
            [yellowPath addObject:yellowImage];
            [greenPath addObject:greenImage];
            
        }
    }
    
    
    self.bluePath.animationImages = bluePath;
    
    self.redPath1.animationImages = redPath;
    self.redPath2.animationImages = redPath;
    
    self.yellowPath1.animationImages = yellowPath;
    self.yellowPath2.animationImages = yellowPath;
    self.yellowPath3.animationImages = yellowPath;
    
    self.greenPath.animationImages = greenPath;
    
    [self setupAnimatioImagesWithImageView:self.bluePath images:bluePath];
    [self setupAnimatioImagesWithImageView:self.redPath1 images:redPath];
    [self setupAnimatioImagesWithImageView:self.redPath2 images:redPath];
    [self setupAnimatioImagesWithImageView:self.yellowPath1 images:yellowPath];
    [self setupAnimatioImagesWithImageView:self.yellowPath2 images:yellowPath];
    [self setupAnimatioImagesWithImageView:self.yellowPath3 images:yellowPath];
    [self setupAnimatioImagesWithImageView:self.greenPath images:greenPath];
    
    
    
    NSMutableArray *heaert1 = [NSMutableArray array];
    NSMutableArray *heaert2 = [NSMutableArray array];
    
    for (int i = 0; i < 24; i++) {
        
        @autoreleasepool {
            NSMutableString *heaert1ImageName = @"h1_000".mutableCopy;
            NSMutableString *heaert2ImageName = @"h2_000".mutableCopy;
            
            
            
            if (i < 10) {
                [heaert1ImageName appendString:[NSString stringWithFormat:@"0%d",i]];
                [heaert2ImageName appendString:[NSString stringWithFormat:@"0%d",i]];
            }else{
                [heaert1ImageName appendString:[NSString stringWithFormat:@"%d",i]];
                [heaert2ImageName appendString:[NSString stringWithFormat:@"%d",i]];
            }
            
            NSString *header1ImagePath = [[NSBundle mainBundle] pathForResource:heaert1ImageName ofType:@"png"];
            NSString *header2ImagePath = [[NSBundle mainBundle] pathForResource:heaert2ImageName ofType:@"png"];
            UIImage *heaert1Image = [UIImage imageWithContentsOfFile:header1ImagePath];
            UIImage *heaert2Image = [UIImage imageWithContentsOfFile:header2ImagePath];
            
            [heaert1 addObject:heaert1Image];
            [heaert2 addObject:heaert2Image];
        }
        
        
        
    }
    [self setupAnimatioImagesWithHeartImageView:self.leftHeartImageView images:heaert1];
    [self setupAnimatioImagesWithHeartImageView:self.rightHeartImageView images:heaert2];
    
    
}


//- (void)setGiftModel:(HRUserGiftModel *)giftModel{
//    _giftModel = giftModel;
//    
//    NSString *giftName = [HRGiftsManager selectSettingsGiftModelWithGiftId:giftModel.giftId].name;
//    self.nickNameLabel.attributedText = [NSMutableAttributedString setupAnimationViewTitleWith:[NSString stringWithFormat:@"%@%@%@",giftModel.nickName, LGLocalizedString(@"HRGIftShowView-sendOne-1", nil), giftName]];
//}

- (instancetype)init{
    if (self = [super init]) {
        
        self = [[NSBundle mainBundle] loadNibNamed:@"HRFireworksAniamtionView" owner:nil options:nil].lastObject;
    }
    return self;
}

- (void)showAnimationWithComplete:(animationWithComplete)animationWithComplete{
    _animationWithComplete = animationWithComplete;
    
    [self.redPath1 setHidden:YES];
    [self.bluePath setHidden:YES];
    [self.redPath2 setHidden:YES];
    [self.yellowPath1 startAnimating];
    [self.yellowPath2 startAnimating];
    [self.yellowPath3 startAnimating];
    
    [self.greenPath startAnimating];
    
    __weak typeof(self) weakSelf = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [weakSelf.redPath1 setHidden:NO];
        [weakSelf.bluePath setHidden:NO];
        [weakSelf.redPath2 setHidden:NO];
        [weakSelf.redPath1 startAnimating];
        [weakSelf.bluePath startAnimating];
        [weakSelf.redPath2 startAnimating];
    });
    
    [self setupAimationWith:self.yellowFireworks1];
    [self setupAimationWith:self.yellowFireworks2];
    [self setupAimationWith:self.yellowFireworks3];
    [self setupAimationWith:self.blueFireworkdsImage];
    [self setupAimationWith:self.redFireworks1];
    [self setupAimationWith:self.redFireworks2];
    [self setupAimationWith:self.greenFireworks];
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        weakSelf.leftHeartImageView.hidden = NO;
        weakSelf.rightHeartImageView.hidden = NO;
        [weakSelf.leftHeartImageView startAnimating];
        [weakSelf.rightHeartImageView startAnimating];
        [weakSelf setupAimationHeartWith:self.leftHeartImageView];
        [weakSelf setupAimationHeartWith:self.rightHeartImageView];
        
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.8 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [weakSelf.leftHeartImageView removeFromSuperview];
            [weakSelf.rightHeartImageView removeFromSuperview];
            !_animationWithComplete ? : _animationWithComplete();
        });
        
    });
    
    
    [self setupAlphaAnimatinWith:self.yellowPath1];
    [self setupAlphaAnimatinWith:self.yellowPath2];
    [self setupAlphaAnimatinWith:self.yellowPath3];
    [self setupAlphaAnimatinWith:self.redPath1];
    [self setupAlphaAnimatinWith:self.redPath2];
    [self setupAlphaAnimatinWith:self.bluePath];
    [self setupAlphaAnimatinWith:self.greenPath];
    
    [self setupAlphaAnimatinWith:self.yellowFireworks1];
    [self setupAlphaAnimatinWith:self.yellowFireworks2];
    [self setupAlphaAnimatinWith:self.yellowFireworks3];
    [self setupAlphaAnimatinWith:self.redFireworks1];
    [self setupAlphaAnimatinWith:self.redFireworks2];
    [self setupAlphaAnimatinWith:self.blueFireworkdsImage];
    [self setupAlphaAnimatinWith:self.greenFireworks];
    
}

- (void)stopAnimation{
    [self.bluePath stopAnimating];
    
    [self.redPath1 stopAnimating];
    [self.redPath2 stopAnimating];
    
    [self.yellowPath1 stopAnimating];
    [self.yellowPath2 stopAnimating];
    [self.yellowPath3 stopAnimating];
    
    [self.greenPath stopAnimating];
}




- (void)setupAimationHeartWith:(UIImageView *)roseImageView {
    
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"transform.scale";
    animation.duration = 3.5;
    animation.removedOnCompletion = NO;
    animation.keyTimes = @[@0,
                           @1];
    animation.values = @[@1, @1.3];
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    //    animation.beginTime = CACurrentMediaTime() + 0.7;
    [roseImageView.layer addAnimation:animation forKey:@""];
    
    
    
    CABasicAnimation *alphaAnimation = [CABasicAnimation animation];
    alphaAnimation.keyPath = @"opacity";
    alphaAnimation.duration = 1.5;
    alphaAnimation.removedOnCompletion = NO;
    alphaAnimation.fromValue = @1.0;
    alphaAnimation.toValue = @0.0;
    alphaAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    alphaAnimation.beginTime = CACurrentMediaTime() + 2.0;
    //    alphaAnimation.delegate = self;
    [roseImageView.layer addAnimation:alphaAnimation forKey:@""];
    
    
}

- (void)setupAimationWith:(UIImageView *)roseImageView {
    
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"transform.scale";
    animation.duration = 4.2;
    animation.removedOnCompletion = NO;
    animation.keyTimes = @[@0,
                           @0.05,
                           @0.1,
                           @1];
    animation.values = @[@0,@0 , @1, @1.5];
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    //    animation.beginTime = CACurrentMediaTime() + 0.7;
    [roseImageView.layer addAnimation:animation forKey:@""];
    
}


- (void)setupAlphaAnimatinWith:(UIView *)view{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"opacity";
    animation.duration = 1.6;
    animation.removedOnCompletion = NO;
    animation.keyTimes = @[@0, @0.6, @1];
    animation.values = @[@1, @0, @0];
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    animation.beginTime = CACurrentMediaTime() + 0.7 + 2.5;
    [view.layer addAnimation:animation forKey:@""];
}


- (void)setupAnimatioImagesWithImageView:(UIImageView *)imageView images:(NSArray *)images {
    imageView.animationImages = images;
    imageView.animationDuration = 0.7;
    imageView.animationRepeatCount = 1;
}

- (void)setupAnimatioImagesWithHeartImageView:(UIImageView *)imageView images:(NSArray *)images {
    
    imageView.hidden = YES;
    
    imageView.animationImages = images;
    imageView.animationDuration = 1.5;
    imageView.animationRepeatCount = 1;
}


@end
