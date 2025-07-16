//
//  DrawerTransitioningDelegate.m
//  网易云音乐
//
//  Created by xiaoli pop on 2025/7/15.
//

#import "DrawerTransitioningDelegate.h"

@implementation DrawerTransitioningDelegate
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    SliderInAnimator* animator = [[SliderInAnimator alloc] init];
    animator.isPresenting = YES;
    return animator;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    SliderInAnimator* animator = [[SliderInAnimator alloc] init];
    animator.isPresenting = NO;
    return  animator;
}
@end
