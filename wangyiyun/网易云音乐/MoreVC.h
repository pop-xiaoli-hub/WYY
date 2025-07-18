//
//  MoreVC.h
//  网易云音乐
//
//  Created by xiaoli pop on 2025/7/15.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MoreVC : UIViewController
@property (nonatomic, strong)UIImage* image;
@property (nonatomic, assign)BOOL isnight;
- (void)dismissViewController;

@end

NS_ASSUME_NONNULL_END
