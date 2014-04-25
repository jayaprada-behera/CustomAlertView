//
//  WAViewController.m
//  CustomAlertView
//
//  Created by Jayaprada Behera on 25/04/14.
//  Copyright (c) 2014 Webileapps. All rights reserved.
//

#import "WAViewController.h"
#import "MyCustomViewOnAlert.h"

#define CUSTOM_ALERT_TAG         100
#define PASSWORD_ALERT_TAG       101

@interface WAViewController ()<UIAlertViewDelegate>
- (IBAction)ButtonTapped:(id)sender;
- (IBAction)paswordAlertButtonTapped:(id)sender;

@end

@implementation WAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)customAlertView{
    
    
    UIAlertView *Alert = [[UIAlertView alloc] initWithTitle:@"your Title" message:@"Your   Message" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Button1",@"Button2",nil];
    
    Alert.tag = CUSTOM_ALERT_TAG;

    
    NSArray *subviewArray = [[NSBundle mainBundle] loadNibNamed:@"MyCustomViewOnAlert" owner:self options:nil];
    
    MyCustomViewOnAlert *myView = (MyCustomViewOnAlert*) [subviewArray objectAtIndex:0];
    
    [Alert setValue:myView forKey:@"accessoryView"];
    
    [Alert show];

}
- (IBAction)ButtonTapped:(id)sender {
    
    [self customAlertView];
    
}

- (IBAction)paswordAlertButtonTapped:(id)sender {
    UIAlertView *Alert = [[UIAlertView alloc] initWithTitle:@"your Title" message:@"Your   Message" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Button",nil];
    
    Alert.tag = PASSWORD_ALERT_TAG;
    
    Alert.alertViewStyle = UIAlertViewStyleLoginAndPasswordInput;

    [Alert show];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{

    if (buttonIndex == alertView.cancelButtonIndex) {
        NSLog(@"Cancel Button Tapped");
    }else if (buttonIndex == 1){
        NSLog(@" Button1 Tapped");
    }else {
        NSLog(@"Button2 Tapped");
    }
}
@end
