//
//  todoItem.h
//  mytodolist
//
//  Created by Harshavardhan on 25/09/14.
//  Copyright (c) 2014 testing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface todoItem : NSObject
@property NSString *itemName;
@property BOOL completed;
@property (readonly) NSDate *creationDate;
@property NSString *itemTime;
@end
