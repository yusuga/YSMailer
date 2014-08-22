//
//  ViewController.m
//  YSMailerExample
//
//  Created by Yu Sugawara on 2014/08/22.
//  Copyright (c) 2014年 Yu Sugawara. All rights reserved.
//

#import "ViewController.h"
#import "YSMailer.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)mailButtonDidPush:(id)sender
{
    [YSMailer showCompseViewControllerWithRecipients:@[@"xxx@yyy.zzz"]
                                             subject:@"subject"
                                         messageBody:@"messageBody"
                                              isHTML:NO];
}

@end
