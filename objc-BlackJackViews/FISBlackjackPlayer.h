//
//  FISBlackjackPlayer.h
//  BlackJack
//
//  Created by Cenker Demir on 6/16/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FISCard.h"

@interface FISBlackjackPlayer : NSObject

//properties
@property (nonatomic) NSString *name;
@property (strong ,nonatomic) NSMutableArray *cardsInHand;
@property (nonatomic) BOOL aceInHand;
@property (nonatomic) BOOL blackjack;
@property (nonatomic) BOOL busted;
@property (nonatomic) BOOL stayed;
@property (nonatomic) NSUInteger handscore;
@property (nonatomic) NSUInteger wins;
@property (nonatomic) NSUInteger losses;

//methods
-(instancetype)init;
-(instancetype)initWithName:(NSString *)name;
-(void)resetForNewGame;
-(void)acceptCard:(FISCard *)card;
-(BOOL)shouldHit;



@end
