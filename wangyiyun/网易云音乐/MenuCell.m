//
//  MenuCell.m
//  网易云音乐
//
//  Created by xiaoli pop on 2025/7/16.
//

#import "MenuCell.h"

@implementation MenuCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if ([self.reuseIdentifier isEqualToString:@"cell01"]) {
        self.iView = [[UIImageView alloc] init];
        self.iView.frame = CGRectMake(10, 15, 40, 40);
        self.iView.clipsToBounds = YES;
        self.iView.contentMode = UIViewContentModeScaleAspectFill;
        self.label = [[UILabel alloc] init];
        self.label.frame = CGRectMake(65, 15, 200, 40);
        self.label.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:self.iView];
        [self.contentView addSubview:self.label];
    } else {
        self.iView = [[UIImageView alloc] init];
        self.iView.frame = CGRectMake(10, 15, 40, 40);
        self.iView.clipsToBounds = YES;
        self.iView.contentMode = UIViewContentModeScaleAspectFill;
        self.label = [[UILabel alloc] init];
        self.label.frame = CGRectMake(65, 15, 200, 40);
        self.label.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:self.iView];
        [self.contentView addSubview:self.label];
        self.Switch = [[UISwitch alloc] init];
        self.Switch.frame = CGRectMake(self.frame.size.width - 10, 20, 70, 40);
        [self.contentView addSubview:self.Switch];
    }
    return self;
}
@end
