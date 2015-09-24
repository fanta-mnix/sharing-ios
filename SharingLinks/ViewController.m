//
//  ViewController.m
//  SharingLinks
//
//  Created by Rafael Fantini da Costa on 9/23/15.
//  Copyright © 2015 Rafael Fantini da Costa. All rights reserved.
//

#import "ViewController.h"
#import "PKTShareActivity.h"

@interface ViewController () <UIActivityItemSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)share:(id)sender {
    NSURL *url = [NSURL URLWithString:@"https://itunes.apple.com/br/app/playkids-talk-best-messenger/id1020028752?mt=8"];
    
    PKTShareActivity *activity = [PKTShareActivity new];
    
    UIActivityViewController *vc = [[UIActivityViewController alloc]
                                    initWithActivityItems:@[self, url]
                                    applicationActivities:@[activity]];
    
    [self presentViewController:vc animated:YES completion:nil];
}

#pragma mark - UIActivityItemSource methods

- (id)activityViewControllerPlaceholderItem:(UIActivityViewController *)activityViewController {
    return @"Placeholder"; // Used just to determine type. Must match itemForActivityType class
}

- (nullable id)activityViewController:(UIActivityViewController *)activityViewController itemForActivityType:(NSString *)activityType {
    if ([activityType isEqualToString:UIActivityTypePostToTwitter]) {
        return @"Posting to Twitter!";
    } else {
        return @"Fallback title";
    }
}

@end
