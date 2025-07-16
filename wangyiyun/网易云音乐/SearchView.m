//
//  SearchView.m
//  网易云音乐
//
//  Created by xiaoli pop on 2025/6/12.
//

#import "SearchView.h"
#import "CustomNabBar.h"
#import "SliderInAnimator.h"
#import "SearchTableViewCell.h"
#import "MoreVC.h"
#import "DrawVC.h"
@interface SearchView () <UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate, UISearchBarDelegate, UINavigationControllerDelegate, UIViewControllerTransitioningDelegate>
@property (nonatomic, strong)SliderInAnimator* anmitor;
@property (nonatomic, strong)UISearchBar* searchBar;
@property (nonatomic, strong)UITableView* tableView;
@property (nonatomic, strong)UIBarButtonItem* leftButton;
@property (nonatomic, strong)UIBarButtonItem* rightButton;
@property (nonatomic, assign) CGFloat lastOffset;
@property (nonatomic, assign)BOOL isNight;
@end

@implementation SearchView
/*
    实现点击UIsearchBar以外的区域关闭键盘，通常需要监听视图上的触摸事件并主动调用resignFirstResponder方法来实现
 方法一：添加一个点击手势识别器来捕获视图上的点击事件
 UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dissmissKeyboard)];
 tap.cancelsTouchesInView = NO;
 //手势识别不会阻止触摸事件继续传递给其他视图
 //如果不设置或设为YES，手势识别器会"吃掉"触摸事件，导致被点击的按钮等控件无法正常响应
 [self.view addGestureRecognizer:tap];
 - (void)dissmissKeyboard {
     [self.searchBar resignFirstResponder];
 }

 方法二：重写touchesBegan方法
 - (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
     [super touchesBegan:touches withEvent:event];
     UITouch* touch = [touches anyObject];
     if (![touch.view isDescendantOfView:self.searchBar]) {
         [self.searchBar restorationIdentifier];
     }
 }
 
 方法三：使用 UISearchBarDelegate
 // 设置搜索栏代理
 self.searchBar.delegate = self;

 // 当用户点击搜索按钮时关闭键盘
 - (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
     [searchBar resignFirstResponder];
 }

 // 当用户点击取消按钮时关闭键盘
 - (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
     [searchBar resignFirstResponder];
 }
 */

/*
 每一个控件都是UIView的子类，他们通过嵌套形成树型结构
 包括视图层级，图层树，渲染树等
 
 */



- (void)viewDidLoad {
    [super viewDidLoad];
    self.isNight = NO;
    self.view.backgroundColor = [UIColor systemGroupedBackgroundColor];
//    CustomNabBar* bar = [[CustomNabBar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 105)];
//    [self.view addSubview:bar];
    
    self.leftButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"caidan.png"] style:UIBarButtonItemStylePlain target:self action:@selector(pressLeft)];
    self.leftButton.tintColor = [UIColor redColor];
    self.rightButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"tinggeshiqu.png"] style:UIBarButtonItemStylePlain target:self action:@selector(pressRight)];
    self.rightButton.tintColor = [UIColor redColor];
    
    
    
    self.navigationItem.leftBarButtonItem = _leftButton;
    self.navigationItem.rightBarButtonItem = _rightButton;
    self.searchBar = [[UISearchBar alloc] init];
    self.searchBar.placeholder = @"今天你要嫁给我";
    self.searchBar.showsSearchResultsButton = YES;
    self.searchBar.keyboardType = UIKeyboardTypeDefault;
    self.searchBar.delegate = self;
    self.navigationItem.titleView = self.searchBar;
    
    UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dissmissKeyboard)];
    //tap.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tap];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.bounces = NO;
    self.tableView.backgroundColor = [UIColor clearColor];
    self.lastOffset = 0;
    self.navigationController.delegate = self;
    [self.view addSubview: self.tableView];
    [self.tableView registerClass:[SearchTableViewCell class] forCellReuseIdentifier:@"Cell01"];
    [self.tableView registerClass:[SearchTableViewCell class] forCellReuseIdentifier:@"Cell02"];
    [self.tableView registerClass:[SearchTableViewCell class] forCellReuseIdentifier:@"Cell03"];
    [self.tableView registerClass:[SearchTableViewCell class] forCellReuseIdentifier:@"cell04"];
    [self.tableView registerClass:[SearchTableViewCell class] forCellReuseIdentifier:@"cell05"];
    [self.tableView registerClass:[SearchTableViewCell class] forCellReuseIdentifier:@"cell06"];
    [self.tableView registerClass:[SearchTableViewCell class] forCellReuseIdentifier:@"cell07"];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeBackColor:) name:@"note" object:nil];
}

- (void)changeBackColor:(NSNotification* )notification {
    NSDictionary* dict = notification.userInfo;
    NSNumber* num = dict[@"notice"];
    if ([num intValue]) {
        self.isNight = YES;
        self.view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.7];
    } else {
        self.isNight = NO;
        self.view.backgroundColor = [UIColor systemGroupedBackgroundColor];
    }
}


- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [searchBar resignFirstResponder];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    [searchBar resignFirstResponder];
}

- (void)dissmissKeyboard {
    [self.searchBar resignFirstResponder];
}

- (void)pressLeft {
    MoreVC* vc = [[MoreVC alloc] init];
    vc.modalPresentationStyle = UIModalPresentationCustom;
    vc.transitioningDelegate = self;
    [self presentViewController:vc animated:YES completion:nil];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    self.anmitor = [[SliderInAnimator alloc] init];
    self.anmitor.isPresenting = YES;
    return self.anmitor;
}

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    self.anmitor = [[SliderInAnimator alloc] init];
    self.anmitor.isPresenting = NO;
    return self.anmitor;
}

- (void)pressRight {
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

//-(void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
//    if ([viewController isKindOfClass:[self class]]) {
//        UIScrollView* scrollView = nil;
//        if ([self.view.subviews.firstObject isKindOfClass:[UIScrollView class]]) {
//            scrollView = (UIScrollView*)self.view.subviews.firstObject;
//        }
//        if (scrollView) {
//            CGFloat curOffset = scrollView.contentOffset.y;
//            if (curOffset > self.lastOffset) {
//                [self.navigationController setNavigationBarHidden:YES animated:YES];
//            } else {
//                [self.navigationController setNavigationBarHidden:NO animated:YES];
//            }
//            self.lastOffset = curOffset;
//        }
//    }
//}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat curOffset = scrollView.contentOffset.y;
    CGFloat scrollThreshold = 20.0;
    if (curOffset <= 0) {
        [self performSelector:@selector(setNavigationBarTransparent) withObject:nil afterDelay:0.1];
        return;
    }
    if (curOffset > self.lastOffset + scrollThreshold) {
        [self.navigationController setNavigationBarHidden:YES animated:YES];
        [self performSelector:@selector(setNavigationBarTransparent) withObject:nil afterDelay:0.1];
    } else if (curOffset < self.lastOffset - scrollThreshold) {
        [self.navigationController setNavigationBarHidden:NO animated:YES];
        [self performSelector:@selector(setNavigationBarOpaque) withObject:nil afterDelay:0.1];
    }
    
    self.lastOffset = curOffset;
}

- (void)setNavigationBarTransparent {
    UINavigationBar *navBar = self.navigationController.navigationBar;
    navBar.barTintColor = [UIColor clearColor];
    [navBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    navBar.shadowImage = [UIImage new];
    navBar.translucent = YES;
}

- (void)setNavigationBarOpaque {
    UINavigationBar *navBar = self.navigationController.navigationBar;
    navBar.barTintColor = [UIColor whiteColor];
    [navBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    navBar.shadowImage = nil;
    navBar.translucent = NO;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        SearchTableViewCell* cell01 = [self.tableView dequeueReusableCellWithIdentifier:@"Cell01" forIndexPath:indexPath];
        [cell01 replaceTimer:@"cell01"];
        cell01.layer.masksToBounds = YES;
        cell01.layer.cornerRadius = 20;
        return cell01;
    } else if (indexPath.row == 1){
        SearchTableViewCell* cell02 = [self.tableView dequeueReusableCellWithIdentifier:@"Cell02" forIndexPath:indexPath];
        return cell02;
    } else if (indexPath.row == 2){
        SearchTableViewCell* cell03 = [self.tableView dequeueReusableCellWithIdentifier:@"Cell03" forIndexPath:indexPath];
        return cell03;
    } else if (indexPath.row == 3){
        SearchTableViewCell* cell04 = [self.tableView dequeueReusableCellWithIdentifier:@"cell04" forIndexPath:indexPath];
        cell04.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell04;
    } else if (indexPath.row == 4){
        SearchTableViewCell* cell05 = [self.tableView dequeueReusableCellWithIdentifier:@"cell05" forIndexPath:indexPath];
        return cell05;
    } else if (indexPath.row == 5){
        SearchTableViewCell* cell06 = [self.tableView dequeueReusableCellWithIdentifier:@"cell06" forIndexPath:indexPath];
        return cell06;
    } else {
        SearchTableViewCell* cell07 = [self.tableView dequeueReusableCellWithIdentifier:@"cell07" forIndexPath:indexPath];
        return cell07;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat height = 0;
    if (indexPath.row == 0) {
        height = 150;
    }
    if (indexPath.row == 1) {
        height = 70;
    }
    if (indexPath.row == 2) {
        height = 40;
    }
    if (indexPath.row == 3) {
        height = 210;
    }
    if (indexPath.row == 4) {
        return 40;
    }
    if (indexPath.row == 5) {
        height = 130;
    }
    if (indexPath.row == 6) {
        height = 1000;
    }
    return height;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 7;
}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end


