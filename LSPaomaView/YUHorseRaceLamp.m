//
//  YUHorseRaceLamp.m
//  LSPaomaView
//
//  Created by 于博洋 on 2017/3/9.
//  Copyright © 2017年 Sen. All rights reserved.
//

#import "YUHorseRaceLamp.h"

@interface YUHorseRaceLamp ()

/**
 * method 定时器
 */
@property (nonatomic, strong) dispatch_source_t timer;


@end


@implementation YUHorseRaceLamp

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        self.clipsToBounds = YES;
        [self addSubview:self.titleLab];
        [self addSubview:self.titleLab2];
    }
    return self;
}


- (void)setText:(NSString *)text {
    _text = text;
    [self initWithText:text];
}

- (void)initWithText:(NSString *)title {
    _currentTitleX = 0;
    
    if (self.timer) {
        dispatch_cancel(self.timer);
        self.timer = nil;
    }
    
    self.titleLab.text = title;
    self.titleLab2.text = title;
    
    //计算textLb大小
    CGSize sizeOfText = [self.titleLab sizeThatFits:CGSizeZero];
    self.titleLab.frame = CGRectMake((self.frame.size.width - sizeOfText.width)/2, (self.frame.size.height - sizeOfText.height)/2, sizeOfText.width, sizeOfText.height);
    //判断是否需要 滚动
    BOOL useReserve = sizeOfText.width > self.frame.size.width ? YES : NO;
    if (useReserve) {
        _currentTitle2X = sizeOfText.width + distanceInterval;
        
        self.titleLab.frame = CGRectMake(0, self.titleLab.frame.origin.y, self.titleLab.frame.size.width, self.titleLab.frame.size.height);
        
        self.titleLab2.frame = CGRectMake(_currentTitle2X, self.titleLab.frame.origin.y, self.titleLab.frame.size.width, self.titleLab.frame.size.height);
        
        dispatch_queue_t queue = dispatch_get_main_queue();
        self.timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
        dispatch_time_t start = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC));
        uint64_t interval = (uint64_t)(0.01 * NSEC_PER_SEC);
        dispatch_source_set_timer(self.timer, start, interval, 0);
        dispatch_source_set_event_handler(self.timer, ^{
            [self startAnimate];
        });
        dispatch_resume(self.timer);
    }
    else {
        _currentTitle2X = self.frame.size.width + distanceInterval;
        self.titleLab2.frame = CGRectMake(_currentTitle2X, self.titleLab.frame.origin.y, self.titleLab.frame.size.width, self.titleLab.frame.size.height);
    }
}

- (void)setTextColor:(UIColor *)textColor {
    _textColor = textColor;
    self.titleLab.textColor = textColor;
    self.titleLab2.textColor = textColor;
}

- (void)startAnimate {
    
    _currentTitleX = _currentTitleX - 1;
    _currentTitle2X = _currentTitle2X - 1;
    
    self.titleLab.frame = CGRectMake(_currentTitleX, self.titleLab.frame.origin.y, self.titleLab.frame.size.width, self.titleLab.frame.size.height);
    
    self.titleLab2.frame = CGRectMake(_currentTitle2X, self.titleLab2.frame.origin.y, self.titleLab2.frame.size.width, self.titleLab2.frame.size.height);
    
    if (fabs(self.titleLab.frame.origin.x) >= self.titleLab.frame.size.width + distanceInterval && _currentTitleX < 0) {
        _currentTitleX = self.titleLab.frame.size.width + distanceInterval;
    }
    
    if (fabs(self.titleLab2.frame.origin.x) >= self.titleLab2.frame.size.width + distanceInterval && _currentTitle2X < 0) {
        _currentTitle2X = self.titleLab2.frame.size.width + distanceInterval;
    }
}


#pragma mark - getter

- (UILabel *)titleLab {
    if (_titleLab == nil) {
        _titleLab = [[UILabel alloc] initWithFrame:CGRectZero];
        _titleLab.textAlignment = NSTextAlignmentLeft;
        _titleLab.backgroundColor = [UIColor clearColor];
        _titleLab.textColor = [UIColor whiteColor];
        _titleLab.font = [UIFont systemFontOfSize:16];
        _titleLab.opaque = YES;
    }
    return _titleLab;
}


- (UILabel *)titleLab2 {
    if (_titleLab2 == nil) {
        _titleLab2 = [[UILabel alloc] initWithFrame:CGRectZero];
        _titleLab2.textAlignment = NSTextAlignmentCenter;
        _titleLab2.backgroundColor = [UIColor clearColor];
        _titleLab2.textColor = [UIColor whiteColor];
        _titleLab2.font = [UIFont systemFontOfSize:16];
        _titleLab2.opaque = YES;
    }
    return _titleLab2;
}


- (void)dealloc {
    if (self.timer) {
        dispatch_cancel(self.timer);
        self.timer = nil;
    }
}


@end
