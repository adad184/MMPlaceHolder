//
//  MMViewController.m
//  demo
//
//  Created by Ralph Li on 9/9/14.
//  Copyright (c) 2014 LJC. All rights reserved.
//

#import "MMViewController.h"
#import "MMPlaceHolder.h"

@interface MMViewController ()

@end

@implementation MMViewController

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImageView *iv1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"img.png"]];
    UIImageView *iv2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"img.png"]];
    UIImageView *iv3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"img.png"]];
    UIImageView *iv4 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"img.png"]];
    UIImageView *iv5 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"img.png"]];
    UIImageView *iv6 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"img.png"]];
    
    [self.view addSubview:iv1];
    [self.view addSubview:iv2];
    [self.view addSubview:iv3];
    [self.view addSubview:iv4];
    [self.view addSubview:iv5];
    [self.view addSubview:iv6];
    
    [iv2 showPlaceHolder];
    [iv3 showPlaceHolderWithLineColor:[UIColor greenColor]];
    [iv4 showPlaceHolderWithLineColor:[UIColor yellowColor] backColor:[UIColor colorWithRed:0.1 green:0.1 blue:0.1 alpha:0.5]];
    [iv5 showPlaceHolderWithLineColor:[UIColor whiteColor] backColor:[UIColor colorWithRed:1.0 green:0.5 blue:0 alpha:0.8] arrowSize:12];
    [iv6 showPlaceHolderWithLineColor:[UIColor whiteColor] backColor:[UIColor blackColor] arrowSize:25 lineWidth:3 frameWidth:5 frameColor:[UIColor redColor]];
    
    CGSize imgSize = CGSizeMake(130, 130);
    CGFloat windowWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat padding = imgSize.height+20;
    
    iv1.frame = CGRectMake(0,0, imgSize.width, imgSize.height);
    iv2.frame = CGRectMake(0,0, imgSize.width, imgSize.height);
    iv3.frame = CGRectMake(0,0, imgSize.width, imgSize.height);
    iv4.frame = CGRectMake(0,0, imgSize.width, imgSize.height);
    iv5.frame = CGRectMake(0,0, imgSize.width, imgSize.height);
    iv6.frame = CGRectMake(0,0, imgSize.width, imgSize.height);
    
    iv1.center = CGPointMake(windowWidth*0.25, 64+padding*0.5);
    iv2.center = CGPointMake(windowWidth*0.75, 64+padding*0.5);
    iv3.center = CGPointMake(windowWidth*0.25, 64+padding*1.5);
    iv4.center = CGPointMake(windowWidth*0.75, 64+padding*1.5);
    iv5.center = CGPointMake(windowWidth*0.25, 64+padding*2.5);
    iv6.center = CGPointMake(windowWidth*0.75, 64+padding*2.5);

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
