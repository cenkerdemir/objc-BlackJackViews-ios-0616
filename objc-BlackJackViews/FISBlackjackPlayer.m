//
//  FISBlackjackPlayer.m
//  BlackJack
//
//  Created by Cenker Demir on 6/16/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

#import "FISBlackjackPlayer.h"

@implementation FISBlackjackPlayer

-(instancetype)init {
    return [self initWithName:@""];
}

-(instancetype)initWithName:(NSString *)name {
    self = [super init];
    if (self) {
        _name = name;
        _cardsInHand = [[NSMutableArray alloc] init];
        
        _handscore = 0;
        _wins = 0;
        _losses = 0;
        
        _aceInHand = NO;
        _blackjack = NO;
        _busted = NO;
        _stayed = NO;
    }
    return self;
}

-(void)resetForNewGame {
    [self.cardsInHand removeAllObjects];
    self.handscore = 0;
    self.aceInHand = NO;
    self.stayed = NO;
    self.blackjack = NO;
    self.busted = NO;
}

-(void)acceptCard:(FISCard *)card {
    //Add the cards to cardsInHand array
    [self.cardsInHand addObject:card];
    
    //add the card value to the score in hand
    self.handscore += card.cardValue;
    
    //see if there is already an Ace in hand
    for (FISCard *myCard in self.cardsInHand) {
        if ([myCard.rank isEqualToString:@"A"]) {
            self.aceInHand = YES;
        }
    }
    // if you have 11 points or less, use the Ace as an 11, otherwise it is a hard 1
    if (self.aceInHand && self.handscore <= 11) {
        self.handscore += 10;
    }
    
    // you have 21 points? you have a blackjack!
    if (self.handscore == 21) {
        self.blackjack = YES;
    }
    // you have more than 21? you are busted
    else if (self.handscore > 21) {
        self.busted = YES;
    }
}


-(BOOL)shouldHit {
    if (self.handscore >= 17)
    {
        self.stayed = YES;
        return NO;
    }
    else
    {
        return YES;
    }
}

-(NSString *)description {
    NSMutableString *outputForPlayer = [[NSMutableString alloc] init];
    [outputForPlayer appendFormat:@"\n\nname  :%@\ncards :",self.name];
    for (FISCard *eachCard in self.cardsInHand) {
        [outputForPlayer appendFormat:@"%@ ",eachCard.cardLabel];
    }
    [outputForPlayer appendFormat:@"\nhandscore  :%lu\nace in hand:%lu\nstayed     :%lu\nblackjack  :%lu\nbusted     :%lu\n",self.handscore,[self giveMeOneOrZero:self.aceInHand],[self giveMeOneOrZero:self.stayed], [self giveMeOneOrZero:self.blackjack], [self giveMeOneOrZero:self.busted]];
    [outputForPlayer appendFormat:@"wins  :%lu\nlosses:%lu",self.wins,self.losses];
    
    return outputForPlayer;
}

-(NSUInteger)giveMeOneOrZero:(BOOL)boolValue {
    return boolValue?1:0;
}

@end
