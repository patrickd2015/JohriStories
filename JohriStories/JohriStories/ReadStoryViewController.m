//
//  ViewController.m
//  JohriStories
//
//  Created by Patrick Dong on 8/1/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "ReadStoryViewController.h"

@interface ReadStoryViewController ()

@end

@implementation ReadStoryViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.content.text = self.contentText;
    self.name.text = self.nameText;
    
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
