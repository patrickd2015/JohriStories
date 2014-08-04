//
//  CustomTableViewController.m
//  JohriStories
//
//  Created by Patrick Dong on 8/1/14.
//  Copyright (c) 2014 Patrick Dong. All rights reserved.
//

#import "ViewController.h"
#import "CustomTableViewController.h"
#import "AddStoryViewController.h"
#import "CustomTable.h"

@interface CustomTableViewController ()

@end

@implementation CustomTableViewController{
    NSArray *storyNames;
    NSArray *storyImages;
    NSArray *storyFiles;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    storyNames = [NSArray arrayWithObjects:@"Entrada: An Introduction to Mystical Mayhem", @"A Peter Pounding", @"Fishcake - El Pastel de Pescado", @"Como Me Gusta", @"8th Grade Superlatives", @"Samosas", @"WashBag", @"#aj2013", @"Hungry",@"Bittergrams",@"Abhishek Johri Day", @"The Gravity of a Black Hole",@"It’s a Christian Thing",@"Exodus: A Culmination of a Journey", nil];
    storyImages = [NSArray arrayWithObjects:@"Abhishek_1.png", @"Abhishek_2.png", @"Abhishek_3.png",@"Abhishek_4.png",@"Abhishek_5.png",@"Abhishek_6.png",@"Abhishek_7.png",@"Abhishek_8.png",@"Abhishek_9.png",@"Abhishek_10.png",@"Abhishek_11.png",@"Abhishek_12.png",@"Abhishek_13.png",@"Abhishek_14.png", nil];
    storyFiles = [NSArray arrayWithObjects:@"entrada", @"peterpounding", @"fishcake", @"megusta",@"superlatives",@"samosas",@"washbag", @"aj2013",@"hungry",@"bittergrams",@"johriday", @"blackhole", @"christian", @"exodus", nil];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [storyNames count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath
                                                                               *)indexPath
{
    static NSString *CellIdentifier = @"CustomTableCell";
    CustomTable *cell = (CustomTable *)[tableView
                                        dequeueReusableCellWithIdentifier:CellIdentifier];
    // Configure the cell...
    if (cell == nil) {
        cell = [[CustomTable alloc] initWithStyle:UITableViewCellStyleDefault
                                  reuseIdentifier:CellIdentifier];
    }
    // Display recipe in the table cell
    cell.nameLabel.text = [storyNames objectAtIndex:indexPath.row];
    cell.thumbnailImageView.image = [UIImage imageNamed:[storyImages
                                                         objectAtIndex:indexPath.row]];
    
    //    if (recipeChecked[indexPath.row]) {
    //        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    //    } else {
    //        cell.accessoryType = UITableViewCellAccessoryNone;
    //    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
//    cell.accessoryType = UITableViewCellAccessoryCheckmark;
//    recipeChecked[indexPath.row] = YES;
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"toAddStoryView"])
    {
        
    }
    else
    {
        ViewController *controller = segue.destinationViewController;
        CustomTable *source = (CustomTable *)sender;
        
        controller.nameText = source.nameLabel.text;
        
        NSInteger index = [storyNames indexOfObject:source.nameLabel.text];
        NSString *path = [[NSBundle mainBundle] pathForResource:[storyFiles objectAtIndex:index] ofType:@"txt"];
        controller.contentText = [NSString stringWithContentsOfFile:path
                                                           encoding:NSUTF8StringEncoding
                                                              error:NULL];
        
    }
    
}

- (IBAction)unwindToList:(UIStoryboardSegue *)segue
{
    AddStoryViewController *sender = segue.sourceViewController;
    
    if(sender.title.length > 0)
    {
        NSLog(@"Add to the lits of stories whoo");
    }
    
    
}

/*
 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
 {
 UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
 
 // Configure the cell...
 
 return cell;
 }
 */

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

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
