//
//  main.m
//  W1D3Threelow
//
//  Created by Karlo Pagtakhan on 03/09/2016.
//  Copyright © 2016 AccessIT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dice.h"

int main(int argc, const char * argv[]) {
  @autoreleasepool {
    
    Dice *dice1 = [[Dice alloc] init];
    Dice *dice2 = [[Dice alloc] init];
    Dice *dice3 = [[Dice alloc] init];
    Dice *dice4 = [[Dice alloc] init];
    Dice *dice5 = [[Dice alloc] init];
    Dice *dice6 = [[Dice alloc] init];
    
    [dice1 randomizeValue];
    [dice2 randomizeValue];
    [dice3 randomizeValue];
    [dice4 randomizeValue];
    [dice5 randomizeValue];
    [dice6 randomizeValue];
    
    NSLog(@"Dice #1 value: %@", [dice1 getCurrentValue]);
    NSLog(@"Dice #2 value: %@", [dice2 getCurrentValue]);
    NSLog(@"Dice #3 value: %@", [dice3 getCurrentValue]);
    NSLog(@"Dice #4 value: %@", [dice4 getCurrentValue]);
    NSLog(@"Dice #5 value: %@", [dice5 getCurrentValue]);
    NSLog(@"Dice #6 value: %@", [dice6 getCurrentValue]);
    
  }
    return 0;
}
