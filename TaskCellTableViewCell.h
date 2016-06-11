//
//  TaskCellTableViewCell.h
//  mytodolist
//
//  Created by Harshavardhan on 26/09/14.
//  Copyright (c) 2014 testing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TaskCellTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *taskLabel;
@property (strong, nonatomic) IBOutlet UILabel *taskTimeLabel;

@end
