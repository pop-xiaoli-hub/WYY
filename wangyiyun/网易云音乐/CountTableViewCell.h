//
//  CountTableViewCell.h
//  网易云音乐
//
//  Created by xiaoli pop on 2025/6/19.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CountTableViewCell : UITableViewCell
@property (nonatomic, strong)UILabel* label;
@property (nonatomic, strong)UISegmentedControl* segmentControl;
@property (nonatomic, copy)NSString* count;
@property (nonatomic, strong)UIScrollView* scrollView;

@end

NS_ASSUME_NONNULL_END
