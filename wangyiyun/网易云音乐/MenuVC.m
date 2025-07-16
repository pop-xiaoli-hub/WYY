//
//  MenuVC.m
//  网易云音乐
//
//  Created by xiaoli pop on 2025/7/16.
//

#import "MenuVC.h"
#import "MenuCell.h"
@interface MenuVC ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong)UITableView* tableView;
@property (nonatomic, strong)NSArray* array;
@end

@implementation MenuVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.array = @[
        @[@{@"imagename" : @"c1.png", @"text": @"睡眠定时"}, @{@"imagename" : @"c2.png", @"text" : @"我的电子书"}, @{@"imagename" : @"c3.png", @"text" : @"账号设置"}, @{@"imagename" : @"c4.png", @"text" : @"我的云空间"}],
        @[@{@"imagename" : @"b1.png", @"text": @"我的好友"}, @{@"imagename" : @"b2.png", @"text" : @"我的收藏"}, @{@"imagename" : @"b3.png", @"text" : @"我的听歌历史"}, @{@"imagename" : @"b4.png", @"text" : @"我的个性装扮"}],
        @[@{@"imagename" : @"night.png", @"text": @"黑夜模式"}],
        @[@{@"imagename" : @"a1.png", @"text": @"探索更多"}, @{@"imagename" : @"a2.png", @"text": @"我是小猪"}]
    ];
    self.view.backgroundColor = [UIColor systemGroupedBackgroundColor];
    self.tableView = [[UITableView alloc] init];
    self.tableView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 40);
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.showsHorizontalScrollIndicator = NO;
    [self.tableView reloadData];
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[MenuCell class] forCellReuseIdentifier:@"cell01"];
    [self.tableView registerClass:[MenuCell class] forCellReuseIdentifier:@"cell02"];
    if (self.isnight == YES) {
        self.tableView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.7];
    } else {
        self.tableView.backgroundColor = [UIColor systemGroupedBackgroundColor];
    }
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 4;
    } else if (section == 1) {
        return 4;
    } else if (section == 2) {
        return 1;
    } else {
        return 2;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView* header = [[UIView alloc] init];
    header.backgroundColor = [UIColor clearColor];
    return header;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 2) {
        MenuCell* cell02 = [self.tableView dequeueReusableCellWithIdentifier:@"cell02" forIndexPath:indexPath];
        NSArray* arr = [self.array objectAtIndex:indexPath.section];
        NSDictionary* dict = [arr objectAtIndex:indexPath.row];
        UIImage* image = [UIImage imageNamed:dict[@"imagename"]];
        cell02.iView.image = image;
        cell02.label.text = dict[@"text"];
        if (self.isnight == NO) {
            cell02.Switch.on = NO;
        } else {
            cell02.Switch.on = YES;
        }
        [cell02.Switch addTarget:self action:@selector(ChangeStyle:) forControlEvents:UIControlEventValueChanged];
        cell02.backgroundColor = [UIColor clearColor];
        cell02.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell02;
    } else {
        MenuCell* cell01 = [self.tableView dequeueReusableCellWithIdentifier:@"cell01" forIndexPath:indexPath];
        NSArray* arr = [self.array objectAtIndex:indexPath.section];
        NSDictionary* dict = [arr objectAtIndex:indexPath.row];
        UIImage* image = [UIImage imageNamed:dict[@"imagename"]];
        cell01.iView.image = image;
        cell01.label.text = dict[@"text"];
        cell01.backgroundColor = [UIColor clearColor];
        cell01.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell01;
    }
}

- (void)ChangeStyle:(UISwitch* )sw {
    NSNumber* num;
    if (sw.on == YES) {
        self.tableView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.7];
        num = @(1);
    } else {
        self.tableView.backgroundColor = [UIColor systemGroupedBackgroundColor];
        num = @(0);
    }
    NSDictionary* userInfo = @{@"notice" : num};
    [[NSNotificationCenter defaultCenter] postNotificationName:@"note" object:nil userInfo:userInfo];
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
