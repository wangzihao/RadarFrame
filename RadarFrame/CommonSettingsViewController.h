//
//  CommonSettingsViewController.h
//  RadarFrame
//
//  Created by cuidoudou on 13-12-26.
//  Copyright (c) 2013年 les. All rights reserved.
//

#import <UIKit/UIKit.h>
@class UrlViewController;

@interface CommonSettingsViewController : UIViewController

//对应nib文件中的tag
#define cellLable = 1;
#define switchBtn = 2;

@property (strong, nonatomic) NSArray *provinces;

@property (strong,nonatomic) UrlViewController *urlViewController;

@end
