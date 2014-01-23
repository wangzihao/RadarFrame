//
//  ViewController.h
//  RadarFrame
//
//  Created by guanpu on 13-12-4.
//  Copyright (c) 2013年 les. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MasterViewController;
@class DetailViewController;

@interface ViewController : UIViewController
- (IBAction)backgroundTap:(id)sender;

@property (strong,nonatomic) UISplitViewController *splitViewController;
@property (strong,nonatomic) MasterViewController *masterViewController;
@property (strong,nonatomic) DetailViewController *detailViewController;
@end
