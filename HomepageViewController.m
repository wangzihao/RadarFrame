//
//  HomepageViewController.m
//  RadarFrame
//
//  Created by guanpu on 13-12-13.
//  Copyright (c) 2013年 les. All rights reserved.
//

#import "HomepageViewController.h"
#import "AppDelegate.h"
#import "SettingViewController.h"
#import "UIViewController+CWPopup.h"

@interface HomepageViewController ()
@property (strong,nonatomic) NSString *paths;
@end

@implementation HomepageViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        UIImage *image = [UIImage imageNamed:@"hp.png"];
        UIImage *selectedImage = [UIImage imageNamed:@"homepage.png"];
        image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:@"首页" image:image selectedImage:selectedImage];
        self.tabBarItem = item;
        loading = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(self.view.center.x, self.view.center.y, 10.0, 10.0)];
        [loading setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
        loading.hidesWhenStopped = YES;
        [self.view addSubview:loading];
        [loading startAnimating];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    CGRect rect = CGRectMake(0.0, 20.0, 1024.0, 748.0);
    myWebView = [[UIWebView alloc] initWithFrame:rect];
    [[myWebView.subviews objectAtIndex:0] setBounces:NO];
    myWebView.delegate = self;
    [self.view addSubview:myWebView];
    [myWebView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg.png"]]];
    NSString *path1 = [[NSBundle mainBundle] pathForResource:@"1" ofType:@"png"];
    NSString *path2 = [[NSBundle mainBundle] pathForResource:@"2" ofType:@"png"];
    self.paths =[[path1 stringByAppendingString:@","] stringByAppendingString:path2];
    NSString *path3 = [[NSBundle mainBundle] pathForResource:@"3" ofType:@"png"];
    self.paths =[[self.paths stringByAppendingString:@","] stringByAppendingString:path3];
    NSString *path4 = [[NSBundle mainBundle] pathForResource:@"4" ofType:@"png"];
    self.paths =[[self.paths stringByAppendingString:@","] stringByAppendingString:path4];
    
    AppDelegate *myDelegate = [[UIApplication sharedApplication] delegate];
    NSString *url =[NSString stringWithFormat:@"%@/src/homepage.html",myDelegate.URL];
//    NSString *string = @"http://192.168.17.107:8081/src/homepage.html";
	[myWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]]];
    /*if (!webView.isLoading) {
        NSLog(@"i com here");
        [self.loading stopAnimating];
        [webView stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat: @"loadNativeImage(%@)",self.paths]];
    }*/
    self.useBlurForPopup = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)webViewDidFinishLoad:(UIWebView *)webView{
    [loading stopAnimating];
    [webView stringByEvaluatingJavaScriptFromString:@"loadNativeImage()"];
}

- (void)presentPop
{
    
    SettingViewController *popViewController = [[SettingViewController alloc] initWithNibName:@"SettingViewController" bundle:nil];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:popViewController];
    navigationController.view.frame = CGRectMake(0, 40, 500, 600);
    
    UIToolbar *toolBar = [[UIToolbar alloc] init];
    toolBar.backgroundColor = [UIColor whiteColor];
    UIBarButtonItem * item0 = [[UIBarButtonItem alloc] initWithTitle:@"关闭" style:UIBarButtonItemStyleDone target:self action:@selector(closeAction:)];
    [toolBar setItems:[NSArray arrayWithObjects:item0,nil] animated:YES];
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
