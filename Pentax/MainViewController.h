//
//  MainViewController.h
//  Pentax
//
//  Created by coore on 3/7/17.
//  Copyright © 2017 PentaxOrganizationName. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SalesforceSDKCore/SFRestAPI.h>

@interface MainViewController : UIViewController <SFRestDelegate>
@property (strong, nonatomic) IBOutlet UIView *viewSub;
@property (weak, nonatomic) IBOutlet UITextField *txt_name;
@property (weak, nonatomic) IBOutlet UITextView *txt_comment;
- (IBAction)onBtnSave:(id)sender;


// Quality
@property (weak, nonatomic) IBOutlet UIButton *btn_poor_quality;
@property (weak, nonatomic) IBOutlet UIButton *btn_fair_quality;
@property (weak, nonatomic) IBOutlet UIButton *btn_average_quality;
@property (weak, nonatomic) IBOutlet UIButton *btn_favorable_quality;
@property (weak, nonatomic) IBOutlet UIButton *btn_excellent_quality;
- (IBAction)onBtnPoorQ:(id)sender;
- (IBAction)onBtnFairQ:(id)sender;
- (IBAction)onBtnAverageQ:(id)sender;
- (IBAction)onBtnFavorableQ:(id)sender;
- (IBAction)onBtnExcellentQ:(id)sender;

// Maneuverabillity
@property (weak, nonatomic) IBOutlet UIButton *btn_poor_m;
@property (weak, nonatomic) IBOutlet UIButton *btn_fair_m;
@property (weak, nonatomic) IBOutlet UIButton *btn_average_m;
@property (weak, nonatomic) IBOutlet UIButton *btn_favorable_m;
@property (weak, nonatomic) IBOutlet UIButton *btn_excellent_m;
- (IBAction)onBtnPoorM:(id)sender;
- (IBAction)onBtnFairM:(id)sender;
- (IBAction)onBtnAverageM:(id)sender;
- (IBAction)onBtnFavorableM:(id)sender;
- (IBAction)onBtnExcellentM:(id)sender;

// Ease
@property (weak, nonatomic) IBOutlet UIButton *btn_poor_e;
@property (weak, nonatomic) IBOutlet UIButton *btn_fair_e;
@property (weak, nonatomic) IBOutlet UIButton *btn_average_e;
@property (weak, nonatomic) IBOutlet UIButton *btn_favorable_e;
@property (weak, nonatomic) IBOutlet UIButton *btn_excellent_e;
- (IBAction)onBtnPoorE:(id)sender;
- (IBAction)onBtnFairE:(id)sender;
- (IBAction)onBtnAverageE:(id)sender;
- (IBAction)onBtnFavorableE:(id)sender;
- (IBAction)onBtnExcellentE:(id)sender;

// Overal
@property (weak, nonatomic) IBOutlet UIButton *btn_poor_o;
@property (weak, nonatomic) IBOutlet UIButton *btn_fair_o;
@property (weak, nonatomic) IBOutlet UIButton *btn_average_o;
@property (weak, nonatomic) IBOutlet UIButton *btn_favorable_o;
@property (weak, nonatomic) IBOutlet UIButton *btn_excellent_o;
- (IBAction)onBtnPoorO:(id)sender;
- (IBAction)onBtnFairO:(id)sender;
- (IBAction)onBtnAverageO:(id)sender;
- (IBAction)onBtnFavorableO:(id)sender;
- (IBAction)onBtnExcellentO:(id)sender;

// sufficient
@property (weak, nonatomic) IBOutlet UIButton *btn_no_s;
@property (weak, nonatomic) IBOutlet UIButton *btn_yes_s;
- (IBAction)onBtnNoS:(id)sender;
- (IBAction)onBtnYesS:(id)sender;


// opportunity
@property (weak, nonatomic) IBOutlet UIButton *btn_no_o;
@property (weak, nonatomic) IBOutlet UIButton *btn_yes_o;
- (IBAction)onBtnNoO:(id)sender;
- (IBAction)onBtnYesO:(id)sender;

// fully
@property (weak, nonatomic) IBOutlet UIButton *btn_no_f;
@property (weak, nonatomic) IBOutlet UIButton *btn_yes_f;
- (IBAction)onBtnNoF:(id)sender;
- (IBAction)onBtnYesF:(id)sender;

// endoscopes
@property (weak, nonatomic) IBOutlet UIButton *btn_no_e;
@property (weak, nonatomic) IBOutlet UIButton *btn_yes_e;
- (IBAction)onBtnNoE:(id)sender;
- (IBAction)onBtnYesE:(id)sender;

// comments

@end
