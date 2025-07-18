//
//  CountTableViewCell.m
//  网易云音乐
//
//  Created by xiaoli pop on 2025/6/19.
//

#import "CountTableViewCell.h"
#import "DrawVC.h"
@implementation CountTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if ([self.reuseIdentifier isEqualToString:@"ViewCell01"]) {
        [self createHeader];
    } else if ([self.reuseIdentifier isEqualToString:@"ViewCell02"]) {
        [self creatStackView];
        [self createSegmentControl];
        [self createScrollView];
    }
    return self;
}
- (void)createScrollView {
    self.scrollView = [[UIScrollView alloc] init];
    self.scrollView.frame = CGRectMake(0, 195, [[UIScreen mainScreen] bounds].size.width, 800);
    self.scrollView.contentSize = CGSizeMake([[UIScreen mainScreen] bounds].size.width * 3, 800);
    self.scrollView.backgroundColor = [UIColor clearColor];
    self.scrollView.pagingEnabled = YES;
    self.scrollView.scrollEnabled = YES;
    self.scrollView.bounces = NO;
    self.scrollView.delegate = self;
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

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat contentx = self.scrollView.contentOffset.x;
    CGFloat w = scrollView.frame.size.width;
    CGFloat index = contentx / w;
    NSInteger select = (NSInteger)(index + 0.5);
    if (select >= self.segmentControl.numberOfSegments) {
        select =self.segmentControl.numberOfSegments - 1;
    }
    if (self.segmentControl.selectedSegmentIndex != select)
    {
        self.segmentControl.selectedSegmentIndex = select;
    }    //self.segmentControl.selectedSegmentIndex = contentx / [[UIScreen mainScreen] bounds].size.width;
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

- (void)createSegmentControl {
    self.segmentControl = [[UISegmentedControl alloc] init];
    self.segmentControl.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:self.segmentControl];
    [NSLayoutConstraint activateConstraints:@[
            [self.segmentControl.centerXAnchor constraintEqualToAnchor:self.contentView.centerXAnchor],
            [self.segmentControl.topAnchor constraintEqualToAnchor:self.contentView.topAnchor constant:160],
            [self.segmentControl.widthAnchor constraintEqualToConstant:380],
            [self.segmentControl.heightAnchor constraintEqualToConstant:30]
    ]];
    [self.segmentControl insertSegmentWithTitle:@"音乐" atIndex:0 animated:YES];
    [self.segmentControl insertSegmentWithTitle:@"播客" atIndex:1 animated:YES];
    [self.segmentControl insertSegmentWithTitle:@"笔记" atIndex:2 animated:YES];
    self.segmentControl.selectedSegmentIndex = 0;
    [self.segmentControl addTarget:self action:@selector(segChanged) forControlEvents:UIControlEventValueChanged];
}

- (void)segChanged {
    NSInteger selected = self.segmentControl.selectedSegmentIndex;
    CGFloat offsetx = selected * self.scrollView.bounds.size.width;
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.scrollView.contentOffset = CGPointMake(offsetx, 0);
    } completion:nil];
    /*
     options:决定动画变速：
     UIViewAnimationOptionCurveEaseInout:慢快慢
     --EaseIn:慢-快
     --EaseOut:快-慢
     --Linnear;匀速
     
     animations:动画块：需要变化的动画
     */
}

