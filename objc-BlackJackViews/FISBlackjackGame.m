//
//  FISBlackjackGame.m
//  BlackJack
//
//  Created by Cenker Demir on 6/16/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

#import "FISBlackjackGame.h"

@implementation FISBlackjackGame

-(instancetype)init {
    self = [super init];
    if (self) {
        _deck = [[FISCardDeck alloc] init];
        _house = [[FISBlackjackPlayer alloc] initWithName:@"House"];
        _player = [[FISBlackjackPlayer alloc] initWithName:@"Player"];
    }
    return self;
}

-(void)playBlackjack {
    [self.deck resetDeck];
    [self dealNewRound];
    
    NSUInteger i=0;
    while (i<3) {
        if (self.house.busted || self.player.busted)
            break;
        [self processPlayerTurn];
        [self processHouseTurn];
    i++;
    }
    [self incrementWinsAndLossesForHouseWins:[self houseWins]];
    NSLog(@"house:  %@",self.house);
    NSLog(@"player: %@",self.player);
}


-(void)dealNewRound {
    [self dealCardToPlayer];
    [self dealCardToHouse];
    [self dealCardToPlayer];
    [self dealCardToHouse];
}

-(void)dealCardToPlayer {
    [self.player acceptCard:[self.deck drawNextCard]];
}

-(void)dealCardToHouse {
    [self.house acceptCard:[self.deck drawNextCard]];
}

-(void)processPlayerTurn {
    
    if (!self.player.busted && !self.player.stayed) {
        if ([self.player shouldHit])
            [self dealCardToPlayer];
    }
}

-(void)processHouseTurn {
    if (!self.house.busted && !self.house.stayed) {
        if ([self.house shouldHit])
            [self dealCardToHouse];
    }
}

-(BOOL)houseWins {
    BOOL didHouseWin = YES;
    if (self.house.busted) {
        didHouseWin = NO;
    }
    else if (self.player.busted) {
        didHouseWin = YES;
    }
    else if ((self.player.handscore > self.house.handscore || self.player.blackjack == YES)) {
        didHouseWin = NO;
    }
    return didHouseWin;
}

-(void)incrementWinsAndLossesForHouseWins:(BOOL)houseWins {
    if (houseWins) {
        self.house.wins++;
        self.player.losses++;
        NSLog(@"house won!");
    }
   else{
        self.player.wins++;
        self.house.losses++;
        NSLog(@"player won!");
    }
    NSLog(@"house: wins:%lu losses:%lu", self.house.wins, self.house.losses);
    NSLog(@"player: wins:%lu losses:%lu", self.player.wins, self.player.losses);
}

@end
