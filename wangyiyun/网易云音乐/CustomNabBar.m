//
//  CustomNabBar.m
//  网易云音乐
//
//  Created by xiaoli pop on 2025/6/12.
//

#import "CustomNabBar.h"

@implementation CustomNabBar

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.leftButton setImage:[UIImage imageNamed:@"leftButtonOfsearch.png"] forState:UIControlStateNormal];
        self.leftButton.frame = CGRectMake(15, 60, 35, 35);
        [self addSubview:self.leftButton];
        
        
        self.rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.rightButton.frame = CGRectMake(self.frame.size.width - 50, 60, 35, 35);
        [self.rightButton setImage:[UIImage imageNamed:@"rightButtonOfsearch.png"] forState:UIControlStateNormal];
        [self addSubview:self.rightButton];
        
        self.iview = [[UIView alloc] init];
        self.iview.clipsToBounds = YES;

    }
    
    return self;
}


/*
 UIBarButtonItem *moreButton = [[UIBarButtonItem alloc] initWithImage:[UIImage systemImageNamed:@"line.horizontal.3"] style:UIBarButtonItemStylePlain target:self action:@selector(pressMore)];
     moreButton.tintColor = [UIColor redColor];
     UISearchBar *searchBar = [[UISearchBar alloc] init];
     searchBar.placeholder = @"top barry";
     searchBar.searchBarStyle = UISearchBarStyleMinimal;
     searchBar.frame = CGRectMake(0, 0, 300, 44);
     UIBarButtonItem *titleButton = [[UIBarButtonItem alloc] initWithCustomView:searchBar];
     NSArray *arr = [NSArray arrayWithObjects:moreButton, titleButton, nil];
     UIBarButtonItem *musicButton = [[UIBarButtonItem alloc] initWithImage:[UIImage systemImageNamed:@"mic.fill"] style:UIBarButtonItemStylePlain target:self action:@selector(pressMusic)];
     musicButton.tintColor = [UIColor redColor];
     self.navigationItem.leftBarButtonItems = arr;
     self.navigationItem.rightBarButtonItem = musicButton;
 */


@end
