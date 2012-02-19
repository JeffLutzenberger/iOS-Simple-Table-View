//
//  CustomTableCell.m
//  SimpleTableView
//
//  Created by Jeff Lutzenberger on 2/19/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "CustomTableCell.h"


@implementation CustomTableCell

@synthesize mySwitch;
@synthesize myLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc
{
    [super dealloc];
}

@end
