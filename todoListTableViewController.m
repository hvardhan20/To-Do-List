//
//  todoListTableViewController.m
//  mytodolist
//
//  Created by Harshavardhan on 25/09/14.
//  Copyright (c) 2014 testing. All rights reserved.
//

#import "todoListTableViewController.h"
#import "todoItem.h"
#import "addTaskViewController.h"
#import "TaskCellTableViewCell.h"

@interface todoListTableViewController ()

   @property NSMutableArray *todoItems;


@end

@implementation todoListTableViewController
{
    NSString *currentTime;
    todoItem *itemAccess;
}
@synthesize todoItems;
-(void)updateCurrentTime
{
    NSDate *today = [NSDate date];
    NSDateFormatter *dateFormatterSys = [[NSDateFormatter alloc] init];
    // display in 12HR/24HR (i.e. 11:25PM or 23:25) format according to User Settings
    [dateFormatterSys setDateFormat:@"dd-MM HH:mm"];
    currentTime = [dateFormatterSys stringFromDate:today];
   //  NSLog(@"User's current time in their preference format:%@",currentTime);
    NSInteger i;
    for (i=0; i<[todoItems count]; i++) {
        itemAccess=[self.todoItems objectAtIndex:i];
        if ([currentTime isEqualToString:itemAccess.itemTime]&&itemAccess.completed==NO) {
            UIAlertView *eventAlert=[[UIAlertView alloc]initWithTitle:@"YOU ARE REQUIRED TO COMPLETE THIS TASK" message:itemAccess.itemName delegate:self cancelButtonTitle:@"Skip" otherButtonTitles:@"Okay", nil];
            [eventAlert show];
          //  [eventAlert r]
            itemAccess.completed=YES;
        }
    }

}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.todoItems=[[NSMutableArray alloc]init];
    
    itemAccess=[[todoItem alloc]init];
   [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(updateCurrentTime) userInfo:nil repeats:YES];
      // NSLog(@"User's current time in their preference format:%@",currentTime);
    if([todoItems count]==0)
    {
        NSLog(@"The list is empty\n");
    }
   /* else if([todoItems count]!=0){
       static NSInteger i=0;
       // while (1) {
        itemAccess=[[todoItem alloc]init];
            for (i=0; i<=[todoItems count]; i++) {
                itemAccess=[todoItems objectAtIndex:i];
            if ([currentTime isEqualToString:itemAccess.itemTime]) {
                UIAlertView *eventAlert=[[UIAlertView alloc]initWithTitle:itemAccess.itemName message:@"The task is due" delegate:self cancelButtonTitle:@"Skip" otherButtonTitles:@"Okay", nil];
                [eventAlert show];
            }
        }*/
    //}
    //int i=0;
   /*while (1) {
       if(currentTime isEqualToString:[todoItems objectAtIndex:i])
    }*/
    //[self loadInitialData];
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
-(IBAction)unwindToList:(UIStoryboardSegue*)sender
{
    addTaskViewController *source=[sender sourceViewController];
    todoItem *item=source.actualtodoitem;
    if(item!=nil)
    {
        [self.todoItems addObject:item];
        [self.tableView reloadData];
    }
    if([todoItems count]!=0){
        
    }

/*-(void)loadInitialData
{
    
    todoItem *item1=[[todoItem alloc]init];
    item1.itemName=@"buy milk";
    [self.todoItems addObject:item1];
    todoItem *item2=[[todoItem alloc]init];;
    item2.itemName=@"do something";
    [self.todoItems addObject:item2];
    
}*/
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return [self.todoItems count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //static NSString *cellIdentifier=@"SimpleCellIdentifier";
    TaskCellTableViewCell *cell = (TaskCellTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"taskcell"];
    //if(cell==nil)
    //{
    //cell = [[TaskCellTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"taskcell"];
    NSArray *nib=[[NSBundle mainBundle]loadNibNamed:@"TaskCell" owner:self options:nil];
    cell=[nib objectAtIndex:0];
    //}
    todoItem *todoItemObj=[self.todoItems objectAtIndex:indexPath.row];
    
    cell.taskLabel.text=todoItemObj.itemName;
    cell.taskTimeLabel.text=todoItemObj.itemTime;
    if (todoItemObj.completed) {
        cell.accessoryType=UITableViewCellAccessoryCheckmark;
        //cell.accessoryType=UITableViewCellAccessoryCheckmark;
    }
    else{
            cell.accessoryType=UITableViewCellAccessoryNone;
    }
    
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
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
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    todoItem *tappedItem=[self.todoItems objectAtIndex:indexPath.row];
    tappedItem.completed= !tappedItem.completed;
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:NO];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle==UITableViewCellEditingStyleDelete) {
        [todoItems removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
    
}
@end
