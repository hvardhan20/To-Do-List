//
//  addTaskViewController.h
//  mytodolist
//
//  Created by Harshavardhan on 25/09/14.
//  Copyright (c) 2014 testing. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "todoItem.h"
@interface addTaskViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIDatePicker *taskAddDate;
@property todoItem *actualtodoitem;
@end

