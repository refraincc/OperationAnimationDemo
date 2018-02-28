//
//  ZCAnimationOperationManager.m
//  OperationDemo
//
//  Created by user on 16/8/13.
//  Copyright © 2016年 cc. All rights reserved.
//

#import "ZCAnimationOperationManager.h"
#import "ZCAnimationOperation.h"
@interface ZCAnimationOperationManager ()

@property (nonatomic, strong) NSOperationQueue *giftQueue;


@end


@implementation ZCAnimationOperationManager

- (NSOperationQueue *)giftQueue{
    if (!_giftQueue) {
        _giftQueue = [[NSOperationQueue alloc]init];
        _giftQueue.maxConcurrentOperationCount = 1;
    }
    return _giftQueue;
}

+ (instancetype)sharedManager{
    
    static ZCAnimationOperationManager *manager;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[ZCAnimationOperationManager alloc]init];
        manager.giftsQueueArray = [NSMutableArray array];
    });
    
    return manager;
}

- (void)addCarAnim{
    ZCAnimationOperation *op = [ZCAnimationOperation animOperationWithContentView:self.animationContentView];
    op.animContentView = self.animationContentView;
    
    op.animationType = ZCAnimationTypeCar;
    [self.giftQueue addOperation:op];
}

- (void)addYachtAnim{
    
    ZCAnimationOperation *op = [ZCAnimationOperation animOperationWithContentView:self.animationContentView];
    op.animContentView = self.animationContentView;
    
    op.animationType = ZCAnimationTypeYacht;
    [self.giftQueue addOperation:op];
}

- (void)addAirplaneAnim{
    
    ZCAnimationOperation *op = [ZCAnimationOperation animOperationWithContentView:self.animationContentView];
    op.animContentView = self.animationContentView;
    op.animationType = ZCAnimationTypeAirplane;
    [self.giftQueue addOperation:op];
}

- (void)addyanhua{
    
    ZCAnimationOperation *op = [ZCAnimationOperation animOperationWithContentView:self.animationContentView];
    op.animContentView = self.animationContentView;
    op.animationType = ZCAnimationTypeFire;
    [self.giftQueue addOperation:op];
}
- (void)addIsletAnim{
    
    ZCAnimationOperation *op = [ZCAnimationOperation animOperationWithContentView:self.animationContentView];
    op.animContentView = self.animationContentView;
    op.animationType = ZCAnimationTypeIslet;
    [self.giftQueue addOperation:op];
}

- (void)addRose{
    
    ZCAnimationOperation *op = [ZCAnimationOperation animOperationWithContentView:self.animationContentView];
    op.animContentView = self.animationContentView;
    op.animationType = ZCAnimationTypeRose;
    [self.giftQueue addOperation:op];
}

@end
