//
//  MainViewController.m
//  Pentax
//
//  Created by coore on 3/7/17.
//  Copyright © 2017 PentaxOrganizationName. All rights reserved.
//

#import "MainViewController.h"
#import "RootViewController.h"
#import <SalesforceSDKCore/SFRestAPI.h>
#import <SalesforceSDKCore/SFRestRequest.h>


@interface MainViewController ()
{
    NSInteger   Image_Quality__c,
                Maneuverability__c,
                Overall_Experience__c,
                Ease_of_use__c;
    BOOL    IsSufficient__c, IsAskQuestions__c, Is_Fully_Answered__c, Is_Acceptable__c;
    NSString *Comments__c, *Demo_Physician_Name__c;
    
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

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                action:@selector(handleTapSubView:)];
    [self.viewSub addGestureRecognizer:singleTap];
    //Here we use a query that should work on either Force.com or Database.com
//    SFRestRequest *request = [[SFRestAPI sharedInstance] requestForQuery:@"SELECT Name FROM User LIMIT 10"];
//    [[SFRestAPI sharedInstance] send:request delegate:self];
    
    
    Array_Image_Quality = [[NSMutableArray alloc] init];
    Array_Maneuverability = [[NSMutableArray alloc] init];
    Array_Overall_Experience = [[NSMutableArray alloc] init];
    Array_Ease_of_use = [[NSMutableArray alloc] init];
    Array_IsSufficient = [[NSMutableArray alloc] init];
    Array_IsAskQuestions = [[NSMutableArray alloc] init];
    Array_Is_Fully_Answered = [[NSMutableArray alloc] init];
    Array_Is_Acceptable = [[NSMutableArray alloc] init];
    Array_Comments = [[NSMutableArray alloc] init];
    Array_Demo_Physician_Name = [[NSMutableArray alloc] init];
    
    [self updateButtons];
//    [self createAPI];
}
- (void) initialization {
    //Initialization
    Image_Quality__c = 1;
    Maneuverability__c = 1;
    Overall_Experience__c = 1;
    Ease_of_use__c = 1;
    IsSufficient__c = false;
    IsAskQuestions__c = false;
    Is_Fully_Answered__c = false;
    Is_Acceptable__c = false;
    Comments__c = @"";
    Demo_Physician_Name__c = @"";
    [self.txt_comment setText:@""];
    [self.txt_name setText:@""];
    [self updateButtons];
}
- (void) createAPI {
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
                             @"Comments__c": @"This is for test",
                             @"Demo_Physician_Name__c": @"Petro Lysenko"
                             };
    SFRestRequest *request = [[SFRestAPI sharedInstance] requestForCreateWithObjectType:@"Demo_Eval_Form__c" fields:fields];
    [[SFRestAPI sharedInstance] send:request delegate:self];
}
#pragma mark - SFRestDelegate

