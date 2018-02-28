//
//  ZCOperation.h
//  OperationDemo
//
//  Created by user on 16/8/13.
//  Copyright © 2016年 cc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ZCCarAnimationView.h"
#import "ZCYachtAnimationView.h"
#import "ZCDanMuView.h"
#import "ZCAirplaneAnimationView.h"
#import "HRIsletAnimationView.h"
#import "HRFireworksAniamtionView.h"
#import "HRRoseAnimationView.h"
typedef NS_ENUM(NSInteger, ZCAnimationType){
    ZCAnimationTypeCar,
    ZCAnimationTypeYacht,
    ZCAnimationTypeTail,
    ZCAnimationTypeAirplane,
    ZCAnimationTypeIslet,
    ZCAnimationTypeFire,
    ZCAnimationTypeRose,
};


@interface ZCAnimationOperation : NSOperation

@property (nonatomic, strong)UIView *animContentView;

@property (nonatomic, strong)ZCCarAnimationView *carView;

@property (nonatomic, strong)ZCYachtAnimationView *yachtView;

@property (nonatomic, strong)ZCAirplaneAnimationView *airplaneView;

@property (nonatomic, strong)HRIsletAnimationView *isletAnimationView;

@property (nonatomic, strong)HRFireworksAniamtionView *fireworkAnimationView;

@property (nonatomic, strong)HRRoseAnimationView *roseAnimationView;


@property (nonatomic, assign)ZCAnimationType animationType;


+ (instancetype)animOperationWithContentView:(UIView *)contentView;

@end
