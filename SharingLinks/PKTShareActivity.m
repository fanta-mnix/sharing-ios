//
//  PKTShareActivity.m
//  SharingLinks
//
//  Created by Rafael Fantini da Costa on 9/23/15.
//  Copyright © 2015 Rafael Fantini da Costa. All rights reserved.
//

#import "PKTShareActivity.h"

#import <Social/Social.h>

NSString * const PKTShareActivityType = @"com.movile.playkids.talk.activity.Share";

@interface PKTShareActivity ()

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSURL *url;

@end

@implementation PKTShareActivity

+ (UIActivityCategory)activityCategory {
    return UIActivityCategoryShare;
}

- (NSString *)activityType {
    return PKTShareActivityType;
}

- (NSString *)activityTitle {
    return @"Awesome";
}

- (UIImage *)activityImage {
    return [UIImage imageNamed:@"icon"];
}

- (BOOL)canPerformWithActivityItems:(NSArray *)activityItems {
    if (activityItems.count != 2) {
        return NO;
    }
    if (![activityItems[0] isKindOfClass:[NSString class]]) {
        return NO;
    }
    if (![activityItems[1] isKindOfClass:[NSURL class]]) {
        return NO;
    }
    
    return YES;
}

- (void)prepareWithActivityItems:(NSArray *)activityItems {
    NSLog(@"Preparing");
    // Do stuff before sharing takes place. e.g.: load file from disk
    self.title = activityItems[0];
    self.url = activityItems[1];
}

- (UIViewController *)activityViewController {
    SLComposeViewController *controller = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
    [controller setInitialText:self.title]; // Will not show if Facebook app is installed
    [controller addURL:self.url];
    return controller;
}

//- (void)performActivity {
//    [[UIApplication sharedApplication] openURL:self.url];
//}

@end
