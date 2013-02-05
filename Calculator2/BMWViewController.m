//
//  BMWViewController.m
//  Calculator2
//
//  Created by Benjamin Wang on 2/4/13.
//  Copyright (c) 2013 Benjamin Wang. All rights reserved.
//

#import "BMWViewController.h"

@interface BMWViewController ()

@end

@implementation BMWViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UIImage *patternImage = [UIImage imageNamed:@"dark_fish_skin.png"];
    self.view.backgroundColor = [UIColor colorWithPatternImage:patternImage];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
