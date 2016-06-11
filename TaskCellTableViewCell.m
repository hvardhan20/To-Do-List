//
//  TaskCellTableViewCell.m
//  mytodolist
//
//  Created by Harshavardhan on 26/09/14.
//  Copyright (c) 2014 testing. All rights reserved.
//

#import "TaskCellTableViewCell.h"

@implementation TaskCellTableViewCell
@synthesize taskLabel;
@synthesize taskTimeLabel;

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
