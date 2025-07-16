//
//  SearchTableViewCell.h
//  网易云音乐
//
//  Created by xiaoli pop on 2025/6/16.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SearchTableViewCell : UITableViewCell<UIScrollViewDelegate>
@property (nonatomic, strong)UIScrollView* scrollView;
@property (nonatomic, strong)UIScrollView* scrollView02;
@property (nonatomic, strong)UIScrollView* scrollView03;
@property (nonatomic, strong)UIPageControl* pageControl;
@property (nonatomic, strong, nullable)NSTimer* timer;
- (void)replaceTimer:(NSString* )reuseIdentifier;
@end

NS_ASSUME_NONNULL_END
