//
//  MoreVC.m
//  网易云音乐
//
//  Created by xiaoli pop on 2025/7/15.
//

#import "MoreVC.h"

@interface MoreVC ()

@end

@implementation MoreVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.95];
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    self.view.frame = CGRectMake(0, 0, screenBounds.size.width * (4.0 / 5.0), screenBounds.size.height);
}

- (void)dismissViewController {
    [self dismissViewControllerAnimated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
