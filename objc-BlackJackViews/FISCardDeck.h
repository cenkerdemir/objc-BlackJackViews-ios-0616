//
//  FISCardDeck.h
//  OOP-Cards-Model
//
//  Created by Cenker Demir on 6/16/16.
//  Copyright © 2016 Al Tyus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FISCard.h"

@interface FISCardDeck : NSObject

@property (nonatomic) NSMutableArray *remainingCards;
@property (nonatomic) NSMutableArray *dealtCards;

- (FISCard *)drawNextCard;
- (void)resetDeck;
- (void)gatherDealtCards;
- (void)shuffleRemainingCards;

-(instancetype)init;

@end
