//
//  MFLoginViewController.m
//  MyFacebook
//
//  Created by 이효근 [Hyoja] on 2016. 10. 13..
//  Copyright © 2016년 NEXON Korea Corporation. All rights reserved.
//

#import "MFLoginViewController.h"
#import "MFFeedViewController.h"


@implementation MFLoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated
{
    if ([FBSDKAccessToken currentAccessToken] == nil) {
        FBSDKLoginButton *loginButton = [[FBSDKLoginButton alloc] init];
        loginButton.delegate = self;
        loginButton.center = self.view.center;
        [self.view addSubview:loginButton];
    } else {
        [self loginMyFacebook];
    }
}


#pragma mark - FBSDKLoginButtonDelegate

- (void)loginButton:(FBSDKLoginButton *)loginButton didCompleteWithResult:(FBSDKLoginManagerLoginResult *)result error:(NSError *)error
{
    if(result.isCancelled != YES &&
       [FBSDKAccessToken currentAccessToken] != nil){
        [self loginMyFacebook];
    } else {
        UIAlertView *toast = [[UIAlertView alloc] initWithTitle:nil
                                                        message:@"Login was Cancled."
                                                       delegate:nil
                                              cancelButtonTitle:nil
                                              otherButtonTitles:nil, nil];
        toast.backgroundColor=[UIColor redColor];
        [toast show];
        int duration = 2; // duration in seconds
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, duration * NSEC_PER_SEC),
                       dispatch_get_main_queue(),
                       ^{
                           [toast dismissWithClickedButtonIndex:0 animated:YES];
                       });
    }
}

- (void)loginButtonDidLogOut:(FBSDKLoginButton *)loginButton
{
}

- (void)loginMyFacebook
{
    UIViewController *feedViewController = [[MFFeedViewController alloc] init];
    UINavigationController *navigationViewController = [[UINavigationController alloc] initWithRootViewController:feedViewController];
    
    UIBarButtonItem * doneButton = [[UIBarButtonItem alloc]
                                    initWithTitle:@"Log Out"
                                    style:UIBarButtonItemStyleBordered
                                    target:self
                                    action:@selector(dismiss)];
    feedViewController.navigationItem.leftBarButtonItem = doneButton;
    
    [self presentViewController:navigationViewController animated:YES completion:nil];
}

- (void)dismiss
{
    [self dismissViewControllerAnimated:NO completion:nil];
    FBSDKLoginManager *loginManager = [[FBSDKLoginManager alloc] init];
    [loginManager logOut];
    [FBSDKAccessToken setCurrentAccessToken:nil];
}

@end
