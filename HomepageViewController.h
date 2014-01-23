//
//  HomepageViewController.h
//  RadarFrame
//
//  Created by guanpu on 13-12-13.
//  Copyright (c) 2013年 les. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SettingViewController;

@interface HomepageViewController : UIViewController <UIWebViewDelegate>
{
    UIWebView *myWebView;
    UIActivityIndicatorView *loading;
}

- (void)presentPop;
- (void)dismissPopup;

@end
