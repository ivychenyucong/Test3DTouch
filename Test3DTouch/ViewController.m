//
//  ViewController.m
//  ;
//
//  Created by Ivy on 16/3/18.
//  Copyright © 2016年 Ivy. All rights reserved.
//

#import "ViewController.h"
#import "MyViewController.h"
#import "MyView.h"
#import "My2ViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate, UIViewControllerPreviewingDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableview;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //[self.tableview registerClass:[UITableViewCell class] forCellReuseIdentifier:@"dd"];
    if(self.traitCollection.forceTouchCapability ==UIForceTouchCapabilityAvailable){
        [self registerForPreviewingWithDelegate:self sourceView:self.view];
        
    }
    
}


//-(void) loadView{
//    self.view = [[MyView alloc] init];
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"dd" forIndexPath:indexPath];
    
    NSUInteger row = indexPath.row % 5;
    switch (row) {
        case 0:
            cell.contentView.backgroundColor = [UIColor redColor];
            break;
        case 1:
            cell.contentView.backgroundColor = [UIColor blueColor];
            break;
        case 2:
            cell.contentView.backgroundColor = [UIColor yellowColor];
            break;
        case 3:
            cell.contentView.backgroundColor = [UIColor grayColor];
            break;
        case 4:
            cell.contentView.backgroundColor = [UIColor purpleColor];
            break;
            
        default:
            break;
    }
    
    return  cell;
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    MyViewController * vc = (MyViewController*)segue.destinationViewController;
    NSIndexPath *  indexPath  = [self.tableview indexPathForSelectedRow];
    NSLog(@"index:%@", indexPath);
    
    
    NSString * str = [NSString stringWithFormat:@"%lu", (long)(indexPath.row) ];
    
    vc.num = str;

    
}

#pragma mark UIViewControllerPreviewingDelegate
- (nullable UIViewController *)previewingContext:(id <UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location {
    NSIndexPath * indexpath = [self.tableview indexPathForRowAtPoint:location];
    
    UITableViewCell * cell = [self.tableview cellForRowAtIndexPath:indexpath];
    
    MyViewController * vc = [[MyViewController alloc] init];
    vc.preferredContentSize = CGSizeMake(100, 300);
    
    NSString * str = [NSString stringWithFormat:@"%lu", (long)(indexpath.row) ];
    
    vc.num = str;
    
//    My2ViewController * vc = [[My2ViewController alloc] init];
    return vc;
    
}


- (void)previewingContext:(id <UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit{
    [self.navigationController pushViewController:viewControllerToCommit animated:YES];
    //self showViewController:<#(nonnull UIViewController *)#> sender:<#(nullable id)#>
}

-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"touch begin");
    UITouch * touch = touches.anyObject;
    NSLog(@"force:%f, maximumPossibleForce:%f", touch.force, touch.maximumPossibleForce);
}

@end
