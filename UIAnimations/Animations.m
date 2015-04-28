//
//  Animations.m
//  UIAnimations
//
//  Created by Nikolay on 27.04.15.
//  Copyright (c) 2015 gng. All rights reserved.
//

#import "Animations.h"

@implementation Animations

+ (void) change_Check_Box: (UIView *) view Color: (UIColor *) color {
 
    CATransition * animation = [CATransition animation];
    animation.type = kCATransitionFade;
    animation.duration = 0.5;
    
    //[animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
    //[animation setFillMode:kCAFillModeBoth];
    
    [view.layer addAnimation:animation forKey:@"Fade"];
    view.backgroundColor = color;
    
}

+ (void) move_PlaceHolder: (UILabel *) label Alpha: (int) alpha {
    
    CATransition * animation = [CATransition animation];
    animation.type = kCATransitionPush;
    
    if (alpha == 0) {
        animation.subtype = kCATransitionFromLeft;
    }
    else {
        animation.subtype = kCATransitionFromRight;

    }
    
    animation.duration = 0.5;
    
    //[animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
    //[animation setFillMode:kCAFillModeBoth];
    
    [label.layer addAnimation:animation forKey:@"Fade"];
    label.alpha = alpha;
    
}


+ (void) moveUP_DOWN_TextHolder:(UILabel *) label Points:(int) points TextColor: (UIColor *) textColor {
    
    CGRect newFrame = [label frame];
    newFrame.origin.y = label.frame.origin.y + points;
    
    [UIView animateWithDuration:2.5 delay:0.0 options:UIViewAnimationOptionTransitionNone animations:^{
        
        label.frame = newFrame;
        
        int64_t delay = 10;
        dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, delay * NSEC_PER_MSEC);
        dispatch_after(time, dispatch_get_main_queue(), ^{
            
            CATransition * animation = [CATransition animation];
            animation.type = kCATransitionFade;
            animation.duration = 2.5;
            
            //[animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
            //[animation setFillMode:kCAFillModeBoth];
            
            [label.layer addAnimation:animation forKey:@"Fade"];
            label.textColor = textColor;
            
        });
        
    } completion:^(BOOL finished) {
        
        if (finished) {
            NSLog(@"Animation is OK");
        }
    }];
    
    
}

+ (void) change_BGColor:(UIView *) view BGColor:(UIColor *) color {
    
    
    CATransition * animation = [CATransition animation];
    animation.type = kCATransitionFade;
    animation.duration = 1.5;
    
    //[animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
    //[animation setFillMode:kCAFillModeBoth];
    
    [view.layer addAnimation:animation forKey:@"Fade"];
    view.backgroundColor = color;

    
}

+ (void) moveUP_DOWN_View:(UIView *) view Points:(int) points {
    
    CGRect newFrame = [view frame];
    newFrame.origin.y = view.frame.origin.y + points;
    
    [UIView animateWithDuration:1.5 delay:0.0 options:UIViewAnimationOptionTransitionNone animations:^{
        
        view.frame = newFrame;
        
    } completion:^(BOOL finished) {
        
        if (finished) {
            NSLog(@"Animation is OK");
        }
    }];
    
    
}


+ (void) move_Left_Right_View:(UIView *) view Points:(int) points {
    
    CGRect newFrame = [view frame];
    newFrame.origin.x = view.frame.origin.x + points;
    
    [UIView animateWithDuration:1.5 delay:0.0 options:UIViewAnimationOptionTransitionNone animations:^{
        
        view.frame = newFrame;
        
    } completion:^(BOOL finished) {
        
        if (finished) {
            NSLog(@"Animation is OK");
        }
    }];
    
    
}

+ (void) change_Text_Label:(UILabel *) label newText: (NSString*) text {
    
    
    CATransition * animation = [CATransition animation];
    animation.type = kCATransitionFade;
    animation.duration = 1.5;
    
    [label.layer addAnimation:animation forKey:@"Fade"];
    label.text = text;

    
}

@end
