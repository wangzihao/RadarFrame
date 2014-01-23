//
//  DetailCell.h
//  RadarFrame
//
//  Created by cuidoudou on 13-12-30.
//  Copyright (c) 2013年 les. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UITextField *urlText;
- (IBAction)confirmUrl:(UIButton *)sender;

@end
