//
//  SimpleTableViewViewController.h
//  SimpleTableView
//
//  Created by Jeff Lutzenberger on 2/19/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CustomTableCell.h"

@interface SimpleTableViewViewController : UITableViewController {
    UITableView* myTableView;
    CustomTableCell* customTableCell;
}

-(void) UpdateData;

@property (nonatomic, retain) IBOutlet NSMutableArray* dataGroups;
@property (nonatomic, retain) IBOutlet UITableView* myTableView;
@property (nonatomic, retain) IBOutlet CustomTableCell* customTableCell;

@end
