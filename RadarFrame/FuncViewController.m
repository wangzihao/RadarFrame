//
//  FuncViewController.m
//  RadarFrame
//
//  Created by guanpu on 13-12-4.
//  Copyright (c) 2013年 les. All rights reserved.
//

#import "FuncViewController.h"
#import "UIViewController+CWPopup.h"
#import "SettingViewController.h"

@interface FuncViewController ()
@property (copy, nonatomic) NSArray *pages;
@property (copy,nonatomic) NSDictionary *mainDic;
@property (strong, nonatomic) UIWebView *funcWV;
@property (strong,nonatomic) UIActivityIndicatorView *indicator;
@end

@implementation FuncViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        UIImage *image = [UIImage imageNamed:@"fc.png"];
        UIImage *selectedImage = [UIImage imageNamed:@"functions.png"];
        image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:@"功能" image:image selectedImage:selectedImage];
        self.tabBarItem = item;
        self.indicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(self.view.center.x, self.view.center.y, 30.0, 30.0)];
        [self.indicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
        self.indicator.hidesWhenStopped = YES;
        [self.view addSubview:self.indicator];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"PagesList" ofType:@"plist"];
    NSDictionary *pageInfo = [NSDictionary dictionaryWithContentsOfFile:path];
    NSArray *keyArray = [pageInfo allKeys];
    self.pages = keyArray;
    self.mainDic = pageInfo;
    CGRect frame = self.view.frame;
    frame.origin.x= 192.0;
    frame.origin.y=20.0;
    frame.size.width = 832.0;
    frame.size.height =  748.0;
    self.funcWV=[[UIWebView alloc] initWithFrame:frame];
    [[self.funcWV.subviews objectAtIndex:0] setBounces:NO];
    self.funcWV.delegate = self;
    [self.view addSubview:self.funcWV];
    
    self.useBlurForPopup = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)webViewDidStartLoad:(UIWebView *)webView{
    [self.indicator startAnimating];
    
}
-(void)webViewDidFinishLoad:(UIWebView *)webView{
    [self.indicator stopAnimating];
    
}
#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.pages count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *rowDics = [self.mainDic objectForKey:[self.pages objectAtIndex:section]];
    return [rowDics count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSUInteger section = indexPath.section;
    NSInteger row = indexPath.row;
    NSString * key = [self.pages objectAtIndex:section];
    NSArray *dictionaries = [self.mainDic objectForKey:key];
    static NSString *GroupedTabView = @"GroupTableViewIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:GroupedTabView];
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:GroupedTabView];
    }
    
    NSDictionary *president = [dictionaries objectAtIndex:row];
    cell.textLabel.text=president[@"name"];
    return cell;
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [self.pages objectAtIndex:section];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSUInteger section = indexPath.section;
    NSInteger row = indexPath.row;
    NSString * key = [self.pages objectAtIndex:section];
    NSArray *dictionaries = [self.mainDic objectForKey:key];
    NSDictionary *function = [dictionaries objectAtIndex:row];
    NSString *urlString = function[@"url"];
    NSString *prefix = @"http://192.168.17.107:8081/src/";
    if(section == (unsigned int) 0 && row==1){
        prefix = @"http://192.168.17.221:8080/gisviewer/";
    }
    NSString *string = [prefix stringByAppendingString: urlString ];
	[self.funcWV loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:string]]];
}

- (void)presentPop
{
    
    SettingViewController *popViewController = [[SettingViewController alloc] initWithNibName:@"SettingViewController" bundle:nil];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:popViewController];
    
    UIToolbar *toolBar = [[UIToolbar alloc] init];
    toolBar.backgroundColor = [UIColor whiteColor];
    UIBarButtonItem * item0 = [[UIBarButtonItem alloc] initWithTitle:@"关闭" style:UIBarButtonItemStyleDone target:self action:@selector(closeAction:)];
    [toolBar setItems:[NSArray arrayWithObjects:item0,nil] animated:YES];
    
    navigationController.view.frame = CGRectMake(0, 40, 500, 600);
    [navigationController.view addSubview:toolBar];
    popViewController.navigationItem.title = @"设置";
    [self presentPopupViewController:navigationController animated:YES completion:^(void) {
        NSLog(@"popup view presented");
    }];
}

- (void)dismissPopup {
    if (self.popupViewController != nil) {
        [self dismissPopupViewControllerAnimated:YES completion:^{
            NSLog(@"popup view dismissed");
        }];
    }
}
-(void)closeAction:(id)sender
{
    NSLog(@"sss");
    [self dismissPopup];
}
@end
