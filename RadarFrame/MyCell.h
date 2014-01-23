//
//  MyCell.h
//  RadarFrame
//
//  Created by cuidoudou on 13-12-30.
//  Copyright (c) 2013年 les. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *label;
- (IBAction)switch:(UISwitch *)sender;

@end
