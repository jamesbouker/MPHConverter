//
//  ViewController.h
//  MPHConverter
//
//  Created by Jimmy on 3/5/14.
//  Copyright (c) 2014 JimmyBouker. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate> {
    
}

@property (strong, nonatomic) IBOutlet UILabel *mphLabel;
@property (strong, nonatomic) IBOutlet UITextField *input;
@property (strong, nonatomic) IBOutlet UILabel *output;
@property (strong, nonatomic) IBOutlet UILabel *conditional;
@property (strong, nonatomic) IBOutlet UILabel *kphLabel;

-(IBAction)kphButtonHit:(id)sender;
-(IBAction)mphButtonHit:(id)sender;

@end
