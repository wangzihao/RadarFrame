//
//  AdjustController.h
//  RadarFrame
//
//  Created by cuidoudou on 14-1-6.
//  Copyright (c) 2014年 les. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CPTextViewPlaceholder;

@interface AdjustController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *textTitle;
@property (weak, nonatomic) IBOutlet UITextView *textContent;
@property (weak, nonatomic) IBOutlet CPTextViewPlaceholder *textView;

@end
