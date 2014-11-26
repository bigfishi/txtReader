//
//  trReadingViewController.m
//  txtReader
//
//  Created by YuDa on 14-11-26.
//  Copyright (c) 2014年 YuDa. All rights reserved.
//

#import "trReadingViewController.h"

@interface trReadingViewController ()
@property (nonatomic, strong) UITextView *textView;
@property (nonatomic, strong) NSString *text;
@property (nonatomic) NSUInteger currentPage;
@property (nonatomic) NSUInteger allPage;
@end

@implementation trReadingViewController

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
    // Do any additional setup after loading the view.
}

- (void)initTextView
{
    self.textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, 320, 480 - 44)];
    UITextView *textView = self.textView;
    [self.view addSubview:textView];
    textView.text = self.text;
    
    textView.font = [UIFont italicSystemFontOfSize:20];
    
//    textView.inputAccessoryView = imageView;
    
    textView.textColor = [UIColor blackColor];
    
    textView.backgroundColor = [UIColor grayColor];
    
    textView.editable = NO;
    
    NSLog(@"%f",textView.contentSize.height);
    
    //计算textView的总页数
    self.allPage = textView.contentSize.height / 430 + 1;
    //设置当前页为1
    self.currentPage = 1;
}

- (void)upPage:(UIButton *)btn
{
    if (self.currentPage == 1) {
        UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:@"温馨提示" message:@"这已是第一页" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [alertView show];
        return;
    }
    self.currentPage = self.currentPage - 1;
    NSLog(@"%d",self.currentPage);
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.1];
    [self.textView setContentOffset:CGPointMake(0, (self.currentPage - 1) * 430) animated:YES];
    [UIView commitAnimations];
    //
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1];
    [UIView setAnimationTransition:UIViewAnimationTransitionCurlDown forView:self.view cache:YES];
    [UIView commitAnimations];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