- (void)request:(SFRestRequest *)request didLoadResponse:(id)jsonResponse {
    NSLog(@"jsonResponse:%@", jsonResponse);
    NSArray *records = jsonResponse[@"records"];
    NSLog(@"request:didLoadResponse: #records: %lu", (unsigned long)records.count);
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
- (void)handleTapSubView:(UITapGestureRecognizer *)tap {
    [self.txt_name resignFirstResponder];
    [self.txt_comment resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void) updateButtons {
    if (Image_Quality__c == 1)
    {
         [self.btn_poor_quality setSelected:YES];
        [self.btn_fair_quality setSelected:NO];
        [self.btn_average_quality setSelected:NO];
        [self.btn_favorable_quality setSelected:NO];
        [self.btn_excellent_quality setSelected:NO];
    }
    else if (Image_Quality__c == 2)
    {
        [self.btn_poor_quality setSelected:NO];
        [self.btn_fair_quality setSelected:YES];
        [self.btn_average_quality setSelected:NO];
        [self.btn_favorable_quality setSelected:NO];
        [self.btn_excellent_quality setSelected:NO];
    }
    else if (Image_Quality__c == 3)
    {
        [self.btn_poor_quality setSelected:NO];
        [self.btn_fair_quality setSelected:NO];
        [self.btn_average_quality setSelected:YES];
        [self.btn_favorable_quality setSelected:NO];
        [self.btn_excellent_quality setSelected:NO];
    }
    else if (Image_Quality__c == 4)
    {
        [self.btn_poor_quality setSelected:NO];
        [self.btn_fair_quality setSelected:NO];
        [self.btn_average_quality setSelected:NO];
        [self.btn_favorable_quality setSelected:YES];
        [self.btn_excellent_quality setSelected:NO];
    }
    else if (Image_Quality__c == 5)
    {
        [self.btn_poor_quality setSelected:NO];
        [self.btn_fair_quality setSelected:NO];
        [self.btn_average_quality setSelected:NO];
        [self.btn_favorable_quality setSelected:NO];
        [self.btn_excellent_quality setSelected:YES];
    }
    
    
    if (Maneuverability__c == 1) {
        [self.btn_poor_m setSelected:YES];
        [self.btn_fair_m setSelected:NO];
        [self.btn_average_m setSelected:NO];
        [self.btn_favorable_m setSelected:NO];
        [self.btn_excellent_m setSelected:NO];
    }
    else if (Maneuverability__c == 2) {
        [self.btn_poor_m setSelected:NO];
        [self.btn_fair_m setSelected:YES];
        [self.btn_average_m setSelected:NO];
        [self.btn_favorable_m setSelected:NO];
        [self.btn_excellent_m setSelected:NO];
    }
    else if (Maneuverability__c == 3) {
        [self.btn_poor_m setSelected:NO];
        [self.btn_fair_m setSelected:NO];
        [self.btn_average_m setSelected:YES];
        [self.btn_favorable_m setSelected:NO];
        [self.btn_excellent_m setSelected:NO];
    }
    else if (Maneuverability__c == 4) {
        [self.btn_poor_m setSelected:NO];
        [self.btn_fair_m setSelected:NO];
        [self.btn_average_m setSelected:NO];
        [self.btn_favorable_m setSelected:YES];
        [self.btn_excellent_m setSelected:NO];
    }
    else if (Maneuverability__c == 5) {
        [self.btn_poor_m setSelected:NO];
        [self.btn_fair_m setSelected:NO];
        [self.btn_average_m setSelected:NO];
        [self.btn_favorable_m setSelected:NO];
        [self.btn_excellent_m setSelected:YES];
    }
    
    //Overal_experience
    if (Overall_Experience__c == 1) {
        [self.btn_poor_e setSelected:YES];
        [self.btn_fair_e setSelected:NO];
        [self.btn_average_e setSelected:NO];
        [self.btn_favorable_e setSelected:NO];
        [self.btn_excellent_e setSelected:NO];
    }
    else if (Overall_Experience__c == 2) {
        [self.btn_poor_e setSelected:NO];
        [self.btn_fair_e setSelected:YES];
        [self.btn_average_e setSelected:NO];
        [self.btn_favorable_e setSelected:NO];
        [self.btn_excellent_e setSelected:NO];
    }
    else if (Overall_Experience__c == 3) {
        [self.btn_poor_e setSelected:NO];
        [self.btn_fair_e setSelected:NO];
        [self.btn_average_e setSelected:YES];
        [self.btn_favorable_e setSelected:NO];
        [self.btn_excellent_e setSelected:NO];
    }
    else if (Overall_Experience__c == 4) {
        [self.btn_poor_e setSelected:NO];
        [self.btn_fair_e setSelected:NO];
        [self.btn_average_e setSelected:NO];
        [self.btn_favorable_e setSelected:YES];
        [self.btn_excellent_e setSelected:NO];
    }
    else if (Overall_Experience__c == 5) {
        [self.btn_poor_e setSelected:NO];
        [self.btn_fair_e setSelected:NO];
        [self.btn_average_e setSelected:NO];
        [self.btn_favorable_e setSelected:NO];
        [self.btn_excellent_e setSelected:YES];
    }
    
    if (Ease_of_use__c == 1) {
        [self.btn_poor_o setSelected:YES];
        [self.btn_fair_o setSelected:NO];
        [self.btn_average_o setSelected:NO];
        [self.btn_favorable_o setSelected:NO];
        [self.btn_excellent_o setSelected:NO];
    }
    else if (Ease_of_use__c == 2) {
        [self.btn_poor_o setSelected:NO];
        [self.btn_fair_o setSelected:YES];
        [self.btn_average_o setSelected:NO];
        [self.btn_favorable_o setSelected:NO];
        [self.btn_excellent_o setSelected:NO];
    }
    else if (Ease_of_use__c == 3) {
        [self.btn_poor_o setSelected:NO];
        [self.btn_fair_o setSelected:NO];
        [self.btn_average_o setSelected:YES];
        [self.btn_favorable_o setSelected:NO];
        [self.btn_excellent_o setSelected:NO];
    }
    else if (Ease_of_use__c == 4) {
        [self.btn_poor_o setSelected:NO];
        [self.btn_fair_o setSelected:NO];
        [self.btn_average_o setSelected:NO];
        [self.btn_favorable_o setSelected:YES];
        [self.btn_excellent_o setSelected:NO];
    }
    else if (Ease_of_use__c == 5) {
        [self.btn_poor_o setSelected:NO];
        [self.btn_fair_o setSelected:NO];
        [self.btn_average_o setSelected:NO];
        [self.btn_favorable_o setSelected:NO];
        [self.btn_excellent_o setSelected:YES];
    }
    if (IsSufficient__c)
    {
        [self.btn_yes_s setSelected:YES];
        [self.btn_no_s setSelected:NO];
    }
    else
    {
        [self.btn_yes_s setSelected:NO];
        [self.btn_no_s setSelected:YES];
    }
    
    if (IsAskQuestions__c)
    {
        [self.btn_yes_o setSelected:YES];
        [self.btn_no_o setSelected:NO];
    }
    else
    {
        [self.btn_yes_o setSelected:NO];
        [self.btn_no_o setSelected:YES];
    }
    if (Is_Fully_Answered__c)
    {
        [self.btn_yes_f setSelected:YES];
        [self.btn_no_f setSelected:NO];
    }
    else
    {
        [self.btn_yes_f setSelected:NO];
        [self.btn_no_f setSelected:YES];
    }
    if (Is_Acceptable__c)
    {
        [self.btn_yes_e setSelected:YES];
        [self.btn_no_e setSelected:NO];
    }
    else
    {
        [self.btn_yes_e setSelected:NO];
        [self.btn_no_e setSelected:YES];
    }
    
}

- (IBAction)onBtnPoorQ:(id)sender{
    Image_Quality__c = 1;
    [self updateButtons];
}
- (IBAction)onBtnFairQ:(id)sender{
    Image_Quality__c = 2;
    [self updateButtons];
}
- (IBAction)onBtnAverageQ:(id)sender{
    Image_Quality__c = 3;
    [self updateButtons];
}
- (IBAction)onBtnFavorableQ:(id)sender{
    Image_Quality__c = 4;
    [self updateButtons];
}
- (IBAction)onBtnExcellentQ:(id)sender{
    Image_Quality__c = 5;
    [self updateButtons];
}

- (IBAction)onBtnPoorM:(id)sender{
    Maneuverability__c = 1;
    [self updateButtons];
}
- (IBAction)onBtnFairM:(id)sender{
    Maneuverability__c = 2;
    [self updateButtons];
}
- (IBAction)onBtnAverageM:(id)sender{
    Maneuverability__c = 3;
    [self updateButtons];
}
- (IBAction)onBtnFavorableM:(id)sender{
    Maneuverability__c = 4;
    [self updateButtons];
}
- (IBAction)onBtnExcellentM:(id)sender{
    Maneuverability__c = 5;
    [self updateButtons];
}

- (IBAction)onBtnPoorE:(id)sender{
    Overall_Experience__c = 1;
    [self updateButtons];
}
- (IBAction)onBtnFairE:(id)sender{
    Overall_Experience__c = 2;
    [self updateButtons];
}
- (IBAction)onBtnAverageE:(id)sender{
    Overall_Experience__c = 3;
    [self updateButtons];
}
- (IBAction)onBtnFavorableE:(id)sender{
    Overall_Experience__c = 4;
    [self updateButtons];
}
- (IBAction)onBtnExcellentE:(id)sender{
    Overall_Experience__c = 5;
    [self updateButtons];
    
}

- (IBAction)onBtnSubmit:(id)sender {
    [self initialization];
    RootViewController *rootVC = [[RootViewController alloc] initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:rootVC animated:YES];
}

- (NSString*)convertBooleanToString:(Boolean)value {
    NSString * booleanString = (value) ? @"true" : @"false";
    return booleanString;
}

- (IBAction)onBtnSave:(id)sender {
    if (self.txt_name.text == nil)
        Demo_Physician_Name__c = @"";
    else
        Demo_Physician_Name__c = self.txt_name.text;
    if (self.txt_comment.text == nil)
        Comments__c = @"";
    else
        Comments__c = self.txt_comment.text;
    
    [Array_Image_Quality addObject:[NSString stringWithFormat:@"%ld", Image_Quality__c]];
    [Array_Maneuverability addObject:[NSString stringWithFormat:@"%ld", Maneuverability__c]];
    [Array_Overall_Experience addObject:[NSString stringWithFormat:@"%ld", Overall_Experience__c]];
    [Array_Ease_of_use addObject:[NSString stringWithFormat:@"%ld", Ease_of_use__c]];
    [Array_IsSufficient addObject:[self convertBooleanToString:IsSufficient__c]];
    [Array_IsAskQuestions addObject:[self convertBooleanToString:IsAskQuestions__c]];
    [Array_Is_Fully_Answered addObject:[self convertBooleanToString:Is_Fully_Answered__c]];
    [Array_Is_Acceptable addObject:[self convertBooleanToString:Is_Acceptable__c]];
    [Array_Comments addObject:[NSString stringWithFormat:@"%@", Comments__c]];
    [Array_Demo_Physician_Name addObject:[NSString stringWithFormat:@"%@", Demo_Physician_Name__c]];
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults removeObjectForKey:@"Image_Quality__c"];
    [userDefaults setObject:Array_Image_Quality forKey:@"Image_Quality__c"];
    
    [userDefaults removeObjectForKey:@"Maneuverability__c"];
    [userDefaults setObject:Array_Maneuverability forKey:@"Maneuverability__c"];
    
    [userDefaults removeObjectForKey:@"Overall_Experience__c"];
    [userDefaults setObject:Array_Overall_Experience forKey:@"Overall_Experience__c"];
    
    [userDefaults removeObjectForKey:@"Ease_of_use__c"];
    [userDefaults setObject:Array_Ease_of_use forKey:@"Ease_of_use__c"];
    
    [userDefaults removeObjectForKey:@"IsSufficient__c"];
    [userDefaults setObject:Array_IsSufficient forKey:@"IsSufficient__c"];
    
    [userDefaults removeObjectForKey:@"IsAskQuestions__c"];
    [userDefaults setObject:Array_IsAskQuestions forKey:@"IsAskQuestions__c"];
    
    [userDefaults removeObjectForKey:@"Is_Fully_Answered__c"];
    [userDefaults setObject:Array_Is_Fully_Answered forKey:@"Is_Fully_Answered__c"];
    
    [userDefaults removeObjectForKey:@"Is_Acceptable__c"];
    [userDefaults setObject:Array_Is_Acceptable forKey:@"Is_Acceptable__c"];
    
    [userDefaults removeObjectForKey:@"Comments__c"];
    [userDefaults setObject:Array_Comments forKey:@"Comments__c"];
    
    [userDefaults removeObjectForKey:@"Demo_Physician_Name__c"];
    [userDefaults setObject:Array_Demo_Physician_Name forKey:@"Demo_Physician_Name__c"];
    
    [userDefaults removeObjectForKey:@"Image_Quality__c"];
    [userDefaults setObject:Array_Image_Quality forKey:@"Image_Quality__c"];
    
    [self initialization];
}

- (IBAction)onBtnClear:(id)sender {
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


- (IBAction)onBtnPoorO:(id)sender{
    Ease_of_use__c = 1;
    [self updateButtons];
}
- (IBAction)onBtnFairO:(id)sender{
    Ease_of_use__c = 2;
    [self updateButtons];
}
- (IBAction)onBtnAverageO:(id)sender{
    Ease_of_use__c = 3;
    [self updateButtons];
}
- (IBAction)onBtnFavorableO:(id)sender{
    Ease_of_use__c = 4;
    [self updateButtons];
}
- (IBAction)onBtnExcellentO:(id)sender{
    Ease_of_use__c = 5;
    [self updateButtons];
}

- (IBAction)onBtnNoS:(id)sender{
    IsSufficient__c = false;
    [self updateButtons];
}
- (IBAction)onBtnYesS:(id)sender{
    IsSufficient__c = true;
    [self updateButtons];
}

- (IBAction)onBtnNoO:(id)sender{
    IsAskQuestions__c = false;
    [self updateButtons];
}
- (IBAction)onBtnYesO:(id)sender{
    IsAskQuestions__c = true;
    [self updateButtons];
}

- (IBAction)onBtnNoF:(id)sender{
    Is_Fully_Answered__c = false;
    [self updateButtons];
}
- (IBAction)onBtnYesF:(id)sender{
    Is_Fully_Answered__c = true;
    [self updateButtons];
}

- (IBAction)onBtnNoE:(id)sender{
    Is_Acceptable__c = false;
    [self updateButtons];
}
- (IBAction)onBtnYesE:(id)sender{
    Is_Acceptable__c = true;
    [self updateButtons];
}
@end
