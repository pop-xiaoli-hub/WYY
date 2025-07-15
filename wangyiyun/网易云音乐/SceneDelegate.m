//
//  SceneDelegate.m
//  网易云音乐
//
//  Created by xiaoli pop on 2025/6/12.
//

#import "SceneDelegate.h"
#import "HomeView.h"
#import "SearchView.h"
#import "CountView.h"
#import "showStartView.h"
@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    SearchView* vc1 = [[SearchView alloc] init];
    UINavigationController* nav1 = [[UINavigationController alloc] initWithRootViewController:vc1];
    vc1.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"主页" image:[UIImage systemImageNamed:@"magnifyingglass"]tag:101];
    
    
    HomeView* vc2 = [[HomeView alloc] init];
    UINavigationController* nav2 = [[UINavigationController alloc] initWithRootViewController:vc2];
    vc2.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"主页" image:[UIImage systemImageNamed: @"house"] tag:102];
    
    CountView* vc3 = [[CountView alloc] init];
    UINavigationController* nav3 = [[UINavigationController alloc] initWithRootViewController:vc3];
    vc3.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"账户" image:[UIImage systemImageNamed:@"person"] tag:103];
    
    UITabBarController* tab = [[UITabBarController alloc] init];
    tab.viewControllers = @[nav1, nav2, nav3];
    self.window.rootViewController = tab;
    [self.window makeKeyAndVisible];
    [self showStartView];
}

- (void)showStartView {
    showStartView* vc = [[showStartView alloc] init];
    vc.modalPresentationStyle = UIModalPresentationFullScreen;
    vc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self.window.rootViewController presentViewController:vc animated:YES completion:nil];
}


- (void)sceneDidDisconnect:(UIScene *)scene {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
}


- (void)sceneDidBecomeActive:(UIScene *)scene {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
}


- (void)sceneWillResignActive:(UIScene *)scene {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
}


- (void)sceneWillEnterForeground:(UIScene *)scene {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
}


- (void)sceneDidEnterBackground:(UIScene *)scene {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
}


@end
