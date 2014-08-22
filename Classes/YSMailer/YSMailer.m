//
//  YSMailer.m
//  YSMailerExample
//
//  Created by Yu Sugawara on 2014/08/22.
//  Copyright (c) 2014年 Yu Sugawara. All rights reserved.
//

#import "YSMailer.h"
@import MessageUI;

NSString *YSMailerLocalizedString(NSString *key)
{
    return NSLocalizedStringFromTable(key, @"YSMailerLocalizedString", nil);
}

@interface YSMailer () <MFMailComposeViewControllerDelegate>

@end

@implementation YSMailer

+ (instancetype)sharedInstance
{
    static id __sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __sharedInstance =  [[self alloc] init];
    });
    return __sharedInstance;
}

+ (void)showCompseViewControllerWithRecipients:(NSArray*)recipients
                                       subject:(NSString*)subject
                                   messageBody:(NSString*)messageBody
                                        isHTML:(BOOL)isHTML
{
    [[self sharedInstance] showCompseViewControllerWithRecipients:recipients
                                                          subject:subject
                                                      messageBody:messageBody
                                                           isHTML:isHTML];
}

- (void)showCompseViewControllerWithRecipients:(NSArray*)recipients
                                       subject:(NSString*)subject
                                   messageBody:(NSString*)messageBody
                                        isHTML:(BOOL)isHTML
{
    if ([MFMailComposeViewController canSendMail]) {
        MFMailComposeViewController *vc = [[MFMailComposeViewController alloc] init];
        vc.mailComposeDelegate = self;
        [vc setToRecipients:recipients];
        [vc setSubject:subject];
        [vc setMessageBody:messageBody isHTML:isHTML];
        [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:vc
                                                                                     animated:YES
                                                                                   completion:nil];
    } else {
        [[[UIAlertView alloc] initWithTitle:YSMailerLocalizedString(@"Error Mail Title")
                                    message:YSMailerLocalizedString(@"Error Mail Desc")
                                   delegate:nil
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil] show];
    }
}

- (void)mailComposeController:(MFMailComposeViewController *)controller
          didFinishWithResult:(MFMailComposeResult)result
                        error:(NSError *)error
{
    if (error) {
        [[[UIAlertView alloc] initWithTitle:YSMailerLocalizedString(@"Failed to send E-mail")
                                    message:error.localizedDescription
                                   delegate:nil
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil] show];
    }
    [controller dismissViewControllerAnimated:YES completion:nil];
}

@end
