//
//  FISBlackjackViewController.h
//  objc-BlackJackViews
//
//  Created by Cenker Demir on 6/20/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FISBlackjackGame.h"


@interface FISBlackjackViewController : UIViewController

@property (strong, nonatomic) FISBlackjackGame *game;

@property (weak, nonatomic) IBOutlet UILabel *winner;
@property (weak, nonatomic) IBOutlet UIButton *dealButtonLabel;

//house properties
@property (weak, nonatomic) IBOutlet UILabel *houseNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *houseStayed;
@property (weak, nonatomic) IBOutlet UILabel *houseScore;

@property (weak, nonatomic) IBOutlet UILabel *houseCard1;
@property (weak, nonatomic) IBOutlet UILabel *houseCard2;
@property (weak, nonatomic) IBOutlet UILabel *houseCard3;
@property (weak, nonatomic) IBOutlet UILabel *houseCard4;
@property (weak, nonatomic) IBOutlet UILabel *houseCard5;

@property (weak, nonatomic) IBOutlet UILabel *houseWinsLabel;
@property (weak, nonatomic) IBOutlet UILabel *houseBusted;
@property (weak, nonatomic) IBOutlet UILabel *houseLosses;
@property (weak, nonatomic) IBOutlet UILabel *houseBlacjackLabel;


//player properties
@property (weak, nonatomic) IBOutlet UILabel *playerNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *playerStayed;
@property (weak, nonatomic) IBOutlet UILabel *playerScore;
@property (weak, nonatomic) IBOutlet UIButton *playerHitButtonLabel;
@property (weak, nonatomic) IBOutlet UIButton *playerStayButtonLabel;

@property (weak, nonatomic) IBOutlet UILabel *playerCard1;
@property (weak, nonatomic) IBOutlet UILabel *playerCard2;
@property (weak, nonatomic) IBOutlet UILabel *playerCard3;
@property (weak, nonatomic) IBOutlet UILabel *playerCard4;
@property (weak, nonatomic) IBOutlet UILabel *playerCard5;

@property (weak, nonatomic) IBOutlet UILabel *playerWinsLabel;
@property (weak, nonatomic) IBOutlet UILabel *playerBusted;
@property (weak, nonatomic) IBOutlet UILabel *playerLosses;
@property (weak, nonatomic) IBOutlet UILabel *playerBlackjackLabel;


@end
