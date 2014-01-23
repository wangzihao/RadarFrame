//
//  AdjustController.m
//  RadarFrame
//
//  Created by cuidoudou on 14-1-6.
//  Copyright (c) 2014年 les. All rights reserved.
//

#import "AdjustController.h"
#import "CPTextViewPlaceholder.h"

@interface AdjustController ()

@end

@implementation AdjustController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIBarButtonItem *confirmBtn = [[UIBarButtonItem alloc] initWithTitle:@"提交" style:UIBarButtonItemStyleDone target:self action:@selector(selectRightAction:)];
    self.navigationItem.rightBarButtonItem = confirmBtn;
    self.textTitle.placeholder = @"请输入标题...";
    self.textView.placeholder = @"请输入意见和建议...";
//    [self.textView becomeFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)selectRightAction:(id)sender
{
    UIAlertView *alter = [[UIAlertView alloc] initWithTitle:@"提示" message:@"您的意见已经提交，我们会在第一时间处理您的反馈意见" delegate:self  cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alter show];
}


@end
