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
#import "GameController.h"


int main(int argc, const char * argv[]) {
  @autoreleasepool {
    
    InputCollector *inputGetter = [[InputCollector alloc] init];
    NSString *userInput = [[NSString alloc] init];
    Dice *dice1 = [[Dice alloc] init];
    Dice *dice2 = [[Dice alloc] init];
    Dice *dice3 = [[Dice alloc] init];
    Dice *dice4 = [[Dice alloc] init];
    Dice *dice5 = [[Dice alloc] init];
    
    GameController *gameManager = [[GameController alloc] init];
    
    
    [gameManager.diceRolled addObject:dice1];
    [gameManager.diceRolled addObject:dice2];
    [gameManager.diceRolled addObject:dice3];
    [gameManager.diceRolled addObject:dice4];
    [gameManager.diceRolled addObject:dice5];
    
    userInput = @"Y";
    
    while ([userInput isEqualToString:@"Y"] || [userInput isEqualToString:@"y"] ){
      //Clear the contents of the diceRolled
      //[gameManager.diceRolled removeAllObjects];
      
      int tmpCtr = 0;
      for (Dice *die in gameManager.diceRolled){
        tmpCtr ++;
        [die roll];
        NSLog(@"Dice #%d value: %@", tmpCtr, die.displayValue);
      }
      
      userInput = [inputGetter inputForPrompt:@"Enter the dice you want to hold by enclosing the dice in square brackets and separated each dice number with a comma [1,2,4] or type 'reset' to unhold all dice"];
      
      if ([userInput isEqualToString:@"reset"]){
        [gameManager resetDice];
      } else {
        NSArray *selectedDice = [userInput componentsSeparatedByString:@","];
        for (NSString *dieNumberSelected in selectedDice){
          if (dieNumberSelected){
            [gameManager holdDie:dieNumberSelected];
          }
        }
      }

      

      userInput = [inputGetter inputForPrompt:@"Do you want to roll again?(Y for yes, N for no)"];
                   
      
      
    }
    

    
  }
    return 0;
}
