//
//  ViewController.m
//  LSPaomaView
//
//  Created by Sen on 15/8/1.
//  Copyright (c) 2015年 Sen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic,strong) UIButton * button;
@property (nonatomic,strong) YUHorseRaceLamp * paomav;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString* text = @"两块钱,你买不!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ hahahahha";
    
    YUHorseRaceLamp * paomav = [[YUHorseRaceLamp alloc] initWithFrame:CGRectMake(10, 64, self.view.bounds.size.width-20, 44)];
    paomav.text = text;
    paomav.textColor = [UIColor blueColor];
    [self.view addSubview:paomav];
    
    self.paomav = paomav;
    [self.view addSubview:self.button];
}

- (void)changePaomavText {
    
    NSString* text = @"两块钱,你买不真的只卖2员哈哈哈.真的~~嗯哈";
    for (int i = 0; i < arc4random()%10; i++) {
        text = [NSString stringWithFormat:@"%@_%d",text,i];
    }
    NSLog(@"%@",text);
    self.paomav.text = text;
    
    
}


- (UIButton *)button {
    if (_button == nil) {
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        _button.frame = CGRectMake((self.view.frame.size.width - 200)/2, 200, 200, 64);
        _button.backgroundColor = [UIColor grayColor];
        [_button setTitle:@"更改" forState:UIControlStateNormal];
        [_button addTarget:self action:@selector(changePaomavText) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

















@end
