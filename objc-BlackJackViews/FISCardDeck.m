//
//  FISCardDeck.m
//  OOP-Cards-Model
//
//  Created by Cenker Demir on 6/16/16.
//  Copyright © 2016 Al Tyus. All rights reserved.
//

#import "FISCardDeck.h"

@implementation FISCardDeck

-(instancetype)init {
    self = [super init];
    if (self) {
        _remainingCards = [[NSMutableArray alloc] init];
        _dealtCards = [[NSMutableArray alloc] init];
        [self generateACardDeck];
    }
    return self;
}

- (FISCard *)drawNextCard {
    if ([self.remainingCards count] > 0) {
        FISCard *cardToDraw = self.remainingCards[[self.remainingCards count] - 1];
        [self.remainingCards removeObject:cardToDraw];
        [self.dealtCards addObject:cardToDraw];
        NSLog(@"remaining:%lu dealt:%lu", [self.remainingCards count], [self.dealtCards count]);
        return cardToDraw;
    }
    NSLog(@"The deck is empty!");
    return nil;
}

- (void)resetDeck {
    [self gatherDealtCards];
    [self shuffleRemainingCards];
}

- (void)gatherDealtCards {
    [self.remainingCards addObjectsFromArray:self.dealtCards];
    [self.dealtCards removeAllObjects];
}

- (void)shuffleRemainingCards {

    for (NSUInteger i=0; i < 100; i++) {
        NSUInteger firstIndex = arc4random_uniform((uint32_t)[self.remainingCards count]);
        NSUInteger secondIndex = firstIndex;
        while (secondIndex == firstIndex) {
            secondIndex = arc4random_uniform((uint32_t)[self.remainingCards count]);
        }
        [self.remainingCards exchangeObjectAtIndex:firstIndex withObjectAtIndex:secondIndex];
    }
}

- (void)generateACardDeck {
    NSArray *allSuits = [FISCard validSuits];
    NSArray *allRanks = [FISCard validRanks];
    
    for (NSUInteger i=0; i < [allSuits count]; i++) {
        for (NSUInteger j=0; j < [allRanks count]; j++) {
            FISCard *cardToAdd = [[FISCard alloc] initWithSuit:allSuits[i] rank:allRanks[j]];
            [self.remainingCards addObject:cardToAdd];
        }
    }
}

- (NSString *)description {
    NSString *allCards = [NSString stringWithFormat:@"count: %lu\ncards:\n", [self.remainingCards count]];
    for (FISCard *eachCard in self.remainingCards) {
        allCards = [allCards stringByAppendingString:[NSString stringWithFormat:@"%@ ",eachCard.description]];
    }
    return allCards;
}

@end


