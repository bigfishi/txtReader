//
//  trListViewController.m
//  txtReader
//
//  Created by YuDa on 14-11-26.
//  Copyright (c) 2014年 YuDa. All rights reserved.
//

#import "trListViewController.h"

@interface trListViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UIView *topView;
@property (nonatomic, strong) UITableView *table;
@property (nonatomic, strong) NSMutableArray *files;
@end

@implementation trListViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initView];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self loadFileData];
}

- (void)initView
{
    CGFloat width = self.view.frame.size.width;
    CGFloat height = self.view.frame.size.height;
    self.topView = [self.view addViewWithFrame:CGRectMake(0, 20, width, 50) title:nil superView:nil style:kControlView];
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, width, 50)];
    imgView.image = [UIImage imageNamed:@"WoodBackground@2x.png"];
    [self.topView addSubview:imgView];
    [self initTopView];
    self.table = [[UITableView alloc] initWithFrame:CGRectMake(0, self.topView.frame.origin.y+self.topView.frame.size.height, width, height-self.topView.frame.size.height-self.topView.frame.origin.y)];
    self.table.delegate = self;
    self.table.dataSource = self;
    [self.view addSubview:self.table];
}

- (void)initTopView
{
    CGFloat width = self.topView.frame.size.width;
    CGFloat height = self.topView.frame.size.height;
    CGFloat hPadding = 10;
    CGFloat vPadding = 10;
    [self.topView addButtonWithFrame:CGRectMake(hPadding, vPadding, 50, height-vPadding*2) title:@"编辑" bgColor:[UIColor clearColor] target:self action:@selector(editFile:) superView:nil];
    UIButton *refreshBtn = [self.topView addButtonWithFrame:CGRectMake(width-hPadding-50, vPadding, 50, height-vPadding*2) title:@"" bgColor:[UIColor clearColor] target:self action:@selector(refreshFile:) superView:nil];
    [refreshBtn addTarget:self action:@selector(refreshFile:) forControlEvents:UIControlEventTouchUpInside];
    [refreshBtn setImage:[UIImage imageNamed:@"ToolBar_ArrowCircleRight.png"] forState:UIControlStateNormal];
}

- (void)editFile:(UIButton *)btn
{
    NSLog(@"editFile");
}

- (void)refreshFile:(UIButton *)btn
{
    NSLog(@"refreshFile");
    btn.enabled = NO;
    [self loadFileData];
    btn.enabled = YES;
}

- (void)loadFileData
{
    self.files = [NSMutableArray array];
    NSString *docPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
//    NSFileHandle *fh = [NSFileHandle ]
    NSFileManager *fm = [NSFileManager defaultManager];
    NSError *error = nil;
    NSArray *fileArray = [fm contentsOfDirectoryAtPath:docPath error:&error];
    for (int i=0; i<fileArray.count; i++)
    {
        NSString *fileName1 = [fileArray objectAtIndex:i];
        if (fileName1.length > 4 && [[fileName1 substringFromIndex:fileName1.length-4] isEqualToString:@".txt"])
        {
            // 是txt文件
            [self.files addObject:fileName1];
        }
    }
    [self.table reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"fileCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (nil == cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    NSString *str = [self.files objectAtIndex:indexPath.row];
    if (str.length > 14) {
        str = [NSString stringWithFormat:@"%@...", [str substringToIndex:14]];
    }
    cell.textLabel.text = str;
    cell.textLabel.font = [UIFont systemFontOfSize:18];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 用这种方法，是把当前controller换成readCtrl
//    UIViewController *readCtrl = [self.storyboard instantiateViewControllerWithIdentifier:@"reading"];
//    [self presentViewController:readCtrl animated:NO completion:^{
//        ;
//    }];
    [self.tabBarController setSelectedIndex:1];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.files.count;
}

@end
