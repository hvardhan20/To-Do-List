//
//  todoListTableViewController.h
//  mytodolist
//
//  Created by Harshavardhan on 25/09/14.
//  Copyright (c) 2014 testing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface todoListTableViewController : UITableViewController <UIAlertViewDelegate>
-(IBAction)unwindToList:(UIStoryboardSegue*)sender;
@end
