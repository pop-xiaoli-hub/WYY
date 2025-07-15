//
//  showStartView.m
//  网易云音乐
//
//  Created by xiaoli pop on 2025/6/17.
//

#import "showStartView.h"

@interface showStartView ()
@property (nonatomic, strong) NSTimer* timer;
@property (nonatomic, assign) NSInteger delayTime;
@end

@implementation showStartView

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage* image = [UIImage imageNamed:@"StartView.jpg"];
    UIImageView* imageview = [[UIImageView alloc] initWithImage:image];
    imageview.frame =[[UIScreen mainScreen] bounds];
    imageview.contentMode = UIViewContentModeScaleAspectFit;
    imageview.clipsToBounds = YES;
    [self.view addSubview:imageview];
    [self setTimer];
    
}

- (void)setTimer {
    self.delayTime = 3.0;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateTime) userInfo:nil repeats:YES];
}

- (void)updateTime {
    self.delayTime--;
    if (self.delayTime == 0) {
        [self.timer invalidate];
        [self dismissViewControllerAnimated:YES completion:nil];
    }
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
