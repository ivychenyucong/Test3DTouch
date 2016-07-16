//
//  MyViewController.m
//  Test3DTouch
//
//  Created by Ivy on 16/3/18.
//  Copyright © 2016年 Ivy. All rights reserved.
//

#import "MyViewController.h"

@interface MyViewController ()
@property(nonatomic,strong) UILabel* label ;
@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSLog(@"view did load");
    
   
}

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) setNum:(NSString *)num{

    self.label.text = num;
}

-(UILabel *) label{
    if (!_label) {
        _label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 200)];
        _label.text = @"ddddd";
        [self.view addSubview:_label];
    }
    
    return _label;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(NSArray<id<UIPreviewActionItem>> *)previewActionItems{
    UIPreviewAction * actionItem1 = [UIPreviewAction actionWithTitle:@"ivy1" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"ivy1 click");
    }];
    
    UIPreviewAction * actionItem2 = [UIPreviewAction actionWithTitle:@"ivy1" style:UIPreviewActionStyleSelected handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"ivy2 click");
    }];

    UIPreviewAction * actionItem3 = [UIPreviewAction actionWithTitle:@"ivy1" style:UIPreviewActionStyleDestructive handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"ivy3 click");
    }];
    
    UIPreviewActionGroup * group = [UIPreviewActionGroup actionGroupWithTitle:@"group tile" style:UIPreviewActionStyleDefault actions:@[actionItem1, actionItem2, actionItem3]];
    return @[group];
}
@end
