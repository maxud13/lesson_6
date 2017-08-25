//
//  ViewController.m
//  lesson_6
//
//  Created by maxud on 25.08.17.
//  Copyright © 2017 lesson_1. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *pushmeButton;
@property (nonatomic,strong) NSTimer *timer;
//для объявления таймера
@property (weak, nonatomic) IBOutlet UIView *LoaderView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *LoaderWidthConstraint;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
[self .pushmeButton setTitleColor:[UIColor greenColor]forState:UIControlStateNormal];
    [self .pushmeButton setTitleColor:[UIColor greenColor] forState:UIControlStateHighlighted];
    [self .pushmeButton setTitleColor:[UIColor blackColor] forState:UIControlStateDisabled];
    
    self.LoaderWidthConstraint.constant = 0.0f;
    
    
    [self.pushmeButton setTitle:@"Progres..."forState:UIControlStateDisabled];
}


- (NSTimer*)timer
{
    if (!_timer)
    {
        _timer = [NSTimer
                 scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(timeIsOver) userInfo:nil repeats:YES];
//        объявление таймера,если его нет
    }
    return _timer;
//    если таймер уже есть,возвращает к -(NSTimer*)timer
}

- (void)timeIsOver
{
    self.LoaderWidthConstraint.constant += 20;
    
    if (self.LoaderWidthConstraint.constant > 300)
    {
        [self.timer invalidate];
        self.timer = nil;
        
        self.LoaderView. backgroundColor = [UIColor clearColor];
        self.LoaderWidthConstraint.constant = 0.0f;
        self.pushmeButton.enabled = YES;
    }
}
    
- (IBAction)buttonwastapped:(UIButton *)sender

{
    
    self.LoaderView.backgroundColor = [UIColor redColor];
    [self timer];
    
    self.pushmeButton.enabled = NO;
}

//{
//    if (sender.state == UIControlStateHighlighted)
//    {
//        sender.backgroundColor = [UIColor redColor];
//    }
//   
    




@end
