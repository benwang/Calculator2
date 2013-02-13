//
//  BMWViewController.m
//  Calculator2
//
//  Created by Benjamin Wang on 2/4/13.
//  Copyright (c) 2013 Benjamin Wang. All rights reserved.
//

#import "BMWViewController.h"
#import "BMWPostfixCalc.h"
#import "BMWShunting-Yard.h"

@interface BMWViewController ()
@property (strong, nonatomic) NSString* displayText;

@end

@implementation BMWViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.displayText = @"";
    UIImage *patternImage = [UIImage imageNamed:@"dark_fish_skin.png"];
    self.view.backgroundColor = [UIColor colorWithPatternImage:patternImage];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)functionPress:(id)sender {
    self.displayText = [self.displayText stringByAppendingString: ((UIButton*)sender).currentTitle];
    self.displayScreen.text = self.displayText;
}

- (IBAction)clear:(UIButton *)sender {
    //clear text storage, set screen to 0 when you clear! Cool feature wooo!
    self.displayScreen.text = @"0";
    self.displayText = @"";
}

- (IBAction)equals:(id)sender {
    BMWShunting_Yard* convertPostfix = [[BMWShunting_Yard alloc] init];
    BMWPostfixCalc* calculator = [[BMWPostfixCalc alloc] init];
    
    NSString* postFixExpression = [convertPostfix parseInput:self.displayText];
    NSString* result;
    if ([[calculator evaluate:postFixExpression] isEqual:nil] || [[calculator evaluate:postFixExpression] isEqual: [NSDecimalNumber notANumber]]) {
        self.displayScreen.text = @"ERROR";
        self.displayText = @"";
    }
    else {
        result = [NSString stringWithFormat: @"%@",[calculator evaluate:postFixExpression]];
        self.displayScreen.text = result;
        self.displayText = result;
    }
}


@end









