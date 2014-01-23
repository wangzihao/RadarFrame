//
//  SettingViewController.h
//  RadarFrame
//
//  Created by guanpu on 13-12-4.
//  Copyright (c) 2013年 les. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AboutController;
@class UrlViewController;
@class CommonSettingsViewController;
@class AdjustController;
@class TempViewController;

@interface SettingViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (copy, nonatomic) NSArray *pages;
@property (copy,nonatomic) NSDictionary *mainDic;
@property (strong,nonatomic) AboutController *aboutController;
@property (strong,nonatomic) UrlViewController *urlViewController;
@property (strong,nonatomic) CommonSettingsViewController *commSetController;
@property (strong,nonatomic) AdjustController *adjustController;

@property (weak, nonatomic) IBOutlet UITableView *settingsTable;

@property (strong,nonatomic) TempViewController *temp;

@end
