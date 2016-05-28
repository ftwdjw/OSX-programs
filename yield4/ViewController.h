//
//  ViewController.h
//  yield4
//
//  Created by John Mac on 11/20/15.
//  Copyright © 2015 John Wetters. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController

@property (weak, nonatomic) IBOutlet NSTextField *finalPayment;
@property (weak, nonatomic) IBOutlet NSTextField *settlementDate;
@property (weak, nonatomic) IBOutlet NSTextField *maturityDate;
@property (weak, nonatomic) IBOutlet NSTextField *price;
@property (weak, nonatomic) IBOutlet NSTextField *interestRate;
@property (weak, nonatomic) IBOutlet NSTextField *timeYears;

- (IBAction)calculate:(id)sender;
@end

