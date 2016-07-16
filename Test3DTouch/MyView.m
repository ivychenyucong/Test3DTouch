//
//  MyView.m
//  Test3DTouch
//
//  Created by Ivy on 16/3/18.
//  Copyright © 2016年 Ivy. All rights reserved.
//

#import "MyView.h"
@interface MyView ()<UIViewControllerPreviewingDelegate>
@end

@implementation MyView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(id) init{
    self = [super init];
    self.backgroundColor = [UIColor redColor];
    return  self;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"view touch begin");
}

@end
