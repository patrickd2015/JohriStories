//
//  CustomTable.m
//  JohriStories
//
//  Created by Patrick Dong on 8/1/14.
//  Copyright (c) 2014 Patrick Dong. All rights reserved.
//

#import "CustomTableCell.h"

@implementation CustomTableCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
