//
//  CustomTableViewController.m
//  JohriStories
//
//  Created by Patrick Dong on 8/1/14.
//  Copyright (c) 2014 Patrick Dong. All rights reserved.
//

#import "ReadStoryViewController.h"
#import "CustomTableViewController.h"
#import "AddStoryViewController.h"
#import "CustomTableCell.h"
#import "Constants.h"

@interface CustomTableViewController ()

@property (strong, nonatomic) NSArray *stories;

@end

@implementation CustomTableViewController{
    NSArray *storyImages;
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
    [self getListOfStories];

    storyImages = [NSArray arrayWithObjects:@"Abhishek_1.png", @"Abhishek_2.png", @"Abhishek_3.png",@"Abhishek_4.png",@"Abhishek_5.png",@"Abhishek_6.png",@"Abhishek_7.png",@"Abhishek_8.png",@"Abhishek_9.png",@"Abhishek_10.png",@"Abhishek_11.png",@"Abhishek_12.png",@"Abhishek_13.png",@"Abhishek_14.png", nil];

    
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


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"rows per");
    
    return [self.stories count];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"cells");
    
    static NSString *CellIdentifier = @"CustomTableCell";
    CustomTableCell *cell = (CustomTableCell *)[tableView
                                        dequeueReusableCellWithIdentifier:CellIdentifier];
    // Configure the cell...
    if (cell == nil)
    {
        cell = [[CustomTableCell alloc] initWithStyle:UITableViewCellStyleDefault
                                  reuseIdentifier:CellIdentifier];
    }
    
    
    NSDictionary *thisStory = [self.stories objectAtIndex:indexPath.row];
    
    NSLog([thisStory objectForKey:@"title"]);
    
    // Display recipe in the table cell
    cell.nameLabel.text = [thisStory objectForKey:@"title"];
    cell.thumbnailImageView.image = [UIImage imageNamed:[storyImages
                                                         objectAtIndex:indexPath.row]];
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"toAddStoryView"])
    {
        
    }
    else
    {
        ReadStoryViewController *controller = segue.destinationViewController;
        CustomTableCell *source = (CustomTableCell *)sender;
        
        controller.nameText = source.nameLabel.text;
        
        for(id obj in self.stories)
        {
            if([[obj objectForKey:@"title"] isEqualToString:source.nameLabel.text])
            {
                controller.contentText = [obj objectForKey:@"content"];
            }
        }
        
    }
    
}

- (IBAction)unwindToList:(UIStoryboardSegue *)segue
{
    AddStoryViewController *sender = segue.sourceViewController;
    
    if(sender.title.length > 0)
    {
        NSLog(@"Add to the lits of stories whoo");
        [self getListOfStories];
    }
    
    
    
    
}

- (void)getListOfStories
{
    NSString *URL = @"https://api.parse.com/1/classes/story";
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:URL]];
    [request setValue:APP_ID forHTTPHeaderField:@"X-Parse-Application-Id"];
    [request setValue:REST_API_KEY forHTTPHeaderField:@"X-Parse-REST-API-Key"];
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    return;
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    NSLog(@"Reached!");
    NSLog(@"Response: %@", response);
    
    return;
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    NSLog(@"Reached!");
    NSError *error;
    
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    
    self.stories = [json objectForKey:@"results"];
    [self.tableView reloadData];
    
    //NSLog([[self.stories objectAtIndex:0] objectForKey:@"title"]);
    
    return;
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
