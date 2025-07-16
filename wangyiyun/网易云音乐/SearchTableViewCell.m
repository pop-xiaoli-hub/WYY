#import "SearchTableViewCell.h"

@implementation SearchTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if ([self.reuseIdentifier isEqualToString:@"Cell01"]) {
        self.backgroundColor = [UIColor clearColor];
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
        self.backgroundColor = [UIColor clearColor];
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
        self.backgroundColor = [UIColor clearColor];
        UILabel* label = [[UILabel alloc] init];
        label.frame = CGRectMake(15, 0, [[UIScreen mainScreen] bounds].size.width, 40);
        label.text = @"根据你喜爱的歌曲推荐>";
        label.font = [UIFont systemFontOfSize:18];
        label.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:label];
    } else if ([self.reuseIdentifier isEqualToString:@"cell04"]) {
        self.backgroundColor = [UIColor clearColor];
        [self createScrollView];
    } else if ([self.reuseIdentifier isEqualToString:@"cell05"]) {
        self.backgroundColor = [UIColor clearColor];
        UILabel* label = [[UILabel alloc] init];
        label.frame = CGRectMake(15, 0, [[UIScreen mainScreen] bounds].size.width, 40);
        label.text = @"阿土的雷达歌单>";
        label.font = [UIFont systemFontOfSize:18];
        label.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:label];
    } else if ([self.reuseIdentifier isEqualToString:@"cell06"]){
        self.backgroundColor = [UIColor clearColor];
        self.scrollView03 = [[UIScrollView alloc] init];
        self.scrollView03.frame = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, 130);
        self.scrollView03.pagingEnabled = NO;
        self.scrollView03.scrollEnabled = YES;
        self.scrollView03.contentSize = CGSizeMake(670, 130);
        self.scrollView03.showsHorizontalScrollIndicator = NO;
        self.scrollView03.bounces = NO;
        for (int i  = 1; i <= 5; i++) {
            UIImageView* view = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"a%d.jpg", i]]];
            view.frame = CGRectMake(11 * i + (i - 1) * 120, 5, 120, 120);
            view.contentMode = UIViewContentModeScaleAspectFill;
            view.clipsToBounds = YES;
            view.layer.masksToBounds = YES;
            view.layer.cornerRadius = 15;
            [self.scrollView03 addSubview:view];
        }
        [self.contentView addSubview:self.scrollView03];
    } else if ([self.reuseIdentifier isEqualToString:@"cell07"]) {
        self.backgroundColor = [UIColor clearColor];
        [self createScrollView];
        
    }
    return self;
}

- (void)createScrollView {
    self.scrollView = [[UIScrollView alloc] init];
    self.scrollView.frame = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, 800);
    self.scrollView.contentSize = CGSizeMake([[UIScreen mainScreen] bounds].size.width * 3, 800);
    self.scrollView.backgroundColor = [UIColor clearColor];
    self.scrollView.pagingEnabled = YES;
    self.scrollView.scrollEnabled = YES;
    self.scrollView.bounces = NO;
    [self.contentView addSubview:self.scrollView];
    UIImageView* view1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"a1.jpg"]];
    UIImageView* view2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"a2.jpg"]];
    UIImageView* view3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"a3.jpg"]];
    view1.userInteractionEnabled = YES;
    view2.userInteractionEnabled = YES;
    view3.userInteractionEnabled = YES;
    view1.frame = CGRectMake(20, 5, 60, 60);
    view2.frame = CGRectMake(20, 75, 60, 60);
    view3.frame = CGRectMake(20, 145, 60, 60);
    view1.clipsToBounds = YES;
    view2.clipsToBounds = YES;
    view3.clipsToBounds = YES;
    view1.contentMode = UIViewContentModeScaleAspectFill;
    view2.contentMode = UIViewContentModeScaleAspectFill;
    view3.contentMode = UIViewContentModeScaleAspectFill;
    view1.layer.masksToBounds = YES;
    view2.layer.masksToBounds = YES;
    view3.layer.masksToBounds = YES;
    view1.layer.cornerRadius = 10;
    view2.layer.cornerRadius = 10;
    view3.layer.cornerRadius = 10;
    UIButton* button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    UIButton* button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    UIButton* button3 = [UIButton buttonWithType:UIButtonTypeCustom];
    button1.frame = CGRectMake(340, 25, 28, 28);
    button2.frame = CGRectMake(340, 95, 28, 28);
    button3.frame = CGRectMake(340, 165, 28, 28);
    [button1 setImage:[UIImage imageNamed:@"aixin1.png"] forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(pressHeart:) forControlEvents:UIControlEventTouchDown];
    [button2 setImage:[UIImage imageNamed:@"aixin1.png"] forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(pressHeart:) forControlEvents:UIControlEventTouchDown];
    [button3 setImage:[UIImage imageNamed:@"aixin1.png"] forState:UIControlStateNormal];
    [button3 addTarget:self action:@selector(pressHeart:) forControlEvents:UIControlEventTouchDown];
    
    UILabel* label1 = [[UILabel alloc] init];
    label1.text = @"我是一只小猪";
    label1.font = [UIFont systemFontOfSize:16];
    label1.frame = CGRectMake(90, 15, 200, 20);
    label1.backgroundColor = [UIColor clearColor];
    [self.scrollView addSubview:label1];
    UILabel* label01 = [[UILabel alloc] init];
    label01.text = @"作者  阿土";
    label01.font = [UIFont systemFontOfSize:13];
    label01.frame = CGRectMake(90, 40, 200, 20);
    label01.backgroundColor = [UIColor clearColor];
    [self.scrollView addSubview:label01];
    
    
    UILabel* label2 = [[UILabel alloc] init];
    label2.text = @"明天我要娶了你";
    label2.font = [UIFont systemFontOfSize:16];
    label2.frame = CGRectMake(90, 85, 200, 20);
    label2.backgroundColor = [UIColor clearColor];
    [self.scrollView addSubview:label2];
    UILabel* label02 = [[UILabel alloc] init];
    label02.text = @"作者  郑燕子";
    label02.font = [UIFont systemFontOfSize:13];
    label02.frame = CGRectMake(90, 110, 200, 20);
    label02.backgroundColor = [UIColor clearColor];
    [self.scrollView addSubview:label02];
    
    
    UILabel* label3 = [[UILabel alloc] init];
    label3.text = @"今天你要嫁给我";
    label3.font = [UIFont systemFontOfSize:16];
    label3.frame = CGRectMake(90, 155, 200, 20);
    label3.backgroundColor = [UIColor clearColor];
    [self.scrollView addSubview:label3];
    UILabel* label03 = [[UILabel alloc] init];
    label03.text = @"作者  孙燕姿";
    label03.font = [UIFont systemFontOfSize:13];
    label03.frame = CGRectMake(90, 180, 200, 20);
    label03.backgroundColor = [UIColor clearColor];
    [self.scrollView addSubview:label03];
   
    [self.scrollView addSubview:view1];
    [self.scrollView addSubview:view2];
    [self.scrollView addSubview:view3];
    [self.scrollView addSubview:button1];
    [self.scrollView addSubview:button2];
    [self.scrollView addSubview:button3];
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

//- (void)prepareForReuse {
//    [super prepareForReuse];
//    if (self.scrollView) {
//        self.scrollView.contentOffset = CGPointMake([[UIScreen mainScreen] bounds].size.width, 0);
//    }
//}

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
