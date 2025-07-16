//
//  HomeView.h
//  网易云音乐
//
//  Created by xiaoli pop on 2025/6/12.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HomeView : UIViewController
@property (nonatomic, strong) UIView* contentView;
@property (nonatomic, strong) UIView* blurOverlay;
@property (nonatomic, weak) UIView* parentView;
@end

NS_ASSUME_NONNULL_END
