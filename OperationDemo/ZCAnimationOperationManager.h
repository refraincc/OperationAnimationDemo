//
//  ZCAnimationOperationManager.h
//  OperationDemo
//
//  Created by user on 16/8/13.
//  Copyright © 2016年 cc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface ZCAnimationOperationManager : NSObject

@property (nonatomic, strong)UIView *animationContentView;

@property (nonatomic, strong)NSMutableArray *giftsQueueArray;

+ (instancetype)sharedManager;


- (void)addCarAnim;

- (void)addYachtAnim;



- (void)addAirplaneAnim;


- (void)addIsletAnim;


- (void)addyanhua;


- (void)addRose;
@end
