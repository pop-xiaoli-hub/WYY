#import "SearchTableViewCell.h"

@implementation SearchTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if ([self.reuseIdentifier isEqualToString:@"Cell01"]) {
        self.scrollView = [[UIScrollView alloc] init];
        self.scrollView.frame = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, 150);
        self.scrollView.pagingEnabled = YES;
        self.scrollView.scrollEnabled = YES;
        self.scrollView.bounces = NO;
        self.scrollView.delegate = self;
        self.scrollView.backgroundColor = [UIColor clearColor];
        self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width * 10, 150);
        CGFloat w = self.scrollView.frame.size.width;
        for (int i = 0; i < 10; i++) {
            UIImage* image = [[UIImage alloc] init];
            if (i == 0) {
                image = [UIImage imageNamed:[NSString stringWithFormat:@"p8.jpg"]];
            } else if (i == 9) {
                image = [UIImage imageNamed:[NSString stringWithFormat:@"p1.jpg"]];
            } else {
                image = [UIImage imageNamed:[NSString stringWithFormat:@"p%d.jpg", i]];
            }
            UIImageView* iView = [[UIImageView alloc] initWithImage:image];
            iView.frame = CGRectMake(10 + w * i, 0, w - 20, 150);
            iView.contentMode = UIViewContentModeScaleAspectFill;
            iView.clipsToBounds = YES;
            iView.layer.cornerRadius = 20;
            [self.scrollView addSubview:iView];
        }
        [self.contentView addSubview:self.scrollView];
        [self replaceTimer:@"cell01"];
    } else if ([self.reuseIdentifier isEqualToString:@"Cell02"]) {
        self.scrollView02 = [[UIScrollView alloc] init];
        self.scrollView02.frame = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, 70);
        self.scrollView02.pagingEnabled = NO;
        self.scrollView02.scrollEnabled = YES;
        self.scrollView02.bounces = NO;
        self.scrollView02.showsHorizontalScrollIndicator = NO;
        self.scrollView02.contentSize = CGSizeMake(self.scrollView02.frame.size.width * 2, 60);
        for (int i = 1; i <= 10; i++) {
            NSString* str = [NSString stringWithFormat:@"search%d.png", i];
            UIImage* image = [UIImage imageNamed:str];
            UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
            [button setImage:image forState:UIControlStateNormal];
            if (i <= 5) {
                button.frame = CGRectMake(15 + (i - 1) * 80, 5, 40, 40);
            } else {
                button.frame = CGRectMake(self.scrollView02.frame.size.width + 15 + (i - 6) * 80, 5, 40, 40);
            }
            [self.scrollView02 addSubview:button];
        }
                self.scrollView02.delegate = self;
        NSArray* array = @[@"歌单列表", @"每日推荐", @"我的电台", @"我的听书", @"每日榜单", @"我的好友", @"我的会员", @"运动听歌", @"个性装扮", @"我的唱片"];
        for (int i = 0; i < 10; i++) {
            UILabel* label = [[UILabel alloc] init];
            if (i <= 4) {
                label.frame = CGRectMake(15 + i * 80, 47, 40, 15);
            } else {
                label.frame = CGRectMake(self.scrollView02.frame.size.width + 15 + (i - 5) * 80, 47, 40, 15);
            }
            label.text = [array objectAtIndex:i];
            label.font = [UIFont systemFontOfSize:10];
            label.textAlignment = NSTextAlignmentCenter;
            label.backgroundColor = [UIColor clearColor];
            [self.scrollView02 addSubview:label];
        }
        [self.contentView addSubview:self.scrollView02];
    } else if ([self.reuseIdentifier isEqualToString:@"Cell03"]) {
        UILabel* label = [[UILabel alloc] init];
        label.frame = CGRectMake(15, 0, [[UIScreen mainScreen] bounds].size.width, 40);
        label.text = @"根据你喜爱的歌曲推荐>";
        label.font = [UIFont systemFontOfSize:18];
        label.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:label];
    } else if ([self.reuseIdentifier isEqualToString:@"cell04"]) {
        UIImageView* view1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"1.jpg"]];
        UIImageView* view2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"2.jpg"]];
        UIImageView* view3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"3.jpg"]];
        view1.userInteractionEnabled = YES;
        view2.userInteractionEnabled = YES;
        view3.userInteractionEnabled = YES;
        view1.frame = CGRectMake(0, 5, [[UIScreen mainScreen] bounds].size.width, 60);
        view2.frame = CGRectMake(0, 75, [[UIScreen mainScreen] bounds].size.width, 60);
        view3.frame = CGRectMake(0, 145, [[UIScreen mainScreen] bounds].size.width, 60);
        view1.clipsToBounds = YES;
        view2.clipsToBounds = YES;
        view3.clipsToBounds = YES;
        view1.contentMode = UIViewContentModeScaleAspectFill;
        view2.contentMode = UIViewContentModeScaleAspectFill;
        view3.contentMode = UIViewContentModeScaleAspectFill;
        UIButton* button1 = [UIButton buttonWithType:UIButtonTypeCustom];
        UIButton* button2 = [UIButton buttonWithType:UIButtonTypeCustom];
        UIButton* button3 = [UIButton buttonWithType:UIButtonTypeCustom];
        button1.frame = CGRectMake(348, 15, 28, 28);
        button2.frame = CGRectMake(348, 15, 28, 28);
        button3.frame = CGRectMake(348, 15, 28, 28);
        [button1 setImage:[UIImage imageNamed:@"aixin1.png"] forState:UIControlStateNormal];
        [button1 addTarget:self action:@selector(pressHeart:) forControlEvents:UIControlEventTouchDown];
        [button2 setImage:[UIImage imageNamed:@"aixin1.png"] forState:UIControlStateNormal];
        [button2 addTarget:self action:@selector(pressHeart:) forControlEvents:UIControlEventTouchDown];
        [button3 setImage:[UIImage imageNamed:@"aixin1.png"] forState:UIControlStateNormal];
        [button3 addTarget:self action:@selector(pressHeart:) forControlEvents:UIControlEventTouchDown];
       
        [view1 addSubview:button1];
        [view2 addSubview:button2];
        [view3 addSubview:button3];
        [self.contentView addSubview:view1];
        [self.contentView addSubview:view2];
        [self.contentView addSubview:view3];
        
    }
    return self;
}



