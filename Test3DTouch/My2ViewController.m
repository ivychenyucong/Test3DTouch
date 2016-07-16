//
//  My2ViewController.m
//  Test3DTouch
//
//  Created by Ivy on 16/3/18.
//  Copyright © 2016年 Ivy. All rights reserved.
//

#import "My2ViewController.h"

@interface My2ViewController ()

@end

@implementation My2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    return @[actionItem1, actionItem2, actionItem3];
}

-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"touch begin");
    UITouch * touch = touches.anyObject;
    NSLog(@"vc 2: force:%e, maximumPossibleForce:%e", touch.force, touch.maximumPossibleForce);
}

@end
