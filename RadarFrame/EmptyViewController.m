//
//  EmptyViewController.m
//  RadarFrame
//
//  Created by cuidoudou on 14-1-2.
//  Copyright (c) 2014年 les. All rights reserved.
//

#import "EmptyViewController.h"

@interface EmptyViewController ()

@end

@implementation EmptyViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        UIImage *image = [UIImage imageNamed:@"pi.png"];
        UIImage *selectedImage = [UIImage imageNamed:@"personInfo.png"];
        image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:@"弹出" image:image selectedImage:selectedImage];
        item.tag = 1;
        self.tabBarItem = item;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
