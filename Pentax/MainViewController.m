//
//  MainViewController.m
//  Pentax
//
//  Created by coore on 3/7/17.
//  Copyright © 2017 PentaxOrganizationName. All rights reserved.
//

#import "MainViewController.h"
#import <SalesforceSDKCore/SFRestAPI.h>
#import <SalesforceSDKCore/SFRestRequest.h>


@interface MainViewController ()

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
    [self testAPI];
}

- (void)testAPI {
    
    SFRestRequest *request = [[SFRestRequest alloc] init];
    request.endpoint = @"/services/apexrest/demokpi";
    request.method = SFRestMethodGET;
    request.path = @"/services/apexrest/demokpi";
    // Create service call request
//    NSMutableDictionary *queryParams = [[NSMutableDictionary alloc] init];
//    NSString *appIDSTR = @”YOUR APP ID”;
//    [queryParams setValue:[NSString stringWithString:appIDSTR] forKey:@”app”];
    
//    request.queryParams = queryParams;
    
    [[SFRestAPI sharedInstance] send:request delegate:self];
}

#pragma mark - SFRestDelegate

- (void)request:(SFRestRequest *)request didLoadResponse:(id)jsonResponse {
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

- (IBAction)onBtnPoorQ:(id)sender{
    [(UIButton*)sender setSelected:YES];
    [self.btn_fair_quality setSelected:NO];
    [self.btn_average_quality setSelected:NO];
    [self.btn_favorable_quality setSelected:NO];
    [self.btn_excellent_quality setSelected:NO];
}
- (IBAction)onBtnFairQ:(id)sender{
    [(UIButton*)sender setSelected:YES];
    [self.btn_poor_quality setSelected:NO];
    [self.btn_average_quality setSelected:NO];
    [self.btn_favorable_quality setSelected:NO];
    [self.btn_excellent_quality setSelected:NO];
}
- (IBAction)onBtnAverageQ:(id)sender{
    [(UIButton*)sender setSelected:YES];
    [self.btn_poor_quality setSelected:NO];
    [self.btn_fair_quality setSelected:NO];
    [self.btn_favorable_quality setSelected:NO];
    [self.btn_excellent_quality setSelected:NO];
}
- (IBAction)onBtnFavorableQ:(id)sender{
    [(UIButton*)sender setSelected:YES];
    [self.btn_poor_quality setSelected:NO];
    [self.btn_fair_quality setSelected:NO];
    [self.btn_average_quality setSelected:NO];
    [self.btn_excellent_quality setSelected:NO];
}
- (IBAction)onBtnExcellentQ:(id)sender{
    [(UIButton*)sender setSelected:YES];
    [self.btn_poor_quality setSelected:NO];
    [self.btn_fair_quality setSelected:NO];
    [self.btn_average_quality setSelected:NO];
    [self.btn_favorable_quality setSelected:NO];
}

- (IBAction)onBtnPoorM:(id)sender{
    [(UIButton*)sender setSelected:YES];
    [self.btn_fair_m setSelected:NO];
    [self.btn_average_m setSelected:NO];
    [self.btn_favorable_m setSelected:NO];
    [self.btn_excellent_m setSelected:NO];
}
- (IBAction)onBtnFairM:(id)sender{
    [(UIButton*)sender setSelected:YES];
    [self.btn_poor_m setSelected:NO];
    
    [self.btn_average_m setSelected:NO];
    [self.btn_favorable_m setSelected:NO];
    [self.btn_excellent_m setSelected:NO];
}
- (IBAction)onBtnAverageM:(id)sender{
    [(UIButton*)sender setSelected:YES];
    [self.btn_poor_m setSelected:NO];
    [self.btn_fair_m setSelected:NO];
    
    [self.btn_favorable_m setSelected:NO];
    [self.btn_excellent_m setSelected:NO];
}
- (IBAction)onBtnFavorableM:(id)sender{
    [(UIButton*)sender setSelected:YES];
    [self.btn_poor_m setSelected:NO];
    [self.btn_fair_m setSelected:NO];
    [self.btn_average_m setSelected:NO];
    
    [self.btn_excellent_m setSelected:NO];
}
- (IBAction)onBtnExcellentM:(id)sender{
    [(UIButton*)sender setSelected:YES];
    [self.btn_poor_m setSelected:NO];
    [self.btn_fair_m setSelected:NO];
    [self.btn_average_m setSelected:NO];
    [self.btn_favorable_m setSelected:NO];
    
}

- (IBAction)onBtnPoorE:(id)sender{
    [(UIButton*)sender setSelected:YES];
    
    [self.btn_fair_e setSelected:NO];
    [self.btn_average_e setSelected:NO];
    [self.btn_favorable_e setSelected:NO];
    [self.btn_excellent_e setSelected:NO];
}
- (IBAction)onBtnFairE:(id)sender{
    [(UIButton*)sender setSelected:YES];
    [self.btn_poor_e setSelected:NO];
    
    [self.btn_average_e setSelected:NO];
    [self.btn_favorable_e setSelected:NO];
    [self.btn_excellent_e setSelected:NO];
}
- (IBAction)onBtnAverageE:(id)sender{
    [(UIButton*)sender setSelected:YES];
    [self.btn_poor_e setSelected:NO];
    [self.btn_fair_e setSelected:NO];
    
    [self.btn_favorable_e setSelected:NO];
    [self.btn_excellent_e setSelected:NO];
}
- (IBAction)onBtnFavorableE:(id)sender{
    [(UIButton*)sender setSelected:YES];
    [self.btn_poor_e setSelected:NO];
    [self.btn_fair_e setSelected:NO];
    [self.btn_average_e setSelected:NO];
    
    [self.btn_excellent_e setSelected:NO];
}
- (IBAction)onBtnExcellentE:(id)sender{
    [(UIButton*)sender setSelected:YES];
    [self.btn_poor_e setSelected:NO];
    [self.btn_fair_e setSelected:NO];
    [self.btn_average_e setSelected:NO];
    [self.btn_favorable_e setSelected:NO];
    
}

- (IBAction)onBtnPoorO:(id)sender{
    [(UIButton*)sender setSelected:YES];
    
    [self.btn_fair_o setSelected:NO];
    [self.btn_average_o setSelected:NO];
    [self.btn_favorable_o setSelected:NO];
    [self.btn_excellent_o setSelected:NO];
}
- (IBAction)onBtnFairO:(id)sender{
    [(UIButton*)sender setSelected:YES];
    [self.btn_poor_o setSelected:NO];
    
    [self.btn_average_o setSelected:NO];
    [self.btn_favorable_o setSelected:NO];
    [self.btn_excellent_o setSelected:NO];
}
- (IBAction)onBtnAverageO:(id)sender{
    [(UIButton*)sender setSelected:YES];
    [self.btn_poor_o setSelected:NO];
    [self.btn_fair_o setSelected:NO];
    
    [self.btn_favorable_o setSelected:NO];
    [self.btn_excellent_o setSelected:NO];
}
- (IBAction)onBtnFavorableO:(id)sender{
    [(UIButton*)sender setSelected:YES];
    [self.btn_poor_o setSelected:NO];
    [self.btn_fair_o setSelected:NO];
    [self.btn_average_o setSelected:NO];
    
    [self.btn_excellent_o setSelected:NO];
}
- (IBAction)onBtnExcellentO:(id)sender{
    [(UIButton*)sender setSelected:YES];
    [self.btn_poor_o setSelected:NO];
    [self.btn_fair_o setSelected:NO];
    [self.btn_average_o setSelected:NO];
    [self.btn_favorable_o setSelected:NO];
    
}

- (IBAction)onBtnNoS:(id)sender{
    [(UIButton*)sender setSelected:YES];
    [self.btn_yes_s setSelected:NO];
}
- (IBAction)onBtnYesS:(id)sender{
    [(UIButton*)sender setSelected:YES];
    [self.btn_no_s setSelected:NO];
}

- (IBAction)onBtnNoO:(id)sender{
    [(UIButton*)sender setSelected:YES];
    [self.btn_yes_o setSelected:NO];
}
- (IBAction)onBtnYesO:(id)sender{
    [(UIButton*)sender setSelected:YES];
    [self.btn_no_o setSelected:NO];
}

- (IBAction)onBtnNoF:(id)sender{
    [(UIButton*)sender setSelected:YES];
    [self.btn_yes_f setSelected:NO];
}
- (IBAction)onBtnYesF:(id)sender{
    [(UIButton*)sender setSelected:YES];
    [self.btn_no_f setSelected:NO];
}

- (IBAction)onBtnNoE:(id)sender{
    [(UIButton*)sender setSelected:YES];
    [self.btn_yes_e setSelected:NO];
}
- (IBAction)onBtnYesE:(id)sender{
    [(UIButton*)sender setSelected:YES];
    [self.btn_no_e setSelected:NO];
}
@end
