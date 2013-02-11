//
//  BMWViewController.h
//  Calculator2
//
//  Created by Benjamin Wang on 2/4/13.
//  Copyright (c) 2013 Benjamin Wang. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface BMWViewController : UIViewController

@property (strong, nonatomic) IBOutlet
//note to self: if you delete a refernce, be sure to dereference here too

UILabel *displayScreen;

- (IBAction)functionPress:(id)sender;

- (IBAction)clear:(id)sender;

- (void)error:(NSString*)message;



@end
