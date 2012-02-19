//
//  SimpleTableViewViewController.m
//  SimpleTableView
//
//  Created by Jeff Lutzenberger on 2/19/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "SimpleTableViewViewController.h"

#import "Group1Model.h"
#import "Group2Model.h"
#import "Group3Model.h"

@implementation SimpleTableViewViewController

@synthesize dataGroups;
@synthesize myTableView;
@synthesize customTableCell;

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    dataGroups = [[NSMutableArray alloc] init];
    
    [self UpdateData];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark UITableView methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [dataGroups count];// return 1;
}

// Customize the number of rows in the table view.
// get the number of properties for the selected shape
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    //Number of rows it should expect should be based on the section
    if( section == 0 )
    {
        NSDictionary *dictionary = [dataGroups objectAtIndex:section];
        NSArray *array = [dictionary objectForKey:@"Group 1"];
        return [array count];
    }
    else if( section == 1 )
    {
        NSDictionary *dictionary = [dataGroups objectAtIndex:section];
        NSArray *array = [dictionary objectForKey:@"Group 2"];
        return [array count];
    }
    else if( section == 2 )
    {
        NSDictionary *dictionary = [dataGroups objectAtIndex:section];
        NSArray *array = [dictionary objectForKey:@"Group 3"];
        return [array count];
    }
    return 0;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    if(section == 0)
        return @"Group 1";
    else if( section == 1 )
        return @"Group 2";
    else if( section == 2 )
        return @"Group 3";
    else
        return @"Other";
    
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Set up the cell...
    NSInteger section = [indexPath section];
    NSDictionary *dictionary = [dataGroups objectAtIndex:indexPath.section];

    //standard cell view
    if( section == 0 )
    {
        static NSString *Group1CellIdentifier = @"Group 1";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Group1CellIdentifier];
        if (cell == nil) {
            cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Group1CellIdentifier] autorelease];
        }
        
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        
        NSArray *array = [dictionary objectForKey:@"Group 1"];
        Group1Model* g1 = [array objectAtIndex:indexPath.row];
        cell.textLabel.font = [UIFont fontWithName:@"Helvetica" size:15];
        cell.textLabel.textColor = [UIColor blackColor];
        cell.textLabel.text = g1.someText;
        return cell;
    }
    //standard cell with detail text
    if( section == 1 )
    {
        static NSString *Group1CellIdentifier = @"Group 2";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Group1CellIdentifier];
        if (cell == nil) {
            cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:Group1CellIdentifier] autorelease];
        }
        
        cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
        
        NSArray *array = [dictionary objectForKey:@"Group 2"];
        Group1Model* g2 = [array objectAtIndex:indexPath.row];
        cell.textLabel.font = [UIFont fontWithName:@"Helvetica" size:15];
        cell.textLabel.textColor = [UIColor blackColor];
        cell.textLabel.text = g2.someText;
        cell.detailTextLabel.text = @"some detail text";
        cell.detailTextLabel.font = [UIFont fontWithName:@"Helvetica" size:10];
        cell.detailTextLabel.textColor = [UIColor blackColor];
        return cell;
    }
    //custom cell
    else if( section == 2 )
    {
        CustomTableCell* cell = (CustomTableCell*)[tableView dequeueReusableCellWithIdentifier:@"CustomTableCell"];
        
        if (cell == nil){
            //NSArray *topLevelObjects[[NSBundle mainBundle] loadNibNamed:@”iCodeBlogCustomCell” owner:nil options:nil];
            NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"CustomTableCell" owner:nil options:nil];
            
            for(id currentObject in topLevelObjects)
            {
                if([currentObject isKindOfClass:[CustomTableCell class]])
                {
                    cell = (CustomTableCell *)currentObject;
                    break;
                }
            }
        }
        
        
        /*static NSString *Group1CellIdentifier = @"Group 3";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Group1CellIdentifier];
        if (cell == nil) {
            cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Group1CellIdentifier] autorelease];
        }*/
        NSArray *array = [dictionary objectForKey:@"Group 3"];
        Group1Model* g3 = [array objectAtIndex:indexPath.row];
        cell.myLabel.font = [UIFont fontWithName:@"Helvetica" size:15];
        cell.myLabel.textColor = [UIColor blackColor];
        cell.myLabel.text = g3.someText;
        return cell;
    }
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
    /*NSDictionary *dictionary = [listOfItems objectAtIndex:indexPath.section];
     NSArray *array = [dictionary objectForKey:@"Countries"];
     NSString *selectedCountry = [array objectAtIndex:indexPath.row];
     
     //Initialize the detail view controller and display it.
     DetailViewController *dvController = [[DetailViewController alloc] initWithNibName:@"DetailView" bundle:[NSBundle mainBundle]];
     dvController.selectedCountry = selectedCountry;
     [self.navigationController pushViewController:dvController animated:YES];
     [dvController release];
     dvController = nil;
     
     
     // open a alert with an OK and cancel button
     NSString *alertString = [NSString stringWithFormat:@"Clicked on row #%d", [indexPath row]];
     UIAlertView *alert = [[UIAlertView alloc] initWithTitle:alertString message:@"" delegate:self cancelButtonTitle:@"Done" otherButtonTitles:nil];
     [alert show];
     [alert release];*/
}

#pragma mark my methods
- (void) UpdateData
{
    //load shape properties tables
    
    [dataGroups removeAllObjects];
    
    Group1Model* g11 = [[Group1Model alloc] autorelease];
    g11.someText = @"Group 1 - Object 1";
    
    Group1Model* g12 = [[Group1Model alloc] autorelease];
    g12.someText = @"Group 1 - Object 2";
    
    Group1Model* g21 = [[Group1Model alloc] autorelease];
    g21.someText = @"Group 2 - Object 1";
    
    Group1Model* g22 = [[Group1Model alloc] autorelease];
    g22.someText = @"Group 2 - Object 2";
    
    Group1Model* g31 = [[Group1Model alloc] autorelease];
    g31.someText = @"Group 3 - Object 1";
    
    Group1Model* g32 = [[Group1Model alloc] autorelease];
    g32.someText = @"Group 3 - Object 2";
    
    NSDictionary *group1Dict = [NSDictionary dictionaryWithObject:[[NSMutableArray alloc] initWithObjects:g11, g12, nil] forKey:@"Group 1"];

    NSDictionary *group2Dict = [NSDictionary dictionaryWithObject:[[NSMutableArray alloc] initWithObjects:g21, g22, nil] forKey:@"Group 2"];
    
    NSDictionary *group3Dict = [NSDictionary dictionaryWithObject:[[NSMutableArray alloc] initWithObjects:g31, g32, nil] forKey:@"Group 3"];
    
    [dataGroups addObject:group1Dict];
    [dataGroups addObject:group2Dict];
    [dataGroups addObject:group3Dict];
    
    [myTableView reloadData];
    
}


@end
