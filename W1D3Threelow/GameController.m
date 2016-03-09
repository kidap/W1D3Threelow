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
  //
  if( (diceToBeDeleted.count != 0 && diceToBeDeleted != nil) || firstRoll == YES){
    
    if (numberRollsSinceReset <= 5){
      int tmpCtr = 0;
      numberRollsSinceReset++;
      
      for (Dice *dieToDelete in diceToBeDeleted){
        [self.diceRolled removeObject:dieToDelete];
      }
      
      [diceToBeDeleted removeAllObjects];
      
      for (Dice *die in self.diceRolled){
        tmpCtr ++;
        [die roll];
        NSLog(@"Dice #%d value: %@", tmpCtr, die.displayValue);
      }
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
    
    bool dieNotHeldYet = YES;
    for (Dice *die in self.diceHeld){
      if ([die isEqualTo: [self.diceRolled objectAtIndex: [dieNumber integerValue]]]){
        dieNotHeldYet = NO;
      }
    }
    
    //Check if die is not held yet
    if (dieNotHeldYet){
      
      //Get the dice and save it
      [self.diceHeld addObject: [self.diceRolled objectAtIndex: [dieNumber integerValue] ]];
      NSLog(@"Held %@", [[self.diceRolled objectAtIndex: [dieNumber integerValue]] displayValue ]);
      
      //Remove dice from the rolled later
      [diceToBeDeleted addObject:[self.diceRolled objectAtIndex: [dieNumber integerValue] ]];
    } else{
      NSLog(@"Die already held");
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
    [self.diceRolled addObject:die];
  }
  
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

@end
