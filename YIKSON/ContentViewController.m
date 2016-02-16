//
//  ContentViewController.m
//  YIKSON
//
//  Created by Shubham Sorte on 15/02/16.
//  Copyright © 2016 Shubham Sorte. All rights reserved.
//

#import "ContentViewController.h"
#import <MDCSwipeToChoose/MDCSwipeToChoose.h>

@interface ContentViewController () <MDCSwipeToChooseDelegate,UIActionSheetDelegate,UIGestureRecognizerDelegate>
{
    NSInteger count;
    MDCSwipeToChooseView *previousView;
    MDCSwipeToChooseView *currentView;
    UITapGestureRecognizer * tap;
    BOOL visible;
    UIActionSheet * myActionSheet;
    UILongPressGestureRecognizer * longPressOnImage; //To present action sheet
}
@end

@implementation ContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view
    count = 0;
    MDCSwipeToChooseViewOptions *options = [MDCSwipeToChooseViewOptions new];
    options.delegate = self;
    options.likedText = @"Like";
    options.likedColor = [UIColor blueColor];
    options.nopeText = @"Dislike";
    options.onPan = ^(MDCPanState *state){
        if (state.thresholdRatio == 1.f && state.direction == MDCSwipeDirectionLeft) {
            NSLog(@"Let go now to delete the photo!");
        }
    };
    
    tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(toggleOptionViewVisibilty)];
    visible = NO;
    
    myActionSheet = [[UIActionSheet alloc] initWithTitle:nil
                                                delegate:self
                                       cancelButtonTitle:@"Cancel"
                                  destructiveButtonTitle:nil
                                       otherButtonTitles:@"REPORT",@"FOLLOW CREATOR",@"QUICKSAVE",nil];
    
    //To change the tintcolor of button titles in action sheet (Only works on iOS 8 and up)
    SEL selector = NSSelectorFromString(@"_alertController");
    if ([myActionSheet respondsToSelector:selector])
    {
        UIAlertController *alertController = [myActionSheet valueForKey:@"_alertController"];
        if ([alertController isKindOfClass:[UIAlertController class]])
        {
            alertController.view.tintColor = UIColorFromRGB(0xff3300);
        }
    }
    
    longPressOnImage = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(presentActionView)];
    longPressOnImage.delegate = self;
    longPressOnImage.minimumPressDuration = 0.5f;
    [self.view addGestureRecognizer:longPressOnImage];
    
    previousView = [[MDCSwipeToChooseView alloc]
                                  initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.width)
                                  options:options];
    previousView.center = self.view.center;
    previousView.imageView.image = [UIImage imageNamed:@"feed0"];
    [self.view addGestureRecognizer:tap];
    [self.view addSubview:previousView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    _optionsViewOutlet.transform = CGAffineTransformMakeTranslation(0, 55);
}

- (void)presentActionView {
    SEL selector = NSSelectorFromString(@"_alertController");
    if ([myActionSheet respondsToSelector:selector])
    {
        UIAlertController *alertController = [myActionSheet valueForKey:@"_alertController"];
        if ([alertController isKindOfClass:[UIAlertController class]])
        {
            alertController.view.tintColor = UIColorFromRGB(0xff3300);
        }
    }
    [myActionSheet showInView:self.view];
}

- (void)toggleOptionViewVisibilty {
    if (visible) {
        [UIView animateWithDuration:0.5 animations:^{
            _optionsViewOutlet.transform = CGAffineTransformMakeTranslation(0, 55);
        }];
    }
    else {
        [UIView animateWithDuration:0.5 animations:^{
            _optionsViewOutlet.transform = CGAffineTransformIdentity;
        }];
    }
    visible =  !visible;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - MDCSwipeToChooseDelegate Callbacks

// This is called when a user didn't fully swipe left or right.
- (void)viewDidCancelSwipe:(UIView *)view {
    NSLog(@"Couldn't decide, huh?");
}

// Sent before a choice is made. Cancel the choice by returning `NO`. Otherwise return `YES`.
- (BOOL)view:(UIView *)view shouldBeChosenWithDirection:(MDCSwipeDirection)direction {
    if (direction == MDCSwipeDirectionLeft) {
        return YES;
    } else {
        // Snap the view back and cancel the choice.
        [UIView animateWithDuration:0.16 animations:^{
            view.transform = CGAffineTransformIdentity;
            view.center = [view superview].center;
        }];
        return NO;
    }
}

// This is called then a user swipes the view fully left or right.
- (void)view:(UIView *)view wasChosenWithDirection:(MDCSwipeDirection)direction {
    
    if (count+1 < 8) {
        count++;
    }
    
    MDCSwipeToChooseViewOptions *options = [MDCSwipeToChooseViewOptions new];
    options.delegate = self;
    options.likedText = @"Like";
    options.likedColor = [UIColor blueColor];
    options.nopeText = @"Dislike";
    options.onPan = ^(MDCPanState *state){
        if (state.thresholdRatio == 1.f && state.direction == MDCSwipeDirectionLeft) {
            NSLog(@"Let go now to delete the photo!");
        }
    };

    
    currentView = [[MDCSwipeToChooseView alloc]
                                  initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.width)
                                      options:options];
    currentView.center = self.view.center;
    currentView.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"feed%i.png",(int)count]];
    [self.view insertSubview:currentView belowSubview:previousView];
    
}


- (IBAction)cancelButtonPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
