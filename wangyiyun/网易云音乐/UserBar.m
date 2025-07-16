//
//  UserBar.m
//  网易云音乐
//
//  Created by xiaoli pop on 2025/6/18.
//

#import "UserBar.h"

@implementation UserBar
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if  (self) {
        self.leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.leftButton setImage:[UIImage imageNamed:@"a1.png"] forState:UIControlStateNormal];
        [self addSubview:self.leftButton];
        self.leftButton.frame = CGRectMake(20, 55, 40, 40);
        self.rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.rightButton setImage:[UIImage imageNamed:@"a2.png"] forState:UIControlStateNormal];
        self.rightButton.frame = CGRectMake([[UIScreen mainScreen] bounds].size.width - 60, 55, 40, 40);
        [self.rightButton addTarget:self action:@selector(pressRightbutton) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.rightButton];
    }
    return self;
}

- (void)pressRightbutton {
    NSLog(@"ppp");
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
