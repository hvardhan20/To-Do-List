//
//  addTaskViewController.m
//  mytodolist
//
//  Created by Harshavardhan on 25/09/14.
//  Copyright (c) 2014 testing. All rights reserved.
//

#import "addTaskViewController.h"

@interface addTaskViewController ()
@property (strong, nonatomic) IBOutlet UITextField *addItemTextField;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *doneButton;
@property (strong, nonatomic) IBOutlet UILabel *addItemTime;

@end

@implementation addTaskViewController
{
    NSString *taskDate;
}
@synthesize taskAddDate;
-(void)handleSingleTap:(UITapGestureRecognizer *)sender
{
    [self.addItemTextField resignFirstResponder];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
   
    [self.taskAddDate addTarget:self action:@selector(datePickerChanged:) forControlEvents:UIControlEventValueChanged];
    
    UITapGestureRecognizer  *singletap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(	handleSingleTap:)];
    [self.view addGestureRecognizer:singletap];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)datePickerChanged:(UIDatePicker *)datePicker
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd-MM HH:mm"];
    NSString *strDate = [dateFormatter stringFromDate:datePicker.date];
    self.addItemTime.text = strDate;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
   if(sender
      !=self.doneButton)
       return;
    if([self.addItemTextField.text isEqualToString:@""]||[self.addItemTime.text isEqual:nil])
    {
        UIAlertView *emptyAlert=[[UIAlertView alloc]initWithTitle:@"Task is Empty" message:@"Please Enter a task" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Okay", nil];
        [emptyAlert show];
    }
    if(self.addItemTextField.text.length>0)
    {
        self.actualtodoitem=[[todoItem alloc]init];
        self.actualtodoitem.itemName=self.addItemTextField.text;
        self.actualtodoitem.itemTime=self.addItemTime.text;
        //NSLog(@"%@",self.actualtodoitem.itemTime);
        self.actualtodoitem.completed=NO;
    }
    
}


@end
