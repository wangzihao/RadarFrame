//
//  DetailCell.m
//  RadarFrame
//
//  Created by cuidoudou on 13-12-30.
//  Copyright (c) 2013年 les. All rights reserved.
//

#import "DetailCell.h"
#import "AppDelegate.h"

@implementation DetailCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)confirmUrl:(UIButton *)sender {
    AppDelegate *myDelegate = [[UIApplication sharedApplication] delegate];
    myDelegate.URL = self.urlText.text;
}
@end
