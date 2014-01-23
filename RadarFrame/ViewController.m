//
//  ViewController.m
//  RadarFrame
//
//  Created by guanpu on 13-12-4.
//  Copyright (c) 2013年 les. All rights reserved.
//

#import "ViewController.h"
#import "TabViewController.h"
#import "HomepageViewController.h"
#import "SettingViewController.h"
#import "FuncViewController.h"
#import "Reachability.h"
#import "MasterViewController.h"
#import "DetailViewController.h"
#import "CommonSettingsViewController.h"

#import "EmptyViewController.h"

@interface ViewController (){
    CommonSettingsViewController *_commonSettingsViewController;
}
@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *password;
- (IBAction)loginAction:(UIButton*)sender;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *waiting;
@property (weak, nonatomic) IBOutlet UILabel *Infomessage;
@property (nonatomic) Reachability *reach;
-(void) gotoTabBarPage;

@end

@implementation ViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    /*struct sockaddr_in ina;
    bzero(&ina,sizeof(ina));
    ina.sin_family=AF_INET;
    ina.sin_port=htons(8081);
    ina.sin_addr.s_addr = inet_addr("192.168.17.107");
    
    self.reach = [Reachability reachabilityWithAddress:&ina];*/
    self.reach = [Reachability reachabilityForLocalWiFi];//todo:change the reachable test strategy	
    [self.reach startNotifier];
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"注意", nil)
                                                        message:NSLocalizedString(@"不能连接到网络", nil)
                                                       delegate:self
                                              cancelButtonTitle:NSLocalizedString(@"确定", nil)
                                              otherButtonTitles:nil];
    switch ([self.reach currentReachabilityStatus]) {
        case NotReachable:
            [alertView show];
            break;
        default:
            break;
    }
    [self.waiting stopAnimating];
    //self.waiting.hidden = YES;
}
-(BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation{
    return (toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft||
            toInterfaceOrientation == UIInterfaceOrientationLandscapeRight);
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loginAction:(UIButton*)sender {
    sender.enabled = NO;
    self.Infomessage.hidden = NO;
    //self.waiting.hidden = NO;
    [self.waiting startAnimating];
    
    
    if([self.username.text isEqualToString:@"test"]){
        sender.enabled=YES;
        [self.waiting stopAnimating];
        //self.waiting.hidden = YES;
        [self gotoTabBarPage];
        
    }else{
        sender.enabled=YES;
        [self.waiting stopAnimating];
        //self.waiting.hidden = YES;
        self.Infomessage.text = @"用户名或密码错误";
    }
    
}
-(void) gotoTabBarPage{
    TabViewController *tabBarController = [[TabViewController alloc] init];
    HomepageViewController *homeview =  [[HomepageViewController alloc] initWithNibName:@"HomepageViewController" bundle:nil];
    FuncViewController *funcview = [[FuncViewController alloc] initWithNibName:@"FuncViewController" bundle:nil];
    [self makeSplitViewController:[self makeBarItem]];
    
    EmptyViewController *emptyViewController = [[EmptyViewController alloc] init];
    tabBarController.viewControllers = @[homeview,funcview,_splitViewController,emptyViewController];
    
    //初始化设置窗口
    [tabBarController setCopyViewController:homeview];
    
    [self presentViewController:tabBarController animated:YES completion:nil];
}

- (void) makeSplitViewController:(UITabBarItem *)item{
//    _detailViewController = [[DetailViewController alloc] initWithNibName:@"DetailView" bundle:nil];
    _commonSettingsViewController = [[CommonSettingsViewController alloc] init];
    UINavigationController *detailViewNav = [[UINavigationController alloc] initWithRootViewController:_commonSettingsViewController];
    _masterViewController.commSetController = _commonSettingsViewController;
    
    _masterViewController = [[MasterViewController alloc] initWithNibName:@"MasterView" bundle:nil];
    UINavigationController *masterViewNav = [[UINavigationController alloc] initWithRootViewController:_masterViewController];
    _masterViewController.navigationItem.title = @"设置选项";
//    _masterViewController.detailViewController = _detailViewController;
    
    _splitViewController = [[UISplitViewController alloc]init];
    _splitViewController.tabBarItem = item;
//    设置数字小标
//    _splitViewController.tabBarItem.badgeValue = [NSString stringWithFormat:@"%d",3];
    
    _splitViewController.viewControllers = [NSArray arrayWithObjects:masterViewNav,detailViewNav,nil];
//    _splitViewController.delegate =_detailViewController;
    _splitViewController.delegate = (id)detailViewNav.topViewController;
    
}
-(UITabBarItem *)makeBarItem{
    UIImage *image = [UIImage imageNamed:@"pi.png"];
    UIImage *selectedImage = [UIImage imageNamed:@"personInfo.png"];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:@"设置" image:image selectedImage:selectedImage];
    return item;
}














- (IBAction)backgroundTap:(id)sender {
    [_username resignFirstResponder];
    [_password resignFirstResponder];
}
@end
