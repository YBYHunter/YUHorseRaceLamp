//
//  ViewController.m
//  LSPaomaView
//
//  Created by Sen on 15/8/1.
//  Copyright (c) 2015年 Sen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString* text = @"两块钱,你买不!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ hahahahha";
    
    YUHorseRaceLamp * paomav = [[YUHorseRaceLamp alloc] initWithFrame:CGRectMake(10, 64, self.view.bounds.size.width-20, 44) title:text];
    [self.view addSubview:paomav];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

















@end
