//
//  ViewController.m
//  OperationDemo
//
//  Created by user on 16/8/13.
//  Copyright © 2016年 cc. All rights reserved.
//

#import "ViewController.h"
#import "ZCCarAnimationView.h"
#import "ZCYachtAnimationView.h"
#import "ZCAnimationOperationManager.h"
#import "ZCAnimationOperation.h"
#import "ZCIsletAnimationView.h"
#import "HRRainbowView.h"
@interface ViewController ()

@property (nonatomic, strong) ZCCarAnimationView *carView;


@property (nonatomic, strong)ZCYachtAnimationView *yachtView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    HRRainbowView *view = [[HRRainbowView alloc]init];
    view.frame = CGRectMake(10, 300, 200, 200);
    view.backgroundColor = [UIColor clearColor];
    
    [self.view addSubview:view];
    
}
- (IBAction)showIslet:(id)sender {
    
    
    
    ZCAnimationOperationManager *mgr = [ZCAnimationOperationManager sharedManager];
    
    mgr.animationContentView = self.view;
    
    [mgr addIsletAnim];
    
    
}

- (IBAction)showCar:(id)sender {
    ZCAnimationOperationManager *mgr = [ZCAnimationOperationManager sharedManager];
    mgr.animationContentView = self.view;
    
    [mgr addCarAnim];
    
}
- (IBAction)showYacht:(id)sender {
    ZCAnimationOperationManager *mgr = [ZCAnimationOperationManager sharedManager];
    mgr.animationContentView = self.view;
    [mgr addYachtAnim];
    
}
- (IBAction)showDanMu:(id)sender {
    
    ZCAnimationOperationManager *mgr = [ZCAnimationOperationManager sharedManager];
    
    mgr.animationContentView = self.view;
    
    [mgr addAirplaneAnim];
}

@end
