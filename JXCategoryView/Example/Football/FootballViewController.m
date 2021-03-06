//
//  FootballViewController.m
//  JXCategoryView
//
//  Created by jiaxin on 2018/8/10.
//  Copyright © 2018年 jiaxin. All rights reserved.
//

#import "FootballViewController.h"
#import "JXCategoryTitleView.h"
#import "Masonry.h"
@interface FootballViewController ()
@property (nonatomic, strong) NSArray *titles;
@property (nonatomic, strong) JXCategoryTitleView *myCategoryView;
@end

@implementation FootballViewController

- (void)viewDidLoad {
    _titles = @[@"中国U-19", @"中国超级联赛", @"亚足联冠军联赛", @"亚运会足球赛", @"世界杯🎉"];

    [super viewDidLoad];

    self.categoryView.frame = CGRectMake(0, 20, WindowsSize.width, 60);
    self.myCategoryView.titles = self.titles;
    self.myCategoryView.titleColorGradientEnabled = YES;
    self.myCategoryView.indicatorLineViewShowEnabled = NO;
    self.myCategoryView.indicatorImageViewShowEnabled = YES;
    self.myCategoryView.indicatorImageViewRollEnabled = YES;
    self.myCategoryView.indicatorImageView.image = [UIImage imageNamed:@"football"];
  
    
}

- (JXCategoryTitleView *)myCategoryView {
    return (JXCategoryTitleView *)self.categoryView;
}

- (NSUInteger)preferredListViewCount {
    return self.titles.count;
}

- (Class)preferredCategoryViewClass {
    return [JXCategoryTitleView class];
}

- (CGFloat)preferredCategoryViewHeight {
    return 100;
}

@end
