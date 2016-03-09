//
//  main.m
//  W1D3Threelow
//
//  Created by Karlo Pagtakhan on 03/09/2016.
//  Copyright © 2016 AccessIT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dice.h"
#import "InputCollector.h"

int main(int argc, const char * argv[]) {
  @autoreleasepool {
    
    InputCollector *inputGetter = [[InputCollector alloc] init];
    NSString *userInput = [[NSString alloc] init];
    Dice *dice1 = [[Dice alloc] init];
    Dice *dice2 = [[Dice alloc] init];
    Dice *dice3 = [[Dice alloc] init];
    Dice *dice4 = [[Dice alloc] init];
    Dice *dice5 = [[Dice alloc] init];
    Dice *dice6 = [[Dice alloc] init];
    
    NSMutableArray *diceRolled = [[NSMutableArray alloc] init];
    NSMutableArray *diceHeld = [[NSMutableArray alloc] init];
    
    
    userInput = @"Y";
    
    while ([userInput isEqualToString:@"Y"] || [userInput isEqualToString:@"y"] ){
      //Clear the contents of the diceRolled
      [diceRolled removeAllObjects];
      
      
      [diceRolled addObject:dice1];
      [diceRolled addObject:dice2];
      [diceRolled addObject:dice3];
      [diceRolled addObject:dice4];
      [diceRolled addObject:dice5];
      [diceRolled addObject:dice6];
      
      int tmpCtr = 0;
      for (Dice *die in diceRolled){
        tmpCtr ++;
        [die roll];
        NSLog(@"Dice #%d value: %@", tmpCtr, die.displayValue);
      }
      
      /*
      [dice1 roll];
      [dice2 roll];
      [dice3 roll];
      [dice4 roll];
      [dice5 roll];
      [dice6 roll];
      
      NSLog(@"Dice #1 value: %@", dice1.displayValue);
      NSLog(@"Dice #2 value: %@", dice2.displayValue);
      NSLog(@"Dice #3 value: %@", dice3.displayValue);
      NSLog(@"Dice #4 value: %@", dice4.displayValue);
      NSLog(@"Dice #5 value: %@", dice5.displayValue);
      NSLog(@"Dice #6 value: %@", dice6.displayValue);
       */
      
      userInput = [inputGetter inputForPrompt:@"Do you want to roll again?(Y for yes, N for no)"];
                   
      
      
    }
    

    
  }
    return 0;
}
