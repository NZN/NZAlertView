//
//  NZAlertView.h
//  NZAlertView
//
//  Created by Bruno Furtado on 18/12/13.
//  Copyright (c) 2013 No Zebra Network. All rights reserved.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, NZAlertStyle) {
    NZAlertStyleError = 0,
    NZAlertStyleSuccess,
    NZAlertStyleInfo
};

typedef void(^NZAlertViewCompletion)(void);

@interface NZAlertView : UIView

@property (nonatomic, assign) id delegate;
@property (nonatomic, assign) NZAlertStyle alertViewStyle;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *message;
@property (nonatomic, readonly, getter = isVisible) BOOL visible;

@property (nonatomic, copy) UIColor *statusBarColor;

@property (nonatomic, assign) NSString *fontName;
@property (nonatomic) NSTextAlignment textAlignment;
@property (nonatomic, assign) CGFloat alertDuration;
@property (nonatomic, assign) CGFloat animationDuration;
@property (nonatomic, assign) CGFloat screenBlurLevel;

- (id)initWithStyle:(NZAlertStyle)style
            message:(NSString *)message;

- (id)initWithStyle:(NZAlertStyle)style
              title:(NSString *)title
            message:(NSString *)message;

- (id)initWithStyle:(NZAlertStyle)style
              title:(NSString *)title
            message:(NSString *)message
           delegate:(id)delegate;

- (void)hide;

- (void)show;
- (void)showWithCompletion:(NZAlertViewCompletion)completion;

@end