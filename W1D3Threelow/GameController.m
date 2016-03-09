//
//  GameController.m
//  W1D3Threelow
//
//  Created by Karlo Pagtakhan on 03/09/2016.
//  Copyright © 2016 AccessIT. All rights reserved.
//

#import "GameController.h"

@interface GameController(){
  
  NSMutableArray *diceToBeDeleted;
  int numberRollsSinceReset;
  bool firstRoll;
  
}
@end

@implementation GameController

//Initialization
-(instancetype) init{
  self = [super init];
  
  if (self){
    numberRollsSinceReset = 0;
    firstRoll= YES;
    _diceRolled = [[NSMutableArray alloc] init];
    _diceHeld = [[NSMutableArray alloc] init];
    diceToBeDeleted = [[NSMutableArray alloc] init];
  }
  
  return self;
}

-(void)roll{
  //Check if user held at least 1 die
  if( (diceToBeDeleted.count != 0 && diceToBeDeleted != nil) || firstRoll == YES){
    
    //Limit the user to 5 rolls
    if (numberRollsSinceReset <= 5){
      int tmpCtr = 0;
      numberRollsSinceReset++;
      
      //Clean up
      for (Dice *dieToDelete in diceToBeDeleted){
        [self.diceRolled removeObject:dieToDelete];
      }
      [diceToBeDeleted removeAllObjects];
      
      //Display dice
      [self show];
      
    }else {
      NSLog(@"You can only roll up to 5 time without resetting.");
    }
  }else {
    NSLog(@"You have to hold at least 1 die before you roll again.");
  }
  
  firstRoll = NO;
}
-(void)holdDie:(NSString *)dieHeld{
  
  //Format string to number
  NSNumberFormatter *numFormatter = [[NSNumberFormatter alloc] init];
  numFormatter.numberStyle = NSNumberFormatterDecimalStyle;
  NSNumber *dieNumber = [numFormatter numberFromString:dieHeld];
  
  //Make sure number is within allowed range
  if ([dieNumber intValue] <= self.diceRolled.count && [dieNumber intValue] >= 1){
    dieNumber = [NSNumber numberWithInt:[dieNumber intValue] - 1];
    
    Dice *currentDie = [self.diceRolled objectAtIndex: [dieNumber integerValue]];
    
    //Check if die is not held yet
    if (currentDie.isHeld == NO){
      
      //Set the die as held
      currentDie.isHeld = YES;
      
      //Get the dice and save it
      [self.diceHeld addObject: currentDie];
      NSLog(@"Held %@", currentDie.displayValue);
      
      //Remove dice from the rolled later
      [diceToBeDeleted addObject:currentDie];
    } else{
      currentDie.isHeld = NO;
      NSLog(@"Unhold %@", currentDie.displayValue);
      [diceToBeDeleted removeObject: currentDie];
      [self.diceHeld removeObject: currentDie];
    }
  }
}

-(void)resetDice{
  //Reset counter
  numberRollsSinceReset = 0;
  
  //Remove all objects to be deleted
  for (Dice *dieToDelete in diceToBeDeleted){
    [self.diceRolled removeObject:dieToDelete];
  }
  
  //Add the dice held back to the dice to be rolled
  for (Dice *die in self.diceHeld){
    die.isHeld = NO;
    [self.diceRolled addObject:die];
  }
  
  //Show all dice
  [self show];
  
  //Clear buffers
  [diceToBeDeleted removeAllObjects];
  [self.diceHeld removeAllObjects];
}
-(NSString *)getScore{
  NSString *score = [[NSString alloc] init];
  int totalScore = 0;
  
  //Loop at each die, get the int value and display the die
  for (Dice *die in self.diceHeld){
    score = [score stringByAppendingString:die.displayValue];
    totalScore += [die.currentValue intValue];
  }
  
  score = [score stringByAppendingString:[NSString stringWithFormat:@" = %d",totalScore]];
  
  return score;
}
-(int)getNumberRollsSinceReset{
  return numberRollsSinceReset;
}
-(void)show{
  int tmpCtr = 0;
  for (Dice *die in self.diceRolled){
    tmpCtr ++;
    [die roll];
    NSLog(@"Dice #%d value: %@", tmpCtr, die.displayValue);
  }
}

@end
