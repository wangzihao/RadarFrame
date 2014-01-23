//
//  UrlViewController.m
//  RadarFrame
//
//  Created by cuidoudou on 13-12-24.
//  Copyright (c) 2013年 les. All rights reserved.
//

#import "UrlViewController.h"
#import "AppDelegate.h"

@interface UrlViewController ()

@end

@implementation UrlViewController

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
    // Do any additional setup after loading the view from its nib.
    AppDelegate *myDelegate = [[UIApplication sharedApplication] delegate];
    self.urlTextField.text = myDelegate.URL;
    self.urlGisTextField.text = myDelegate.urlGis;
    
    UIBarButtonItem *confirmBtn = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStyleDone target:self action:@selector(selectRightAction:)];
    self.navigationItem.rightBarButtonItem = confirmBtn;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)selectRightAction:(id)sender
{
    AppDelegate *myDelegate = [[UIApplication sharedApplication] delegate];
    [myDelegate saveUrl:self.urlTextField.text Gis:self.urlGisTextField.text];
    UIAlertView *alter = [[UIAlertView alloc] initWithTitle:@"提示" message:@"配置已修改" delegate:self  cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alter show];
}

- (IBAction)updateUrl:(UIButton *)sender {
    AppDelegate *myDelegate = [[UIApplication sharedApplication] delegate];
    [myDelegate saveUrl:self.urlTextField.text Gis:self.urlGisTextField.text];
}
@end
