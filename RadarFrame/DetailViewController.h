//
//  DetailViewController.h
//  MyMaster
//
//  Created by cuidoudou on 13-12-23.
//  Copyright (c) 2013年 Les. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;

@property (strong, nonatomic) IBOutlet UIView *aboutView;
@property (weak, nonatomic) IBOutlet UILabel *label;
- (void)cleanAllSubViews;

- (void)loadView:(NSString *)viewName;

//@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
