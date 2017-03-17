/*
 Copyright (c) 2011-present, salesforce.com, inc. All rights reserved.
 
 Redistribution and use of this software in source and binary forms, with or without modification,
 are permitted provided that the following conditions are met:
 * Redistributions of source code must retain the above copyright notice, this list of conditions
 and the following disclaimer.
 * Redistributions in binary form must reproduce the above copyright notice, this list of
 conditions and the following disclaimer in the documentation and/or other materials provided
 with the distribution.
 * Neither the name of salesforce.com, inc. nor the names of its contributors may be used to
 endorse or promote products derived from this software without specific prior written
 permission of salesforce.com, inc.
 
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR
 IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
 FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
 CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
 WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY
 WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */


#import "RootViewController.h"

#import <SalesforceSDKCore/SFRestAPI.h>
#import <SalesforceSDKCore/SFRestRequest.h>

@implementation RootViewController
{
    NSArray *records;
    
    NSMutableArray  *Array_Image_Quality,
    *Array_Maneuverability,
    *Array_Overall_Experience,
    *Array_Ease_of_use,
    *Array_IsSufficient,
    *Array_IsAskQuestions,
    *Array_Is_Fully_Answered,
    *Array_Is_Acceptable,
    *Array_Comments,
    *Array_Demo_Physician_Name;
}

@synthesize dataRows;

#pragma mark Misc

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)dealloc
{
    self.dataRows = nil;
}


#pragma mark - View lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Demo Evaluation Form";
    
    //Here we use a query that should work on either Force.com or Database.com
//    SFRestRequest *request = [[SFRestAPI sharedInstance] requestForQuery:@"SELECT Name FROM User LIMIT 10"];
    
    SFRestRequest *request = [[SFRestAPI sharedInstance] requestForQuery:@"SELECT Id, Name, Opportunity__r.Name FROM Demo_Request__c"];
    [[SFRestAPI sharedInstance] send:request delegate:self];
    
//    [self testAPI];

    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    Array_Image_Quality = (NSMutableArray*) [userDefaults objectForKey:@"Image_Quality__c"];
    Array_Maneuverability = (NSMutableArray*) [userDefaults objectForKey:@"Maneuverability__c"];
    Array_Overall_Experience = (NSMutableArray*) [userDefaults objectForKey:@"Overall_Experience__c"];
    Array_Ease_of_use = (NSMutableArray*) [userDefaults objectForKey:@"Ease_of_use__c"];
    Array_IsSufficient = (NSMutableArray*) [userDefaults objectForKey:@"IsSufficient__c"];
    Array_IsAskQuestions = (NSMutableArray*) [userDefaults objectForKey:@"IsAskQuestions__c"];
    Array_Is_Fully_Answered = (NSMutableArray*) [userDefaults objectForKey:@"Is_Fully_Answered__c"];
    Array_Is_Acceptable = (NSMutableArray*) [userDefaults objectForKey:@"Is_Acceptable__c"];
    Array_Comments = (NSMutableArray*) [userDefaults objectForKey:@"Comments__c"];
    Array_Demo_Physician_Name = (NSMutableArray*) [userDefaults objectForKey:@"Demo_Physician_Name__c"];
    
}

- (void) testAPI {
    NSDictionary *fields = @{
                             @"Demo_Request__c":@"a014C000000wBO5QAM",
                             @"Image_Quality__c":@"2",
                             @"Maneuverability__c":@"1",
                             @"Overall_Experience__c":@"5",
                             @"Ease_of_use__c":@"4",
                             @"IsSufficient__c": @"true",
                             @"IsAskQuestions__c": @"false",
                             @"Is_Fully_Answered__c": @"true",
                             @"Is_Acceptable__c": @"true",
                             @"Comments__c": @"This is for test2",
                             @"Demo_Physician_Name__c": @"Bendt Jensen"
                             };
    SFRestRequest *request = [[SFRestAPI sharedInstance] requestForCreateWithObjectType:@"Demo_Eval_Form__c" fields:fields];
    [[SFRestAPI sharedInstance] send:request delegate:self];
}

#pragma mark - SFRestDelegate

