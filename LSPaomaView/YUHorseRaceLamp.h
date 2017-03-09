//
//  YUHorseRaceLamp.h
//  LSPaomaView
//
//  Created by 于博洋 on 2017/3/9.
//  Copyright © 2017年 Sen. All rights reserved.
//

#import <UIKit/UIKit.h>

//2个lab的间隔
static CGFloat const distanceInterval = 10;


@interface YUHorseRaceLamp : UIView

@property (nonatomic,copy) NSString * text;
@property (nonatomic,strong) UIColor * textColor;

/**
 * method 2个title
 */
@property (nonatomic,strong) UILabel * titleLab;
@property (nonatomic,strong) UILabel * titleLab2;

/**
 * method 控制2个title的origin.x
 */
@property (nonatomic,assign,readonly) CGFloat currentTitleX;
@property (nonatomic,assign,readonly) CGFloat currentTitle2X;


@end




















