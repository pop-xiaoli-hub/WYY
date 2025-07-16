//
//  CountView.m
//  网易云音乐
//
//  Created by xiaoli pop on 2025/6/12.
//

#import "CountView.h"
#import "UserBar.h"
#import "CountTableViewCell.h"
#import "MenuVC.h"
@interface CountView () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong)UITableView* tableView;
@property (nonatomic, strong)UILabel* nameLabel;
@property (nonatomic, strong)UIImage* image;
@property (nonatomic, copy)UILabel* countLabel;
@property (nonatomic, strong)UIBarButtonItem* leftbutton;
@property (nonatomic, strong)UIBarButtonItem* rightbutton;
@property (nonatomic, assign)BOOL isNight;
@end

@implementation CountView



- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor systemGroupedBackgroundColor];
//    UserBar* bar = [[UserBar alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, 105)];
//    [self.view addSubview:bar];
//    self.view.backgroundColor = [UIColor yellowColor];
    //UIImage* image = [UIImage imageNamed:@"back.jpg"];
    //self.view.layer.contents = (__bridge id)image.CGImage;
    self.navigationController.navigationBar.shadowImage = [[UIImage alloc] init];
    self.view.backgroundColor = [UIColor systemGroupedBackgroundColor];
    self.leftbutton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"a1.png"] style:UIBarButtonItemStylePlain target:self action:@selector(pressleft)];
    self.rightbutton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"a2.png"] style:UIBarButtonItemStylePlain target:self action:@selector(pressright)];
    self.navigationItem.leftBarButtonItem = self.leftbutton;
    self.navigationItem.rightBarButtonItem = self.rightbutton;
    self.leftbutton.tintColor = [UIColor colorWithRed:0.5 green:0.1 blue:0.3 alpha:1];
    self.rightbutton.tintColor = [UIColor colorWithRed:0.5 green:0.1 blue:0.3 alpha:1];
    self.tableView = [[UITableView alloc] init];
    self.tableView.frame = CGRectMake(0, 105, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height - 105);
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.tableView];
    self.isNight = NO;
    [self.tableView registerClass:[CountTableViewCell class] forCellReuseIdentifier:@"ViewCell01"];
    [self.tableView registerClass:[CountTableViewCell class] forCellReuseIdentifier:@"ViewCell02"];
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

- (void)pressleft {
    MenuVC* vc = [[MenuVC alloc] init];
    vc.isnight = self.isNight;
    [self.navigationController presentViewController:vc animated:YES completion:nil];
}

- (void)pressright {
    
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
        CountTableViewCell* cell01 = [self.tableView dequeueReusableCellWithIdentifier:@"ViewCell01" forIndexPath:indexPath];
        cell01.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell01;
    } else {
        CountTableViewCell* cell02 = [self.tableView dequeueReusableCellWithIdentifier:@"ViewCell02" forIndexPath:indexPath];
        cell02.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell02;
    }
}
   

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return 180;
    } else {
        return 800;
    }
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
