//
//  SettingViewController.m
//  RadarFrame
//
//  Created by guanpu on 13-12-4.
//  Copyright (c) 2013年 les. All rights reserved.
//

#import "SettingViewController.h"
#import "AboutController.h"
#import "UrlViewController.h"
#import "CommonSettingsViewController.h"
#import "AdjustController.h"
#import "TempViewController.h"
#import "AppDelegate.h"

@interface SettingViewController ()
{
    NSMutableArray *_objects;
//    UINavigationController *_navigationController;
}
@end

@implementation SettingViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
//        UIImage *image = [UIImage imageNamed:@"pi.png"];
//        UIImage *selectedImage = [UIImage imageNamed:@"personInfo.png"];
//        image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//        selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//        UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:@"设置" image:image selectedImage:selectedImage];
//        self.tabBarItem = item;
//        
////        self.tabBarItem.badgeValue = [NSString stringWithFormat:@"%d",3];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.temp = [[TempViewController alloc] init];
    self.aboutController = [[AboutController alloc] init];
    self.adjustController = [[AdjustController alloc] init];
    self.commSetController = [[CommonSettingsViewController alloc] init];
    
    NSArray *array = [[NSArray alloc] initWithObjects:@"通用设置", @"检查更新",@"帮助" ,
                      @"意见反馈" ,@"评价" ,@"关于", nil];
    self.pages = array;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *SimpleTableIdentifier = @"SimpleTableIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:
                             SimpleTableIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:SimpleTableIdentifier];
    }
    
    NSUInteger row = [indexPath row];
    cell.textLabel.text = [self.pages objectAtIndex:row];
    cell.accessoryType = UIAccessibilityScrollDirectionRight;
    return cell;
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.pages count];
}



-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    //    return [self.pages objectAtIndex:section];
    return @"";
}
#pragma mark

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return NO;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    int row = [indexPath row];
    switch (row) {
        case 0:
            [self changePage:row controller:self.commSetController];
            break;
        case 3:
            [self changePage:row controller:self.adjustController];
            break;
        case 5:
            [self changePage:row controller:self.aboutController];
            break;
        default:
            if(self.temp.nameLabel == nil)
                self.temp.labelText = [self.pages objectAtIndex:row];
            else
                self.temp.nameLabel.text = [self.pages objectAtIndex:row];
            [self changePage:row controller:self.temp];
            break;
    }
}
- (void)changePage:(int)row controller:(UIViewController *)controller
{
    controller.navigationItem.title = [self.pages objectAtIndex:row];
    [self.navigationController pushViewController:controller animated:YES];
}

@end
