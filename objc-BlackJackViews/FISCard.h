//
//  FISCard.h
//  OOP-Cards-Model
//
//  Created by Cenker Demir on 6/16/16.
//  Copyright © 2016 Al Tyus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FISCard : NSObject

@property (nonatomic, readonly) NSString *suit;
@property (nonatomic, readonly) NSString *rank;
@property (nonatomic, readonly) NSString *cardLabel;
@property (nonatomic, readonly) NSUInteger cardValue;

+ (NSArray *)validSuits;
+ (NSArray *)validRanks;

- (instancetype)init;
-(instancetype) initWithSuit:(NSString *)suit rank:(NSString *)rank;

@end
