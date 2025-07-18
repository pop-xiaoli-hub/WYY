//
//  DrawVC.m
//  网易云音乐
//
//  Created by xiaoli pop on 2025/7/15.
//

#import "DrawVC.h"

@interface DrawVC ()


@end

@implementation DrawVC

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.tabBarController.tabBarHidden = YES;
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    self.scrollView = [[UIScrollView alloc] initWithFrame:screenBounds];
    self.scrollView.contentSize = CGSizeMake(screenBounds.size.width, screenBounds.size.height * 1.5);
    self.scrollView.backgroundColor = [UIColor clearColor];
    for (int i = 0; i < 9; i++) {
        NSString* strName = [NSString stringWithFormat:@"photo0%d.jpg", i + 1];
        UIImage* image = [UIImage imageNamed:strName];
        UIImageView* iView = [[UIImageView alloc] initWithImage:image];
        iView.frame = CGRectMake(20 + (i % 3) * 125, 15 + (i / 3) * 165, 110, 120);
        iView.backgroundColor = [UIColor clearColor];
        iView.layer.masksToBounds = YES;
        iView.layer.cornerRadius = 10;
        [self.scrollView addSubview:iView];
        iView.userInteractionEnabled = YES;
        UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(chooseToChange:)];
        tap.numberOfTapsRequired = 1;
        tap.numberOfTouchesRequired = 1;
        [iView addGestureRecognizer:tap];
    }
    [self.view addSubview: self.scrollView];
}

- (void)chooseToChange:(UITapGestureRecognizer*)tap {
    UIImageView* imageView = (UIImageView*)tap.view;
    imageView.layer.masksToBounds = YES;
    imageView.layer.borderWidth = 5;
    imageView.layer.borderColor = [UIColor yellowColor].CGColor;
    UIAlertController* alertController = [UIAlertController alertControllerWithTitle:@"警告" message:@"是否确认更换" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* cancleAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [alertController addAction:cancleAction];
    UIAlertAction* confirmAction = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        UIImageView* imageView = (UIImageView*)tap.view;
        UIImage* image = imageView.image;
        NSDictionary* userInfo = @{@"photo" : image};
        [[NSNotificationCenter defaultCenter] postNotificationName:@"note2" object:nil userInfo:userInfo];
        [self.navigationController popToRootViewControllerAnimated:YES];
    }];
    [alertController addAction:confirmAction];
    [self presentViewController:alertController animated:YES completion:nil];
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
