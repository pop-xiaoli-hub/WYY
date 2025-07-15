//
//  CountTableViewCell.m
//  网易云音乐
//
//  Created by xiaoli pop on 2025/6/19.
//

#import "CountTableViewCell.h"

@implementation CountTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UIImage* image = [UIImage imageNamed:@"pic.jpg"];
        UIImageView* imageView = [[UIImageView alloc] initWithImage:image];
    }
    return self;
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
