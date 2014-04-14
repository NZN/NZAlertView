//
//  NZInitialViewController.m
//  NZAlertView
//
//  Created by Bruno Furtado on 18/12/13.
//  Copyright (c) 2013 No Zebra Network. All rights reserved.
//

#import "NZInitialViewController.h"
#import "NZAlertView.h"

@interface NZInitialViewController ()

@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UISwitch *swtCompletionHandler;
@property (strong, nonatomic) IBOutlet UIButton *btnSuccess;
@property (strong, nonatomic) IBOutlet UIButton *btnInfo;
@property (strong, nonatomic) IBOutlet UIButton *btnError;

@property (nonatomic) NZAlertStyle alertStyle;

- (IBAction)alertStyleClicked:(UIButton *)button;
- (IBAction)showAlertClicked;

@end



@implementation NZInitialViewController

#pragma mark -
#pragma mark - UIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self alertStyleClicked:self.btnSuccess];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return UIInterfaceOrientationIsPortrait(interfaceOrientation);
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (BOOL)prefersStatusBarHidden
{
    return !YES;
}

#pragma mark -
#pragma mark - NZAlertViewDelegate

- (void)willPresentNZAlertView:(NZAlertView *)alertView
{
    NSLog(@"%s\n\t alert will present", __PRETTY_FUNCTION__);
}

- (void)didPresentNZAlertView:(NZAlertView *)alertView
{
    NSLog(@"%s\n\t alert did present", __PRETTY_FUNCTION__);
}

- (void)NZAlertViewWillDismiss:(NZAlertView *)alertView
{
    NSLog(@"%s\n\t alert will dismiss", __PRETTY_FUNCTION__);
}

- (void)NZAlertViewDidDismiss:(NZAlertView *)alertView
{
    NSLog(@"%s\n\t alert did dismiss", __PRETTY_FUNCTION__);
}

#pragma mark -
#pragma mark - Actions

- (IBAction)alertStyleClicked:(UIButton *)button
{
    self.btnSuccess.selected = NO;
    self.btnInfo.selected = NO;
    self.btnError.selected = NO;
    
    button.selected = !button.selected;
    
    if (button == self.btnSuccess) {
        self.alertStyle = NZAlertStyleSuccess;
    } else if (button == self.btnInfo) {
        self.alertStyle = NZAlertStyleInfo;
    } else {
        self.alertStyle = NZAlertStyleError;
    }
}

- (IBAction)showAlertClicked
{    
    NZAlertView *alert = [[NZAlertView alloc] initWithStyle:self.alertStyle
                                             //statusBarColor:[UIColor purpleColor]
                                                      title:@"Alert View"
                                                    message:@"This is an alert example for NZAlertView for iOS."
                                                   delegate:self];
    
    [alert setStatusBarColor:[UIColor colorWithRed:0.897 green:0.324 blue:0.044 alpha:1.000]];
    //alert.screenBlurLevel = 1;
    //[alert setTextAlignment:NSTextAlignmentCenter];
    
    if (self.swtCompletionHandler.on) {
        [alert showWithCompletion:^{
            NSLog(@"%s\n\t alert with completion handler", __PRETTY_FUNCTION__);
            [self imageAnimation];
        }];
    } else {
        [alert show];
    }
}

#pragma mark -
#pragma mark - Private methods

- (void)imageAnimation
{
    CATransition *transition = [CATransition animation];
    
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    transition.duration = 1.5f;
    transition.type = @"rippleEffect";
    
    [[self.imageView layer] addAnimation:transition forKey:@"rippleEffect"];
}

@end