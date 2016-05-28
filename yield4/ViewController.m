//
//  ViewController.m
//  yield4
//
//  Created by John Mac on 11/20/15.
//  Copyright © 2015 John Wetters. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
}

- (IBAction)calculate:(id)sender {
    double finalPayment,price;
    
    //check input text is correct from GUI
    NSLog(@"$ finalPayment %@",_finalPayment.stringValue);
    NSLog(@"settlement Date %@",_settlementDate.stringValue);
    NSLog(@"maturity Date %@",_maturityDate.stringValue);
    NSLog(@"$ price %@",_price.stringValue);
    
    //convert strinf to CGFloat values for calculations
    
    finalPayment = [_finalPayment.stringValue floatValue];
    price = [_price.stringValue floatValue];
    
    
    //convert strings to NSdate
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    
    [df setDateFormat:@"dd-MMM-yyyy"];
    
    NSDate *settlementDate = [[NSDate alloc] init];
    
    settlementDate = [df dateFromString: _settlementDate.stringValue ];
    
    NSLog(@"date: %@", settlementDate);
    
    NSDate *maturityDate = [[NSDate alloc] init];
    
    maturityDate = [df dateFromString: _maturityDate.stringValue ];
    
    NSLog(@"date: %@", maturityDate);
    
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    [calendar rangeOfUnit:NSCalendarUnitDay startDate:&settlementDate
                 interval:NULL forDate:settlementDate];
    [calendar rangeOfUnit:NSCalendarUnitDay startDate:&maturityDate
                 interval:NULL forDate:maturityDate];
    
    NSDateComponents *difference = [calendar components:NSCalendarUnitDay
                                               fromDate:settlementDate toDate:
                                    maturityDate options:0];
    
     NSLog(@"days: %ld", (long)difference.day);
 
    double years= (long) difference.day /365.00 ;
    
    NSLog(@"years: %f", years);
    
     self.timeYears.stringValue = [NSString stringWithFormat:@"%2.2f", years ];
    
    //calculate interest rate given price,final payment and time
    
    
    double yield=log(100.00/price)/years;
    
    self.interestRate.stringValue = [NSString stringWithFormat:@"%2.2f", yield * 100.00 ];
    
    NSLog(@"yield(per cent): %f", yield * 100.00);
    
    //check
    double a = price*exp(yield*years);
    
    self.finalPayment.stringValue = [NSString stringWithFormat:@"%4.2f", a];

   
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

@end
