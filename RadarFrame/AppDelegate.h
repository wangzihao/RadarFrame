//
//  AppDelegate.h
//  RadarFrame
//
//  Created by guanpu on 13-12-4.
//  Copyright (c) 2013年 les. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) ViewController *viewController;

@property (strong,nonatomic) NSString *URL;
@property (strong,nonatomic) NSString *urlGis;

@property (strong,nonatomic) UINavigationController *navigationController;

- (void)readConfig;
- (void)saveUrl:(NSString *)url Gis:(NSString *)urlGis;
@end
