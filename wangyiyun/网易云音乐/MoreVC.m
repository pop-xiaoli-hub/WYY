//
//  MoreVC.m
//  网易云音乐
//
//  Created by xiaoli pop on 2025/7/15.
//

#import "MoreVC.h"

@interface MoreVC () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong)UITableView* tableView;
@property (nonatomic, strong)UIImageView* imageView;
@property (nonatomic, strong)NSArray* array;
@property (nonatomic, copy)NSString* name;
@end

@implementation MoreVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor systemGroupedBackgroundColor];
   
    self.array = @[

        @{@"title": @"历史收藏", @"icon": @"cube.box"},
        @{@"title": @"相册", @"icon": @"photo.on.rectangle"},
        @{@"title": @"我的卡包", @"icon": @"creditcard"},
        @{@"title": @"服务", @"icon": @"checkmark.circle"},
        @{@"title": @"设置", @"icon": @"gear"}
    ];
    //self.view.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.95];
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    self.view.frame = CGRectMake(0, 0, screenBounds.size.width * (4.0 / 5.0), screenBounds.size.height);
    //self.image = [UIImage imageNamed:@"pic2.jpg"];
    [self creatTableView];
    [self createHeader];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}


- (void)createHeader {
    UIView* iView = [[UIView alloc] init];
    iView.frame = CGRectMake(0, 50, self.view.frame.size.width, 130);
    self.imageView = [[UIImageView alloc] initWithImage:self.image];
    self.imageView.layer.cornerRadius = 40;
    self.imageView.clipsToBounds = YES;
    self.imageView.frame = CGRectMake(15, 25, 80, 80);
    [iView addSubview:self.imageView];

    
    self.name = @"昵称：情深似海无边际";
    UILabel* label = [[UILabel alloc] init];
    label.frame = CGRectMake(115, 35, 200, 30);
    label.font = [UIFont systemFontOfSize:20];
    label.text =self.name;
    label.backgroundColor = [UIColor clearColor];
    [iView addSubview:label];
    
    
    UILabel* label2 = [[UILabel alloc] init];
    label2.frame = CGRectMake(115, 70, 200, 30);
    label2.font = [UIFont systemFontOfSize:18];
    label2.text = @"账号: hh14x2b";
    label2.backgroundColor = [UIColor clearColor];
    [iView addSubview:label2];
    
    
    self.tableView.tableHeaderView = iView;
}

- (void)creatTableView {
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    if (self.isnight) {
        self.tableView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.8];
    } else {
        self.tableView.backgroundColor = [UIColor clearColor];
    }
    self.tableView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:self.tableView];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.array.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    NSDictionary *item = self.array[indexPath.row];
    cell.textLabel.text = item[@"title"];
    cell.textLabel.font = [UIFont systemFontOfSize:25];
    cell.imageView.image = [UIImage systemImageNamed:item[@"icon"]];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.tag = indexPath.row + 101;
    cell.backgroundColor = [UIColor clearColor];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

- (void)dismissViewController {
    [self dismissViewControllerAnimated:YES completion:nil];
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
