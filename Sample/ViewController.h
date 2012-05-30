//
//  ViewController.h
//  Sample
//
//  Created by Mehak on 5/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#include <QuartzCore/QuartzCore.h>
#define kSwitchesSegmentIndex 0

// this class follows the uiactionsheetdelegate protocol coz its a delegate of action sheet
@interface ViewController : UIViewController <UIActionSheetDelegate>{
IBOutlet UITextField *name;
IBOutlet UITextField *number;
IBOutlet UILabel *nameLabel;
IBOutlet UILabel *numberLabel;

    
    IBOutlet UILabel *sliderLabel;
    IBOutlet UISegmentedControl *segment;
    IBOutlet UISwitch *leftSwitch;
    IBOutlet UISwitch *rightSwitch;
    IBOutlet UIButton *button;
  
}

@property (retain, nonatomic)IBOutlet UITextField *name;
@property (retain,nonatomic)IBOutlet UITextField* number;
@property (retain , nonatomic)IBOutlet UIImageView *imageView;

@property (retain, nonatomic)IBOutlet UILabel *nameLabel;
@property (retain,nonatomic)IBOutlet UILabel* numberLabel;
@property (retain,nonatomic)IBOutlet UILabel *sliderLabel;

-(IBAction)sliderAction:(id)sender;
-(IBAction) textFieldDoneEditing:(id)sender;
-(IBAction)backgroundTap:(id)sender;
-(IBAction)button:(id)sender;
-(IBAction)switchAction:(id)sender;
-(IBAction)toggleControl:(id)sender;
-(void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex; 
- (UIImage*)captureView:(UIView *)view ;
-(void)saveScreenshotToPhotosAlbum:(UIView *)view;


@end