- (void)creatStackView {
    self.backgroundColor = [UIColor clearColor];
    UIStackView* stackView = [[UIStackView alloc] init];
    stackView.translatesAutoresizingMaskIntoConstraints = NO;
    
    stackView.axis = UILayoutConstraintAxisHorizontal;
    stackView.distribution = UIStackViewDistributionFillEqually;
    stackView.spacing = 10;
    for (int i = 0; i < 4; i++) {
        UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setImage:[UIImage imageNamed:[NSString stringWithFormat:@"b%d.png",i + 1]] forState:UIControlStateNormal];
        [stackView addArrangedSubview:button];
        button.tag = 101 + i;
        [button addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    [self.contentView addSubview:stackView];
    [NSLayoutConstraint activateConstraints:@[
                [stackView.centerXAnchor constraintEqualToAnchor:self.contentView.centerXAnchor],
                [stackView.topAnchor constraintEqualToAnchor:self.contentView.topAnchor constant:10],
                [stackView.heightAnchor constraintEqualToConstant:50],
                [stackView.widthAnchor constraintEqualToConstant:300]
    ]];
    UIStackView* stackView2 = [[UIStackView alloc] init];
    stackView2.translatesAutoresizingMaskIntoConstraints = NO;
    stackView2.axis = UILayoutConstraintAxisHorizontal;
    stackView2.distribution = UIStackViewDistributionFillEqually;
    stackView.spacing = 10;
    NSArray* array = @[@"好友", @"收藏", @"历史", @"装扮"];
    for (int i = 0; i < 4; i++) {
        UILabel* label = [[UILabel alloc] init];
        label.text = array[i];
        label.textAlignment = NSTextAlignmentCenter;
        label.backgroundColor = [UIColor clearColor];
        [stackView2 addArrangedSubview:label];
    }
    [self.contentView addSubview:stackView2];
    [NSLayoutConstraint activateConstraints:@[
                [stackView2.centerXAnchor constraintEqualToAnchor:self.contentView.centerXAnchor],
                [stackView2.topAnchor constraintEqualToAnchor:self.contentView.topAnchor constant:60],
                [stackView2.heightAnchor constraintEqualToConstant:15],
                [stackView2.widthAnchor constraintEqualToConstant:312]
    ]];
    
    UIStackView* stackView3 = [[UIStackView alloc] init];
    stackView3.translatesAutoresizingMaskIntoConstraints = NO;
    
    stackView3.axis = UILayoutConstraintAxisHorizontal;
    stackView3.distribution = UIStackViewDistributionFillEqually;
    stackView3.spacing = 10;
    for (int i = 0; i < 4; i++) {
        UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setImage:[UIImage imageNamed:[NSString stringWithFormat:@"c%d.png",i + 1]] forState:UIControlStateNormal];
        [stackView3 addArrangedSubview:button];
        button.tag = 105 + i;
        [button addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    [self.contentView addSubview:stackView3];
    [NSLayoutConstraint activateConstraints:@[
                [stackView3.centerXAnchor constraintEqualToAnchor:self.contentView.centerXAnchor],
                [stackView3.topAnchor constraintEqualToAnchor:self.contentView.topAnchor constant:80],
                [stackView3.heightAnchor constraintEqualToConstant:50],
                [stackView3.widthAnchor constraintEqualToConstant:300]
    ]];
    UIStackView* stackView4 = [[UIStackView alloc] init];
    stackView4.translatesAutoresizingMaskIntoConstraints = NO;
    stackView4.axis = UILayoutConstraintAxisHorizontal;
    stackView4.distribution = UIStackViewDistributionFillEqually;
    stackView.spacing = 10;
    NSArray* array2 = @[@"睡眠", @"书籍", @"设置", @"云盘"];
    for (int i = 0; i < 4; i++) {
        UILabel* label = [[UILabel alloc] init];
        label.text = array2[i];
        label.textAlignment = NSTextAlignmentCenter;
        label.backgroundColor = [UIColor clearColor];
        [stackView4 addArrangedSubview:label];
    }
    [self.contentView addSubview:stackView4];
    [NSLayoutConstraint activateConstraints:@[
                [stackView4.centerXAnchor constraintEqualToAnchor:self.contentView.centerXAnchor],
                [stackView4.topAnchor constraintEqualToAnchor:self.contentView.topAnchor constant:130],
                [stackView4.heightAnchor constraintEqualToConstant:15],
                [stackView4.widthAnchor constraintEqualToConstant:312]
    ]];
}

- (void)createHeader {
    self.image = [UIImage imageNamed:@"pic2.jpg"];
    self.photoView = [[UIImageView alloc] initWithImage:self.image];
    [self.contentView addSubview:self.photoView];
    self.photoView.clipsToBounds = YES;
    self.photoView.contentMode = UIViewContentModeScaleAspectFill;
    self.photoView.frame = CGRectMake(0, 130, 100, 100);
    self.photoView.center = CGPointMake([[UIScreen mainScreen] bounds].size.width / 2, 55);
    self.photoView.layer.masksToBounds = YES;
    self.photoView.layer.cornerRadius = 50;
    self.photoView.layer.borderWidth = 5;
    self.photoView.layer.borderColor = [UIColor colorWithRed:0.3 green:0.3 blue:0.3 alpha:0.8].CGColor;
    self.backgroundColor = [UIColor clearColor];
    self.photoView.userInteractionEnabled = YES;
    UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pressheader)];
    tap.numberOfTapsRequired = 1;
    tap.numberOfTouchesRequired = 1;
    [self.photoView addGestureRecognizer:tap];
    UILabel* label = [[UILabel alloc] init];
    label.frame = CGRectMake(0, 0, 200, 40);
    label.center = CGPointMake(self.photoView.center.x, 140);
    label.text  = @"情深似海无边际";
    label.font = [UIFont systemFontOfSize:22];
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:label];
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:@"vip2.png"] forState:UIControlStateNormal];
    button.frame = CGRectMake(170, 5, 40, 40);
    [label addSubview:button];
}

- (void)changeheader:(UIImage *)image {
    self.photoView.image = image;
}

- (void)pressheader {
    if (self.CountCellBlock) {
        self.CountCellBlock();
    }
}

- (void)pressButton:(UIButton* )button {
    if (button.tag == 101) {
        NSLog(@"ppp");
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
