//
//  CountView.m
//  网易云音乐
//
//  Created by xiaoli pop on 2025/6/12.
//

#import "CountView.h"
#import "UserBar.h"
#import "CountTableViewCell.h"
@interface CountView () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong)UITableView* tableView;
@property (nonatomic, strong)UILabel* nameLabel;
@property (nonatomic, strong)UIImage* image;
@property (nonatomic, copy)UILabel* countLabel;

@end

@implementation CountView

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor systemGroupedBackgroundColor];
    UserBar* bar = [[UserBar alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, 105)];
    [self.view addSubview:bar];
    self.tableView = [[UITableView alloc] init];
    self.tableView.frame = CGRectMake(0, 105, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height - 105);
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[CountTableViewCell class] forCellReuseIdentifier:@"ViewCell01"];
}




- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CountTableViewCell* cell01 = [self.tableView dequeueReusableCellWithIdentifier:@"ViewCell01"];
    return cell01;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 110;
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
