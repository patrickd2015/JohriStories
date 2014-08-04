//
//  AddStoryViewController.m
//  JohriStories
//
//  Created by Akshat Agrawal on 8/4/14.
//  Copyright (c) 2014 Akshat Agrawal. All rights reserved.
//

#import "AddStoryViewController.h"

@interface AddStoryViewController ()

@end

@implementation AddStoryViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if(sender != self.doneButton)
    {
        return;
    }
    else
    {
        self.title = self.storyTitle.text;
        self.content = self.storyContent.text;
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
