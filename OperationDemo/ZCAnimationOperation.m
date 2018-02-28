//
//  ZCOperation.m
//  OperationDemo
//
//  Created by user on 16/8/13.
//  Copyright © 2016年 cc. All rights reserved.
//

#import "ZCAnimationOperation.h"
#import "ZCAnimationOperationManager.h"

#define Scrren_H  [UIScreen mainScreen].bounds.size.height
#define Scrren_W  [UIScreen mainScreen].bounds.size.width
#define Scrren_CenterX  Scrren_W / 2
#define Scrren_CenterY  Scrren_H / 2
@interface ZCAnimationOperation ()

@property (nonatomic, getter = isFinished)  BOOL finished;
@property (nonatomic, getter = isExecuting) BOOL executing;
@end

@implementation ZCAnimationOperation


@synthesize finished = _finished;
@synthesize executing = _executing;


+ (instancetype)animOperationWithContentView:(UIView *)contentView{
    ZCAnimationOperation *op = [[ZCAnimationOperation alloc] init];
    
    op.carView = [ZCCarAnimationView carAnimationView];
    op.carView.frame = op.animContentView.bounds;
    
    op.yachtView = [ZCYachtAnimationView yachtAnimationView];
    op.yachtView.frame = op.animContentView.bounds;
    
    
    op.airplaneView = [ZCAirplaneAnimationView airplaneAnimationView];
    op.airplaneView.frame = op.animContentView.bounds;
    
    
    op.isletAnimationView = [HRIsletAnimationView isletAniumationView];
    op.isletAnimationView.frame = op.animContentView.bounds;
    
    
    op.fireworkAnimationView = [[NSBundle mainBundle] loadNibNamed:@"HRFireworksAniamtionView" owner:nil options:nil].lastObject;
    op.fireworkAnimationView.frame = op.animContentView.bounds;
    
    
    op.roseAnimationView = [[HRRoseAnimationView alloc]init];
    op.roseAnimationView.frame = op.animContentView.bounds;
    
    return op;
}

- (void)start{
    if (self.isCancelled) {
        
        self.finished = YES;
        return;
    }
    self.executing = YES;
    
    ZCAnimationOperationManager *mgr = [ZCAnimationOperationManager sharedManager];
    
    [mgr.giftsQueueArray addObject:self];
    
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        
        ZCAnimationOperationManager *mgr = [ZCAnimationOperationManager sharedManager];
        
        
        if (self.animationType == ZCAnimationTypeCar) {
            
            [self.animContentView addSubview:self.carView];
            
            [self.carView showCarAnimationWithComplete:^{
                self.finished = YES;
                [self.carView removeFromSuperview];
                [mgr.giftsQueueArray removeObject:self];
                
            }];
        }else if (self.animationType == ZCAnimationTypeYacht){
            
            [self.animContentView addSubview:self.yachtView];
            
            [self.yachtView showAnimationWithComplete:^{
                self.finished = YES;
                [self.yachtView removeFromSuperview];
                [mgr.giftsQueueArray removeObject:self];
            }];
        }else if (self.animationType == ZCAnimationTypeAirplane){
            
            
            [self.animContentView addSubview:self.airplaneView];
            
            [self.airplaneView showAnimationWithComplete:^{
                self.finished = YES;
                
                [self.airplaneView removeFromSuperview];
                
                [mgr.giftsQueueArray removeObject:self];
            }];
            
        }else if (self.animationType == ZCAnimationTypeIslet){
            [self.animContentView addSubview:self.isletAnimationView];
            
            [self.isletAnimationView showAnimationWithComplete:^{
                self.finished = YES;
                
                [self.isletAnimationView removeFromSuperview];
                
                [mgr.giftsQueueArray removeObject:self];
            }];
            

        }else if (self.animationType == ZCAnimationTypeFire){
            
            
            [self.animContentView addSubview:self.fireworkAnimationView];
            
            [self.fireworkAnimationView showAnimationWithComplete:^{
                self.finished = YES;
                
                [self.fireworkAnimationView removeFromSuperview];
                
                [mgr.giftsQueueArray removeObject:self];
            }];
            
            
            
        }else if (self.animationType == ZCAnimationTypeRose){
            
            
            [self.animContentView addSubview:self.roseAnimationView];
            
            [self.roseAnimationView showAnimationWithComplete:^{
                self.finished = YES;
                
                [self.roseAnimationView removeFromSuperview];
                
                [mgr.giftsQueueArray removeObject:self];
            }];
            
            
            
        }
    }];
}

#pragma mark -  手动触发 KVO
- (void)setExecuting:(BOOL)executing
{
    [self willChangeValueForKey:@"isExecuting"];
    _executing = executing;
    [self didChangeValueForKey:@"isExecuting"];
}

- (void)setFinished:(BOOL)finished
{
    [self willChangeValueForKey:@"isFinished"];
    _finished = finished;
    [self didChangeValueForKey:@"isFinished"];
}


@end
