//
//  HRRainbowView.m
//  OperationDemo
//
//  Created by user on 16/9/2.
//  Copyright © 2016年 cc. All rights reserved.
//

#import "HRRainbowView.h"

@implementation HRRainbowView


- (void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    
    [path addArcWithCenter:CGPointMake(rect.size.width / 2, rect.size.height - 2 + 30) radius:rect.size.height /2  startAngle:0 endAngle:180 clockwise:YES];
    
    path.lineWidth = 2;
    
    UIColor *color = [[UIColor redColor] colorWithAlphaComponent:0.2];
    
    
    [color setStroke];
    
    [path stroke];
    
    
}



@end
