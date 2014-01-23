//
//  TabViewController.m
//  RadarFrame
//
//  Created by guanpu on 13-12-4.
//  Copyright (c) 2013年 les. All rights reserved.
//

#import "TabViewController.h"
#import "HomepageViewController.h"
#import "FuncViewController.h"
#import "SettingViewController.h"
#import "EmptyViewController.h"
#import "UIViewController+CWPopup.h"

@interface TabViewController ()
{
    UIViewController *_copyViewController;
}

@end

@implementation TabViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.delegate = self;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
//    _copyViewController = [self.viewControllers firstObject];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft||interfaceOrientation == UIInterfaceOrientationLandscapeRight);
}

#pragma mark - implement tabViewdelegate
-(void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    
    if(viewController.class == [HomepageViewController class]){
        [viewController viewDidLoad];
    }
    [_copyViewController dismissPopupViewControllerAnimated:YES completion:nil];
    _copyViewController = viewController;

}
//
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
    if(viewController.class == [EmptyViewController class]){
        return NO;
    }
    else
        return YES;
}

-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)Item{
    if (tabBar == self.tabBar) {
        if (Item.tag == 1) {
            NSLog(@"select 1" );
            if(_copyViewController.class == [HomepageViewController class]){
                HomepageViewController *home = (HomepageViewController *)_copyViewController;
                [home presentPop];
            }
            if(_copyViewController.class == [FuncViewController class]){
                FuncViewController *func = (FuncViewController *)_copyViewController;
                [func presentPop];
            }
        }
    }
}

-(void) setCopyViewController:(UIViewController *)viewController
{
    _copyViewController = viewController;
}
//耶耶
@end
