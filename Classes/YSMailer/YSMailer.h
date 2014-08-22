//
//  YSMailer.h
//  YSMailerExample
//
//  Created by Yu Sugawara on 2014/08/22.
//  Copyright (c) 2014年 Yu Sugawara. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YSMailer : NSObject

+ (void)showCompseViewControllerWithRecipients:(NSArray*)recipients
                                       subject:(NSString*)subject
                                   messageBody:(NSString*)messageBody
                                        isHTML:(BOOL)isHTML;

@end
