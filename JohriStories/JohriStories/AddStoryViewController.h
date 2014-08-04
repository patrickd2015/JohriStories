//
//  AddStoryViewController.h
//  JohriStories
//
//  Created by Akshat Agrawal on 8/4/14.
//  Copyright (c) 2014 Akshat Agrawal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddStoryViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIBarButtonItem *doneButton;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *cancelButton;
@property (strong, nonatomic) IBOutlet UITextField *storyTitle;
@property (strong, nonatomic) IBOutlet UITextView *storyContent;

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *content;

@end
