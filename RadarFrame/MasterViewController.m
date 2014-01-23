//
//  MasterViewController.m
//  MyMaster
//
//  Created by cuidoudou on 13-12-23.
//  Copyright (c) 2013年 Les. All rights reserved.
//

#import "MasterViewController.h"

#import "DetailViewController.h"
#import "AboutController.h"
#import "UrlViewController.h"
#import "CommonSettingsViewController.h"
#import "AdjustController.h"
#import "TempViewController.h"
#import "AppDelegate.h"

@interface MasterViewController () {
    NSMutableArray *_objects;
    UINavigationController *_navigationController;
}
@end

@implementation MasterViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
//        self.contentSizeForViewInPopover = CGSizeMake(320.0, 600.0);
    }
    return self;
}
//- (void)awakeFromNib
//{
//    self.clearsSelectionOnViewWillAppear = NO;
//    self.preferredContentSize = CGSizeMake(320.0, 600.0);
//    [super awakeFromNib];
//}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.temp = [[TempViewController alloc] init];
    self.aboutController = [[AboutController alloc] init];
    self.adjustController = [[AdjustController alloc] init];
    
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"SettingsList" ofType:@"plist"];
//    NSDictionary *pageInfo = [NSDictionary dictionaryWithContentsOfFile:path];
//    NSArray *keyArray = [pageInfo allKeys];
//    NSArray *newArray = [keyArray sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
//        NSComparisonResult result = [obj1 compare: obj2];
//        return result == NSOrderedDescending;
//    }];
//    self.pages = newArray;
//    self.mainDic = pageInfo;
    NSArray *array = [[NSArray alloc] initWithObjects:@"通用设置", @"检查更新",@"帮助" ,
                      @"意见反馈" ,@"评价" ,@"关于", nil];
    self.pages = array;
    
    NSInteger selectedIndex = 0;
    
    NSIndexPath *selectedIndexPath = [NSIndexPath indexPathForRow:selectedIndex inSection:0];
    
    [self.settingsTable selectRowAtIndexPath:selectedIndexPath animated:NO scrollPosition:UITableViewScrollPositionNone];
    
    
    //设置默认页
    _navigationController = (UINavigationController *)[self.splitViewController.viewControllers lastObject];
    self.commSetController = (CommonSettingsViewController *)[_navigationController topViewController];
    
    self.commSetController.navigationItem.title = @"通用设置";;
    
    AppDelegate *myDelegate = [[UIApplication sharedApplication] delegate];
    myDelegate.navigationController = _navigationController;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (void)insertNewObject:(id)sender
//{
//    if (!_objects) {
//        _objects = [[NSMutableArray alloc] init];
//    }
//    [_objects insertObject:[NSDate date] atIndex:0];
//    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
//    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
//}

#pragma mark -simpleTable

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
            [_navigationController popToRootViewControllerAnimated:NO];
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
    controller.navigationItem.hidesBackButton = YES;
    [_navigationController popToRootViewControllerAnimated:NO];
    [_navigationController pushViewController:controller animated:NO];
}

@end
