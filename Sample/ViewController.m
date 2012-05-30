//
//  ViewController.m
//  Sample
//
//  Created by Mehak on 5/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#include <QuartzCore/QuartzCore.h>
#import <MobileCoreServices/UTCoreTypes.h>


@interface ViewController ()
// these lines of code added for imagepicke controller
// this is catgory type .. we wil implement these later
/*static UIImage *shrinkImage(UIImage *original ,CGSize size);
-(void)UpdateDiaplay ;
//-(void)getMediaFromSource:(UIImagePickerControllerSourceType)sourceType;
*/
 @end

@implementation ViewController
@synthesize name;
@synthesize number;
@synthesize nameLabel;
@synthesize numberLabel;
@synthesize sliderLabel;
//@synthesize imageView;
//@synthesize image;


// to remove the keyboard once editing is done
-(IBAction)textFieldDoneEditing:(id)sender{
    [sender resignFirstResponder];
}
// removing the keyboard by tapping on the screen
-(IBAction)backgroundTap:(id)sender{
    [name resignFirstResponder];
    [number resignFirstResponder];
}

// updating label when slider is moved
-(IBAction)sliderAction:(id)sender{
    UISlider *slider =(UISlider *)sender;
    int sliderValue = (int)(slider.value +0.5f);
    NSString *text = [[NSString alloc] initWithFormat:@"%d",sliderValue];
    sliderLabel.text = text;
    [text release];
    
}

// generate alert and action sheet
-(IBAction)button:(id)sender{
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Are you sure?" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"Yes , I am sure" otherButtonTitles: nil];
    [actionSheet showInView:self.view];
    [actionSheet release];

    
}
-(IBAction)switchAction:(id)sender{
    UISwitch * whichSwitch = (UISwitch *)sender;
    if(whichSwitch.isOn)
    {
        [leftSwitch setOn:YES animated:YES];
        [rightSwitch setOn:YES animated:YES];
    }
    else {
        [rightSwitch setOn:NO animated:YES];
        [leftSwitch setOn:NO animated:YES];
    }
    
}
// for the segment bar .. toggling between controls 
-(IBAction)toggleControl:(id)sender{
    if([sender selectedSegmentIndex]== kSwitchesSegmentIndex )
    {
        leftSwitch.hidden =NO;
        rightSwitch.hidden = NO;
        button.hidden = YES;
    }
    else {
        leftSwitch.hidden = YES;
        rightSwitch.hidden = YES;
        button.hidden = NO;
    }
    
}
// to show up an alert wen any of the action sheet buttons are pressed
-(void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex{
    
if(buttonIndex != [actionSheet cancelButtonIndex])
    {
       // [self captureView:self.view];
       [self saveScreenshotToPhotosAlbum:self.view]; 
        
        
        
    }
}
// to take a screenshot     

- (UIImage*)captureView:(UIView *)view {
    CGRect rect = [[UIScreen mainScreen] bounds];
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [view.layer renderInContext:context];
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}
// save the screenshot in the photo gallery 

- (void)saveScreenshotToPhotosAlbum:(UIView *)view {
    UIImageWriteToSavedPhotosAlbum([self captureView:view], nil, nil, nil);
}


//methods for selecting image from library 
//-(IBAction)selectImage:(id)sender{
  //  [self getMediaFromSource:UIImagePickerControllerSourceTypePhotoLibrary];
    
//}

// UIImagePickerCotroller delegate methods 
//-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
//    [picker dismissModalViewControllerAnimated:YES];
//}

//-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    
   // UIImage *chosenImage = [info objectForKey:UIImagePickerControllerEditedImage];
   // UIImage *shrunkenImage = shrinkImage(chosenImage, imageFrame.size);
   // self.image=shrunkenImage;
   // [picker dismissModalViewControllerAnimated:YES];
    
//}

// some category methods that we had defined
/*-(void)UpdateDisplay{
    imageView.image = image;
    imageView.hidden=NO;
}
 
-(void)viewDidAppear:(BOOL)animated
{
   // [self UpdateDiaplay];
}
*/
- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// Do any additional setup after loading the view, typically from a nib.
    //imageFrame = imageView.frame;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

// this is to shrink the size of the image to fit in the specified block 


/*
static UIImage *shrinkImage(UIImage *original , CGSize size){
    CGFloat scale = [UIScreen mainScreen].scale;
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(NULL,size.width *scale,size.height *scale,8,0,colorSpace , kCGImageAlphaPremultipliedFirst);
    CGContextDrawImage(context, CGRectMake(0, 0,size.width *scale, size.height *scale), original.CGImage);
    
    CGImageRef shrunken = CGBitmapContextCreateImage(context);
    UIImage *final= [UIImage imageWithCGImage:shrunken];
 //   CGContextRealease(context);
    CGImageRelease(shrunken);
    return final;
}
*/
@end