- (void)pressHeart:(UIButton* )button {
    if (button.selected == NO) {
        [button setImage:[UIImage imageNamed:@"aixin2.png"] forState:UIControlStateNormal];
        button.selected = YES;
    } else {
        button.selected = NO;
        [button setImage:[UIImage imageNamed:@"aixin1.png"] forState:UIControlStateNormal];
    }
}

- (void)replaceTimer:(NSString* )reuseIdentifier {
    if ([reuseIdentifier isEqualToString:@"cell01"]) {
        [self setTimer];
    }
}

- (void)prepareForReuse {
    [super prepareForReuse];
    if (self.scrollView) {
        self.scrollView.contentOffset = CGPointMake([[UIScreen mainScreen] bounds].size.width, 0);
    }
}

- (void)createPageControl {
    self.pageControl = [[UIPageControl alloc] init];
    self.pageControl.numberOfPages = 8;
    self.pageControl.currentPage = 0;
    self.pageControl.pageIndicatorTintColor = [UIColor grayColor];
    self.pageControl.currentPageIndicatorTintColor = [UIColor systemBlueColor];
    self.pageControl.translatesAutoresizingMaskIntoConstraints = NO;
}


- (void)setTimer {
    if (self.timer) {
        [self.timer invalidate];
        self.timer = nil;
    }
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(nextPage) userInfo:nil repeats:YES];

}

- (void)nextPage {
    CGFloat contentoffsetX = self.scrollView.contentOffset.x;
    CGFloat sceenWidth = self.scrollView.frame.size.width;
    CGFloat contentsizeWidth = self.scrollView.contentSize.width;
    if (contentoffsetX == contentsizeWidth - sceenWidth) {
        contentoffsetX = sceenWidth;
    } else {
        contentoffsetX += sceenWidth;
    }
    [self.scrollView setContentOffset:CGPointMake(contentoffsetX, 0) animated:YES];
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat contentOffsetX = scrollView.contentOffset.x;
    CGFloat screenWidth = CGRectGetWidth(scrollView.frame);
    CGFloat contentWidth = scrollView.contentSize.width;
    
    if (contentOffsetX >= contentWidth - screenWidth) {
        [scrollView setContentOffset:CGPointMake(screenWidth, 0) animated:NO];
    } else if (contentOffsetX < screenWidth - scrollView.frame.size.width) {
        [scrollView setContentOffset:CGPointMake(contentWidth - 2 * screenWidth, 0) animated:NO];
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
