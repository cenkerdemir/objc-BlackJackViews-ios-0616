//
//  FISBlackjackViewController.m
//  objc-BlackJackViews
//
//  Created by Cenker Demir on 6/20/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

#import "FISBlackjackViewController.h"

@implementation FISBlackjackViewController

- (void)viewDidLoad {
    self.game = [[FISBlackjackGame alloc]init];
    [self resetLabels];
}

-(void)resetLabels {
    [self.winner setHidden:YES];
    
    //house hidden labels & buttons
    [self.houseScore setHidden:YES];
    [self.houseStayed setHidden:YES];
    [self.houseCard1 setHidden:YES];
    [self.houseCard2 setHidden:YES];
    [self.houseCard3 setHidden:YES];
    [self.houseCard4 setHidden:YES];
    [self.houseCard5 setHidden:YES];
    [self.houseBusted setHidden:YES];
    [self.houseBlacjackLabel setHidden:YES];
    
    //player hidden labels & buttons
    [self.playerStayed setHidden:YES];
    [self.playerCard1 setHidden:YES];
    [self.playerCard2 setHidden:YES];
    [self.playerCard3 setHidden:YES];
    [self.playerCard4 setHidden:YES];
    [self.playerCard5 setHidden:YES];
    [self.playerBusted setHidden:YES];
    [self.playerBlackjackLabel setHidden:YES];
    self.playerScore.text = [NSString stringWithFormat:@"Score: 0"];
}

- (IBAction)dealButtonTapped:(id)sender {
    [self resetLabels];
    [self.game.deck resetDeck];
    [self.game dealNewRound];
    [self.houseCard1 setHidden:NO];
    self.houseCard1.text = [self.game.house.cardsInHand[0] cardLabel];
    [self.houseCard2 setHidden:NO];
    self.houseCard2.text = [self.game.house.cardsInHand[1] cardLabel];
    [self.playerCard1 setHidden:NO];
    self.playerCard1.text = [self.game.player.cardsInHand[0] cardLabel];
    [self.playerCard2 setHidden:NO];
    self.playerCard2.text = [self.game.player.cardsInHand[1] cardLabel];
    self.playerScore.text = [NSString stringWithFormat:@"Score: %lu", self.game.player.handscore];
    
    if ([self isThereAWinnerYet] == NO) {
        [self.playerHitButtonLabel setEnabled:YES];
        [self.playerStayButtonLabel setEnabled:YES];
    }
    else {
        [self.game incrementWinsAndLossesForHouseWins:[self.game houseWins]];
        [self updateWinsLossesUI];
    }
}

-(BOOL)isThereAWinnerYet {
    BOOL isThereAWinner = NO;
    if (self.game.house.busted || self.game.player.busted){
        isThereAWinner = YES;
    }
    if (self.game.house.blackjack || self.game.player.blackjack) {
        isThereAWinner = YES;
    }
    if(([self.game.player.cardsInHand count] == 5 && [self.game.house.cardsInHand count] == 5) || (self.game.house.stayed && self.game.player.stayed)) {
        if (self.game.house.handscore != self.game.player.handscore) {
            isThereAWinner = YES;
        }
    }
    return isThereAWinner;
}

- (IBAction)playerHitButtonTapped:(id)sender {
    [self.game dealCardToPlayer];
    if (self.playerCard3.isHidden) {
        [self.playerCard3 setHidden:NO];
        self.playerCard3.text = [self.game.player.cardsInHand[[self.game.player.cardsInHand count]-1] cardLabel];
    }
    else if (self.playerCard4.isHidden) {
        [self.playerCard4 setHidden:NO];
        self.playerCard4.text = [self.game.player.cardsInHand[[self.game.player.cardsInHand count]-1] cardLabel];
    }
    else {
        [self.playerCard5 setHidden:NO];
        self.playerCard5.text = [self.game.player.cardsInHand[[self.game.player.cardsInHand count]-1] cardLabel];
    }
    self.playerScore.text = [NSString stringWithFormat:@"%lu", self.game.player.handscore];
    //NSLog(@"%lu", [self.game.player.cardsInHand count]);
    
    [self.game processHouseTurn];
    if ([self.game.house shouldHit]) {
        if (self.houseCard3.isHidden) {
            [self.houseCard3 setHidden:NO];
            self.houseCard3.text = [self.game.house.cardsInHand[[self.game.house.cardsInHand count]-1] cardLabel];
        }
        else if (self.houseCard4.isHidden) {
            [self.houseCard4 setHidden:NO];
            self.houseCard4.text = [self.game.house.cardsInHand[[self.game.house.cardsInHand count]-1] cardLabel];
        }
        else {
            [self.houseCard5 setHidden:NO];
            self.houseCard5.text = [self.game.house.cardsInHand[[self.game.house.cardsInHand count]-1] cardLabel];
        }
    }
    if ([self isThereAWinnerYet]) {
        [self.game incrementWinsAndLossesForHouseWins:[self.game houseWins]];
        [self updateWinsLossesUI];
    }
}

- (IBAction)playerStaybuttonTapped:(id)sender {
    [self.game.player setStayed:YES];
    [self.playerStayed setHidden:NO];
    self.playerHitButtonLabel.enabled = NO;
    self.playerStayButtonLabel.enabled = NO;
    [self.game processHouseTurn];
    if ([self.game.house shouldHit]) {
        if (self.houseCard3.isHidden) {
            [self.houseCard3 setHidden:NO];
            self.houseCard3.text = [self.game.house.cardsInHand[[self.game.house.cardsInHand count]-1] cardLabel];
        }
        else if (self.houseCard4.isHidden) {
            [self.houseCard4 setHidden:NO];
            self.houseCard4.text = [self.game.house.cardsInHand[[self.game.house.cardsInHand count]-1] cardLabel];
        }
        else {
            [self.houseCard5 setHidden:NO];
            self.houseCard5.text = [self.game.player.cardsInHand[[self.game.player.cardsInHand count]-1] cardLabel];
        }
    }
    if ([self isThereAWinnerYet]) {
        [self.game incrementWinsAndLossesForHouseWins:[self.game houseWins]];
    }
    [self.houseScore setHidden:NO];
    self.houseScore.text = [NSString stringWithFormat:@"%lu", self.game.house.handscore];
    [self updateWinsLossesUI];
}

-(void)updateWinsLossesUI {
    // house labels
    self.houseWinsLabel.text = [NSString stringWithFormat:@"Wins  : %lu", self.game.house.wins];
    self.houseLosses.text =    [NSString stringWithFormat:@"Losses: %lu", self.game.house.losses];
    if (self.game.house.busted) {
        [self.houseBusted setHidden:NO];
    }
    if (self.game.house.blackjack) {
        [self.houseBlacjackLabel setHidden:NO];
    }
    
    //player labels
    self.playerWinsLabel.text = [NSString stringWithFormat:@"Wins: %lu", self.game.player.wins];
    self.playerLosses.text = [NSString stringWithFormat:@"Losses: %lu", self.game.player.losses];
    if (self.game.player.busted) {
        [self.playerBusted setHidden:NO];
    }
    if (self.game.player.blackjack) {
        [self.playerBlackjackLabel setHidden:NO];
    }
    
    //update the winner label
    if ([self.game houseWins]) {
        [self.winner setHidden:NO];
        self.winner.text = @"House Wins!";
        self.houseScore.text = [NSString stringWithFormat:@"%lu", self.game.house.handscore];
    }
    else {
        [self.winner setHidden:NO];
        self.winner.text = @"You Win!";
        self.playerScore.text = [NSString stringWithFormat:@"%lu", self.game.player.handscore];
    }
}


@end
