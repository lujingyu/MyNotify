//
//  ViewController.m
//  MyNotify
//
//  Created by jingyu lu on 6/17/12.
//  Copyright (c) 2012 lujingyu. All rights reserved.
//

#import "ViewController.h"

NSString *didReceiveLocalNotification = @"didReceiveLocalNotification";

@interface ViewController ()

@end

@implementation ViewController
@synthesize table;

- (IBAction)actionAdd:(id)sender {
	UILocalNotification *notification = [[UILocalNotification alloc] init];
	notification.fireDate = [NSDate dateWithTimeIntervalSinceNow:100];
	notification.repeatInterval = 0;
	notification.timeZone = [NSTimeZone defaultTimeZone];
	notification.applicationIconBadgeNumber = 1;
	notification.soundName = UILocalNotificationDefaultSoundName;
	notification.alertBody = @"hello world";
	notification.alertAction = @"open it";
	notification.userInfo = [NSDictionary dictionaryWithObject:@"someValue" forKey:@"someKey"];
	[[UIApplication sharedApplication] scheduleLocalNotification:notification];
	[notification release];
	[table reloadData];
}

- (IBAction)actionDel:(id)sender {
	
}

- (IBAction)actionLog:(id)sender {
	
}

- (void)didReceiveLocalNotification:(NSNotification *)notification {
	[table reloadData];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didReceiveLocalNotification:) name:didReceiveLocalNotification object:nil];
}

- (void)dealloc {
	[[NSNotificationCenter defaultCenter] removeObserver:self name:didReceiveLocalNotification object:nil];
	[table release];
	[super dealloc];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
	self.table = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark -
#pragma UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [[[UIApplication sharedApplication] scheduledLocalNotifications] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *identifier = @"cell";
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
	if (cell == nil) {
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier] autorelease];
	}
	UILocalNotification *notification = [[[UIApplication sharedApplication] scheduledLocalNotifications] objectAtIndex:indexPath.row];
	cell.textLabel.text = [NSString stringWithFormat:@"%@", notification.fireDate];
	return cell;
}


@end
