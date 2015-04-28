//
//  ViewController.m
//  UIAnimations
//
//  Created by Nikolay on 27.04.15.
//  Copyright (c) 2015 gng. All rights reserved.
//

#import "ViewController.h"
#import "Animations.h"


@interface ViewController ()

//view_BG_YES
@property (weak, nonatomic) IBOutlet UIView *view_BG_YES;

@property (weak, nonatomic) IBOutlet UIView *view_Check_YES;

- (IBAction)action_YES:(id)sender;


//view_BG_NO
@property (weak, nonatomic) IBOutlet UIView *view_BG_NO;

@property (weak, nonatomic) IBOutlet UIView *view_Check_NO;

- (IBAction)action_NO:(id)sender;


//textField
@property (weak, nonatomic) IBOutlet UITextField *textField;

@property (weak, nonatomic) IBOutlet UILabel *label_PlaceHolder;

- (IBAction)textField_Changed:(id)sender;


//textField2
@property (weak, nonatomic) IBOutlet UITextField *textField2;

- (IBAction)textField2_Changed:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *label_TextHolder;

//switch

@property (weak, nonatomic) IBOutlet UIView *view_BG_Switch;

@property (weak, nonatomic) IBOutlet UIView *view_Act_Switch;

@property (weak, nonatomic) IBOutlet UILabel *text_Switch;

- (IBAction)action_Changed:(id)sender;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    isYes = NO;
    isPlaceHolderHiden = NO;
    isTextHolderMove = NO;
    
    isSwitchON = YES;
    
    [self setView];
    
}

- (void) setView {
    
    self.textField.layer.borderColor = [UIColor colorWithWhite:1.0 alpha:0.10].CGColor;
    //self.textField.layer.borderColor = [UIColor redColor].CGColor;
    self.textField.layer.borderWidth = 1.0;
    self.textField.layer.cornerRadius = 5.0;
    
    //self.textField.layer.borderColor = [UIColor colorWithWhite:1.0 alpha:0.10].CGColor;
    self.textField2.layer.borderColor = [UIColor redColor].CGColor;
    self.textField2.layer.borderWidth = 1.0;
    self.textField2.layer.cornerRadius = 5.0;
    
    
    self.view_Check_NO.backgroundColor = [UIColor blueColor];
    
    self.view_BG_YES.layer.borderColor = [UIColor redColor].CGColor;
    self.view_BG_YES.layer.borderWidth = 1.0;
    self.view_BG_YES.layer.cornerRadius = 5.0;
    self.view_Check_YES.layer.borderColor = [UIColor blueColor].CGColor;
    self.view_Check_YES.layer.borderWidth = 1.0;
    self.view_Check_YES.layer.cornerRadius = 5.0;
    
    self.view_BG_NO.layer.borderColor = [UIColor redColor].CGColor;
    self.view_BG_NO.layer.borderWidth = 1.0;
    self.view_BG_NO.layer.cornerRadius = 5.0;
    self.view_Check_NO.layer.borderColor = [UIColor blueColor].CGColor;
    self.view_Check_NO.layer.borderWidth = 1.0;
    self.view_Check_NO.layer.cornerRadius = 5.0;
    
    self.view_BG_Switch.layer.backgroundColor = [UIColor yellowColor].CGColor;
    self.view_BG_Switch.layer.borderWidth = 2.0;
    self.view_BG_Switch.layer.cornerRadius = 10.0;
    self.view_Act_Switch.layer.backgroundColor = [UIColor blueColor].CGColor;
    self.view_Act_Switch.layer.borderWidth = 3.0;
    self.view_Act_Switch.layer.cornerRadius = 10.0;
    
    
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField {
    
    [self.textField resignFirstResponder];
    
    return YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)action_YES:(id)sender {
    
    if (!isYes) {
        isYes = YES;
        
        [Animations change_Check_Box:self.view_Check_YES Color:[UIColor blueColor]];
        [Animations change_Check_Box:self.view_Check_NO Color:[UIColor whiteColor]];
        
        [Animations change_BGColor:self.textField BGColor:[UIColor yellowColor]];
        
        [Animations moveUP_DOWN_View:self.textField2 Points:50];
        [Animations moveUP_DOWN_View:self.label_TextHolder Points:50];

        //self.view_Check_YES.backgroundColor = [UIColor blueColor];
        //self.view_Check_NO.backgroundColor = [UIColor whiteColor];
        
    }
    
}
- (IBAction)action_NO:(id)sender {

    if (isYes) {
        isYes = NO;
        
        [Animations change_Check_Box:self.view_Check_YES Color:[UIColor whiteColor]];
        [Animations change_Check_Box:self.view_Check_NO Color:[UIColor blueColor]];
      
        [Animations change_BGColor:self.textField BGColor:[UIColor whiteColor]];
      
        [Animations moveUP_DOWN_View:self.textField2 Points:-50];
        [Animations moveUP_DOWN_View:self.label_TextHolder Points:-50];

        
        //self.view_Check_YES.backgroundColor = [UIColor whiteColor];
        //self.view_Check_NO.backgroundColor = [UIColor blueColor];
        
    }

}

- (IBAction)textField_Changed:(id)sender {

    
    if (self.textField.text.length == 0) {
    
        if (isPlaceHolderHiden) {
            [Animations move_PlaceHolder:self.label_PlaceHolder Alpha:1];
            isPlaceHolderHiden = NO;
        }
    }
    else {
    
        if (!isPlaceHolderHiden) {
            [Animations move_PlaceHolder:self.label_PlaceHolder Alpha:0];
            isPlaceHolderHiden = YES;
        }
    }

}

- (IBAction)textField2_Changed:(id)sender {
    
    if (self.textField2.text.length == 0) {
        
        if (isTextHolderMove) {
            [Animations moveUP_DOWN_TextHolder:self.label_TextHolder Points:25 TextColor:[UIColor blackColor]];
            isTextHolderMove = NO;
        }
    }
    else {
        
        if (!isTextHolderMove) {
            [Animations moveUP_DOWN_TextHolder:self.label_TextHolder Points:-25 TextColor:[UIColor redColor]];
            isTextHolderMove = YES;
        }
    }
    
}

- (IBAction)action_Changed:(id)sender {
    
    if (isSwitchON) {
        
        [Animations move_Left_Right_View:self.view_Act_Switch Points:200];
        [Animations change_Text_Label:self.text_Switch newText:@"OFF"];
        
        isSwitchON = NO;
        
    }
    else {
        
        [Animations move_Left_Right_View:self.view_Act_Switch Points:-200];
        [Animations change_Text_Label:self.text_Switch newText:@"ON"];

        isSwitchON = YES;
        
        
    }
    
}
@end