- (void)request:(SFRestRequest *)request didLoadResponse:(id)jsonResponse {
    NSLog(@"Response:%@", jsonResponse);
    records = jsonResponse[@"records"];
    if (records){
        NSLog(@"records:%@", records);
        NSLog(@"request:didLoadResponse: #records: %lu", (unsigned long)records.count);
        self.dataRows = records;
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
    }
    else
    {
        [self.navigationController dismissViewControllerAnimated:NO completion:nil];
//        [self dismissViewControllerAnimated:NO completion:nil];
    }
}


- (void)request:(SFRestRequest*)request didFailLoadWithError:(NSError*)error {
    NSLog(@"request:didFailLoadWithError: %@", error);
    // Add your failed error handling here
}

- (void)requestDidCancelLoad:(SFRestRequest *)request {
    NSLog(@"requestDidCancelLoad: %@", request);
    // Add your failed error handling here
}

- (void)requestDidTimeout:(SFRestRequest *)request {
    NSLog(@"requestDidTimeout: %@", request);
    // Add your failed error handling here
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return (self.dataRows).count;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView_ cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"CellIdentifier";
    
    // Dequeue or create a cell of the appropriate type.
    UITableViewCell *cell = [tableView_ dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
        
    }
    // If you want to add an image to your cell, here's how.
    UIImage *image = [UIImage imageNamed:@"icon.png"];
    cell.imageView.image = image;
    
    // Configure the cell to show the data.
    NSDictionary *obj = dataRows[indexPath.row];
    cell.textLabel.text =  obj[@"Name"];
    
    // This adds the arrow to the right hand side.
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger count = [Array_Image_Quality count];
    NSString *Demo_Request__c = [[records objectAtIndex:indexPath.row] objectForKey:@"Id"];
    
    NSLog(@"Demo_Request__c:%@", Demo_Request__c);
    
    for (int i = 0; i < count; i++)
    {
        NSDictionary *fields = @{
                                 @"Demo_Request__c":Demo_Request__c,
                                 @"Image_Quality__c":(NSString*)[Array_Image_Quality objectAtIndex:i],
                                 @"Maneuverability__c":(NSString*)[Array_Maneuverability objectAtIndex:i],
                                 @"Overall_Experience__c":(NSString*)[Array_Overall_Experience objectAtIndex:i],
                                 @"Ease_of_use__c":(NSString*)[Array_Ease_of_use objectAtIndex:i],
                                 @"IsSufficient__c": (NSString*)[Array_IsSufficient objectAtIndex:i],
                                 @"IsAskQuestions__c": (NSString*)[Array_IsAskQuestions objectAtIndex:i],
                                 @"Is_Fully_Answered__c": (NSString*)[Array_Is_Fully_Answered objectAtIndex:i],
                                 @"Is_Acceptable__c": (NSString*)[Array_Is_Acceptable objectAtIndex:i],
                                 @"Comments__c": (NSString*)[Array_Comments objectAtIndex:i],
                                 @"Demo_Physician_Name__c": (NSString*)[Array_Demo_Physician_Name objectAtIndex:i]
                                 };
        [self createAPI:fields];
    }
    [self clearUserDefaults];
    [self.navigationController dismissViewControllerAnimated:NO completion:nil];
}
- (void) clearUserDefaults {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults removeObjectForKey:@"Image_Quality__c"];
    [userDefaults removeObjectForKey:@"Maneuverability__c"];
    [userDefaults removeObjectForKey:@"Overall_Experience__c"];
    [userDefaults removeObjectForKey:@"Ease_of_use__c"];
    [userDefaults removeObjectForKey:@"IsSufficient__c"];
    [userDefaults removeObjectForKey:@"IsAskQuestions__c"];
    [userDefaults removeObjectForKey:@"Is_Fully_Answered__c"];
    [userDefaults removeObjectForKey:@"Is_Acceptable__c"];
    [userDefaults removeObjectForKey:@"Comments__c"];
    [userDefaults removeObjectForKey:@"Demo_Physician_Name__c"];
    [userDefaults removeObjectForKey:@"Image_Quality__c"];
}
- (void) createAPI:(NSDictionary*) fields {
    SFRestRequest *request = [[SFRestAPI sharedInstance] requestForCreateWithObjectType:@"Demo_Eval_Form__c" fields:fields];
    [[SFRestAPI sharedInstance] send:request delegate:self];
}
@end
