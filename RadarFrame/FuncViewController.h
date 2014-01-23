//
//  FuncViewController.h
//  RadarFrame
//
//  Created by guanpu on 13-12-4.
//  Copyright (c) 2013年 les. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FuncViewController : UIViewController <UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

- (void)presentPop;
- (void)dismissPopup;

@end
