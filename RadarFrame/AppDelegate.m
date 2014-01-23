//
//  AppDelegate.m
//  RadarFrame
//
//  Created by guanpu on 13-12-4.
//  Copyright (c) 2013年 les. All rights reserved.
//

#import "AppDelegate.h"

#import "ViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self readConfig];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.viewController = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    self.window.tintColor = [UIColor colorWithRed:0.22745f green:0.6588f blue:0.8784f alpha:1.0f];
    return YES;
}

- (void)readConfig
{
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"config" ofType:@"plist"];
    NSDictionary *dictionary = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
    self.URL = [dictionary objectForKey:@"url"];
    self.urlGis = [dictionary objectForKey:@"urlGis"];
}

- (void)saveUrl:(NSString *)url Gis:(NSString *)urlGis
{
//    NSString *plistPath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:@"config.plist"];
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"config" ofType:@"plist"];
    NSMutableDictionary *dicWrite = [[NSMutableDictionary alloc] initWithContentsOfFile:plistPath];
    
    [dicWrite setValue :url forKey:@"url"];
    [dicWrite setValue :urlGis forKey:@"urlGis"];
    [dicWrite writeToFile:plistPath atomically:YES];
    
    [self readConfig];
}
@end
