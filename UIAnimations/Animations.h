//
//  Animations.h
//  UIAnimations
//
//  Created by Nikolay on 27.04.15.
//  Copyright (c) 2015 gng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface Animations : NSObject

+ (void) change_Check_Box: (UIView *) view Color: (UIColor *) color;

+ (void) move_PlaceHolder: (UILabel *) label Alpha: (int) alpha;

+ (void) moveUP_DOWN_TextHolder:(UILabel *) label Points:(int) points TextColor: (UIColor *) textColor;

+ (void) change_BGColor:(UIView *) view BGColor:(UIColor *) color;

+ (void) moveUP_DOWN_View:(UIView *) view Points:(int) points;

+ (void) move_Left_Right_View:(UIView *) view Points:(int) points;

+ (void) change_Text_Label:(UILabel *) label newText:(NSString*) text;



@end
