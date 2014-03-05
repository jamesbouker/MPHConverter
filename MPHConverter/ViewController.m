//
//  ViewController.m
//  MPHConverter
//
//  Created by Jimmy on 3/5/14.
//  Copyright (c) 2014 JimmyBouker. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController {
    BOOL lastButtonHitWasMPH;
}

-(void)viewDidLoad {
    [super viewDidLoad];
    
    _mphLabel.text = nil;
    _kphLabel.text = nil;
    _input.text = nil;
    _output.text = nil;
    _conditional.text = nil;
}

-(IBAction)kphButtonHit:(id)sender {
    //remember last button hit
    lastButtonHitWasMPH = NO;
    
    //hide the keyboard
    [_input resignFirstResponder];
    
    //perform calculation
    float mph = [_input.text floatValue];
    [self performCalcFromMPH:mph];
    
    //clear the text
    _input.text = nil;
}

-(IBAction)mphButtonHit:(id)sender {
    //remember last button hit
    lastButtonHitWasMPH = YES;
    
    //hide the keyboard
    [_input resignFirstResponder];
    
    //perform calculation
    float kph = [_input.text floatValue];
    [self performCalcFromKPH:kph];
    
    //clear the input
    _input.text = nil;
}

-(void)performCalcFromMPH:(float)mph {
    float kph = mph * 1.61;
    [self setTextForMPH:mph kph:kph];
}

-(void)performCalcFromKPH:(float)kph {
    float mph = kph / 1.61;
    [self setTextForMPH:mph kph:kph];
}

-(void)setTextForMPH:(float)mph kph:(float)kph {

    //set the output text
    _output.text = [NSString stringWithFormat:@"%1.0f kph is %1.0f mph", kph, mph];
    _kphLabel.text = [NSString stringWithFormat:@"%1.0f", kph];
    _mphLabel.text = [NSString stringWithFormat:@"%1.0f", mph];
    
    //check the driving speed
    [self checkSpeed:mph];
}

-(void)checkSpeed:(float)mph {
    
    if(mph < 15)
        _conditional.text = @"Speed up Grandma!";
    else if(mph > 50)
        _conditional.text = @"Slow down Mario!";
    else
        _conditional.text = @"Your driving is just right";
}

#pragma mark - UITextFieldDelegate

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSString *newString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    float num = [newString floatValue];
    if(lastButtonHitWasMPH) {
        [self performCalcFromKPH:num];
    }
    else {
        [self performCalcFromMPH:num];
    }
    
    return YES;
}


@end
