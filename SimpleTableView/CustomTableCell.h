//
//  CustomTableCell.h
//  SimpleTableView
//
//  Created by Jeff Lutzenberger on 2/19/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CustomTableCell : UITableViewCell {
    UISwitch* mySwitch;
    UILabel* myLabel;
}

@property (nonatomic, retain) IBOutlet UISwitch* mySwitch;
@property (nonatomic, retain) IBOutlet UILabel* myLabel;

@end
