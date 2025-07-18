//
//  CountTableViewCell.h
//  网易云音乐
//
//  Created by xiaoli pop on 2025/6/19.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CountTableViewCell : UITableViewCell<UIScrollViewDelegate>
@property (nonatomic, strong)UILabel* label;
@property (nonatomic, strong)UISegmentedControl* segmentControl;
@property (nonatomic, copy)NSString* count;
@property (nonatomic, strong)UIScrollView* scrollView;
@property (nonatomic, copy)void(^CountCellBlock)(void);
@property (nonatomic, strong)UIImage* image;
@property (nonatomic, strong)UIImageView* photoView;
- (void)changeheader:(UIImage* )image ;
@end

NS_ASSUME_NONNULL_END
