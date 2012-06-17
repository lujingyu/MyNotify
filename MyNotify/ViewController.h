//
//  ViewController.h
//  MyNotify
//
//  Created by jingyu lu on 6/17/12.
//  Copyright (c) 2012 lujingyu. All rights reserved.
//

#import <UIKit/UIKit.h>

extern NSString *didReceiveLocalNotification;

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate> {
	
	UITableView *table;
}
@property (nonatomic, retain) IBOutlet UITableView *table;

- (IBAction)actionAdd:(id)sender;
- (IBAction)actionDel:(id)sender;
- (IBAction)actionLog:(id)sender;

@end
