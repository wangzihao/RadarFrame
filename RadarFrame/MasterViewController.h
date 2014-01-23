//
//  MasterViewController.h
//  MyMaster
//
//  Created by cuidoudou on 13-12-23.
//  Copyright (c) 2013年 Les. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;
@class AboutController;
@class SettingViewController;
@class UrlViewController;
@class CommonSettingsViewController;
@class TempViewController;
@class AdjustController;


@interface MasterViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) DetailViewController *detailViewController;
@property (copy, nonatomic) NSArray *pages;
@property (copy,nonatomic) NSDictionary *mainDic;
@property (strong,nonatomic) AboutController *aboutController;
@property (strong,nonatomic) UrlViewController *urlViewController;
@property (strong,nonatomic) CommonSettingsViewController *commSetController;
@property (strong,nonatomic) AdjustController *adjustController;

@property (weak, nonatomic) IBOutlet UITableView *settingsTable;

@property (strong,nonatomic) TempViewController *temp;

@end
