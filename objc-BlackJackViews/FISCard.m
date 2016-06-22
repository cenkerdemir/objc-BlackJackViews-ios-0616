//
//  FISCard.m
//  OOP-Cards-Model
//
//  Created by Cenker Demir on 6/16/16.
//  Copyright © 2016 Al Tyus. All rights reserved.
//

#import "FISCard.h"

@interface FISCard()

@property (nonatomic, readwrite) NSString *suit;
@property (nonatomic, readwrite) NSString *rank;
@property (nonatomic, readwrite) NSString *cardLabel;
@property (nonatomic, readwrite) NSUInteger cardValue;

@end

@implementation FISCard

- (instancetype)init {
    return [self initWithSuit:@"!" rank:@"N"];
}

-(instancetype) initWithSuit:(NSString *)suit rank:(NSString *)rank {
    self = [super init];
    if (self) {
        _rank = rank;
        _suit = suit;
        _cardLabel = [NSString stringWithFormat:@"%@%@",suit, rank];
        _cardValue = [self giveMeTheCardValue:@[@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"] forRank:rank];
    }
    return self;
}

- (NSUInteger)giveMeTheCardValue:(NSArray *)ranks forRank:(NSString *)rank{
    NSUInteger cardValue = [ranks indexOfObject:rank]+1;
    if (cardValue > 9) {
        cardValue = 10;
    }
    return cardValue;
}

+(NSArray *)validSuits {
    return @[@"♠",@"♥", @"♣", @"♦"];
}

+ (NSArray *)validRanks {
    return @[@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

- (NSString *)description {
    return self.cardLabel;
}


@end
