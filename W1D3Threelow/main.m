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
    
    GameController *gameManager = [[GameController alloc] init];
    InputCollector *inputGetter = [[InputCollector alloc] init];
    NSString *userInput = [[NSString alloc] init];
    Dice *dice1 = [[Dice alloc] init];
    Dice *dice2 = [[Dice alloc] init];
    Dice *dice3 = [[Dice alloc] init];
    Dice *dice4 = [[Dice alloc] init];
    Dice *dice5 = [[Dice alloc] init];
    
    //Add dice to Game Manager
    [gameManager.diceRolled addObject:dice1];
    [gameManager.diceRolled addObject:dice2];
    [gameManager.diceRolled addObject:dice3];
    [gameManager.diceRolled addObject:dice4];
    [gameManager.diceRolled addObject:dice5];
    
    //Initialize dice values
    [gameManager roll];
    
    //Play game
    userInput = @"Y";
    NSLog(@"Enter the dice you want to hold by typing the dice number, type [reset] to unhold all dice , type [score] to see your score, type [roll] to continue playing");
    while ([gameManager.diceHeld count] != 5){
      NSLog(@"Number of rolls taken since last reset: %d", [gameManager getNumberRollsSinceReset]);
      
      
      userInput = [inputGetter inputForPrompt:@"Enter command: "];
      
      if ([userInput isEqualToString:@"reset"]){
        //Remove all held dice
        [gameManager resetDice];
      }else if ([userInput isEqualToString:@"score"]){
        //Display the score
        NSLog(@"%@",[gameManager getScore]);
      }else if ([userInput isEqualToString:@"roll"]){
        //Roll dice again
        [gameManager roll];
        
        userInput = @"Y";
      } else if ([userInput isNotEqualTo:@""]){
        NSArray *selectedDice = [userInput componentsSeparatedByString:@","];
        for (NSString *dieNumberSelected in selectedDice){
          if (dieNumberSelected){
            [gameManager holdDie:dieNumberSelected];
          }
        }
      }
      
      if ([gameManager.diceHeld count] == 5){
        NSLog(@"Game over.");
        NSLog(@"%@",[gameManager getScore]);
      }
      
    }
    

    
  }
    return 0;
}
