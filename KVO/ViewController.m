//
//  ViewController.m
//  KVO
//
//  Created by MRJ on 2017/9/9.
//  Copyright © 2017年 MRJ. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()
@property (nonatomic, strong)Person *person;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 100, 100, 100);
    btn.backgroundColor = [UIColor orangeColor];
    [btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
    self.person = [[Person alloc] init];
    [self.person addObserver:self forKeyPath:@"gender" options:NSKeyValueObservingOptionNew context:nil];
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark Method
- (void)click{
    self.person.name = @"小红军";
    self.person.gender = 2;
}

#pragma mark observer
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    
    NSLog(@"person  new value is %@", ((Person *)object).name);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
