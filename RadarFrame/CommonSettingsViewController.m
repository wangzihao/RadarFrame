//
//  CommonSettingsViewController.m
//  RadarFrame
//
//  Created by cuidoudou on 13-12-26.
//  Copyright (c) 2013年 les. All rights reserved.
//

#import "CommonSettingsViewController.h"
#import "MyCell.h"
#import "DetailCell.h"
#import "UrlViewController.h"
//#import "AppDelegate.h"

@interface CommonSettingsViewController (){
    UINavigationController *_navgationController;
}
@end

@implementation CommonSettingsViewController

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
    NSString *path = [[NSBundle mainBundle] pathForResource:@"SettingsList" ofType:@"plist"];
    NSMutableArray *array=[[NSMutableArray  alloc] initWithContentsOfFile:path];
    self.provinces = [[array objectAtIndex:0] objectForKey:@"d_name"];
    
//    AppDelegate *myDelegate = [[UIApplication sharedApplication] delegate];
    _navgationController = [self.splitViewController.viewControllers lastObject];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Section总数
//- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView{
//    return @"";
//}
// Section Titles
//每个section显示的标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"";
}
//指定有多少个分区(Section)，默认为1
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
//指定每个分区中有多少行，默认为1
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.provinces count];
}
//绘制Cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    NSUInteger section = [indexPath section];
    NSUInteger row = [indexPath row];
    
    static NSString *GroupedTableIdentifier = @"GroupTableViewIdentifier";
    if(row == 0){
        static NSString *CellIdentifier = @"CustomCellIdentifier";
        MyCell *cell = (MyCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"MyCell" owner:self options:nil];
            cell = [array objectAtIndex:0];
            [cell setSelectionStyle:UITableViewCellSelectionStyleGray];
        }
        cell.label.text = [[self.provinces objectAtIndex:row] objectForKey:@"name"];
        return cell;
        
    }
//        else if(row == 1){
//        static NSString *CellIdentifier = @"CustomCellIdentifier";
//        DetailCell *cell = (DetailCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//        if (cell == nil) {
//            NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"DetailCell" owner:self options:nil];
//            cell = [array objectAtIndex:0];
//            [cell setSelectionStyle:UITableViewCellSelectionStyleGray];
//        }
//        cell.label.text = [[self.provinces objectAtIndex:row] objectForKey:@"name"];
//        return cell;
//    }
    else{
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:
                                 GroupedTableIdentifier];
        if (cell == nil) {
            cell = [[UITableViewCell alloc]
                    initWithStyle:UITableViewCellStyleDefault
                    reuseIdentifier:GroupedTableIdentifier];
        }
        cell.textLabel.text = [[self.provinces objectAtIndex:row] objectForKey:@"name"];
        cell.accessoryType = UIAccessibilityScrollDirectionRight;
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if([indexPath row]==1){
        self.urlViewController = [[UrlViewController alloc] init];
        [self.navigationController pushViewController:self.urlViewController animated:YES];
    }
}

@end
