//
//  UrlViewController.h
//  RadarFrame
//
//  Created by cuidoudou on 13-12-24.
//  Copyright (c) 2013年 les. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UrlViewController : UIViewController
@property (weak, nonatomic) IBOutlet UINavigationBar *navigationBar;
@property (weak, nonatomic) IBOutlet UITextField *urlTextField;
@property (weak, nonatomic) IBOutlet UITextField *urlGisTextField;
@property (weak, nonatomic) IBOutlet UIButton *confirm;
- (IBAction)updateUrl:(UIButton *)sender;

@end
