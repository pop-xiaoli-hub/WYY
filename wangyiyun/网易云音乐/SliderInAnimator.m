//
//  SliderInAnimator.m
//  网易云音乐
//
//  Created by xiaoli pop on 2025/7/15.
//


/*
 控制动画的核心逻辑，怎么移动以及移动时间
 */
#import "SliderInAnimator.h"
#import "MoreVC.h"
@implementation SliderInAnimator

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.4;
}


//- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
//    if (self.isPresenting) {
//         /*
//             从上下文获取目标页面的视图控制器
//             transitionContext：当前转场的上下文（系统传入）
//             viewControllerForKey:用来获取专场前后的视图控制器，from是前，to是后
//             */
//            UIViewController* vc = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
//            /*
//             系统准备的容器视图，用于添加动画中涉及的视图，只有把要做动画的视图添加进去才能看到效果
//             */
//            UIView* containerView = [transitionContext containerView];
//            CGRect finalFrame = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width * (4.0 / 5.0), [[UIScreen mainScreen] bounds].size.height);
//            UIView* dimmingView = [[UIView alloc] initWithFrame:containerView.bounds];
//            dimmingView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.4];
//            dimmingView.tag = 1001;
//            dimmingView.alpha = 0.0;
//            UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:vc action:@selector(dismissViewController)];
//            [dimmingView addGestureRecognizer:tap];
//            
//            [containerView addSubview:dimmingView];
//            
//            CGRect startFrame = finalFrame;
//            startFrame.origin.x = -finalFrame.size.width;
//            vc.view.frame = startFrame;
//            [containerView addSubview:vc.view];
//            /*
//             animatedWithDuartion是一个类方法，用来实现动画
//             参数一：动画时长
//             参数二：目标控制器最终的位置
//             参数三：回调，这里是告诉系统动画完成
//             */
//            [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
//                    vc.view.frame = finalFrame;
//                dimmingView.alpha = 1.0;
//                } completion:^(BOOL finished) {
//                    [transitionContext completeTransition:YES];
//                }];
//    } else {
//        UIView* containerView = [transitionContext containerView];
//        CGFloat drawerSize = [UIScreen mainScreen].bounds.size.width * (4.0 / 5.0);
//
//        UIViewController* vc = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
//        UIView* dimmingView = [containerView viewWithTag:1001];
//        CGRect finalFrame = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width * (4.0 / 5.0), [[UIScreen mainScreen] bounds].size.height);
//                CGRect dismissFrame = finalFrame;
//        dismissFrame.origin.x = -drawerSize; // 向左滑出
//
//                [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
//                    vc.view.frame = dismissFrame;
//                    dimmingView.alpha = 0.0;
//                } completion:^(BOOL finished) {
//                    [vc.view removeFromSuperview];
//                    [dimmingView removeFromSuperview];
//                    [transitionContext completeTransition:YES];
//                }];
//
//    }
//}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    //获取系统提供的容器视图
    UIView* containerView = [transitionContext containerView];
    if (self.isPresenting) {
        //获取即将要呈现的视图控制器
        UIViewController* vc = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
        CGRect finalFrame = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width * (4.0 / 5.0), [[UIScreen mainScreen] bounds].size.height);
        
        //添加模糊效果
        UIView* dimmingView = [[UIView alloc] initWithFrame:containerView.bounds];
        dimmingView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.4];
        dimmingView.tag = 1001;
        dimmingView.alpha = 0.0;
        //添加手势
        UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:vc action:@selector(dismissViewController)];
        [dimmingView addGestureRecognizer:tap];
        [containerView addSubview:dimmingView];
        CGRect startFrame = finalFrame;
        startFrame.origin.x = -finalFrame.size.width;
        vc.view.frame = startFrame;
        [containerView addSubview:vc.view];
        [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
                vc.view.frame = finalFrame;
            dimmingView.alpha = 1.0;
            } completion:^(BOOL finished) {
                [transitionContext completeTransition:YES];
            }];
    } else {
        UIViewController* fromVc = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
        UIView* dimmingView = [containerView viewWithTag:1001];
        CGRect endFrame = fromVc.view.frame;
        endFrame.origin.x = - endFrame.size.width;
        
        [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
                    fromVc.view.frame = endFrame;
                    dimmingView.alpha = 0.0;
                } completion:^(BOOL finished) {
                    [dimmingView removeFromSuperview];
                    [fromVc.view removeFromSuperview];
                    [transitionContext completeTransition:YES];
                }];
    }
}

@end
