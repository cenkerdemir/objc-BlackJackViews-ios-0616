//
//  FISBlackjackGame.h
//  BlackJack
//
//  Created by Cenker Demir on 6/16/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FISBlackjackPlayer.h"
#import "FISCardDeck.h"


@interface FISBlackjackGame : NSObject

//properties
@property (nonatomic) FISCardDeck *deck;
@property (nonatomic) FISBlackjackPlayer *house;
@property (nonatomic) FISBlackjackPlayer *player;

//methods
-(void)playBlackjack;
-(void)dealNewRound;
-(void)dealCardToPlayer;
-(void)dealCardToHouse;
-(void)processPlayerTurn;
-(void)processHouseTurn;
-(BOOL)houseWins;
-(void)incrementWinsAndLossesForHouseWins:(BOOL)houseWins;


@end
