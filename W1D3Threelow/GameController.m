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
}
@end

@implementation GameController


-(instancetype) init{
  self = [super init];
  
  if (self){
    _diceRolled = [[NSMutableArray alloc] init];
    _diceHeld = [[NSMutableArray alloc] init];
    diceToBeDeleted = [[NSMutableArray alloc] init];
  }
  
  return self;
}

-(void)roll{
  int tmpCtr = 0;
  
  for (Dice *dieToDelete in diceToBeDeleted){
    [self.diceRolled removeObject:dieToDelete];
  }

  for (Dice *die in self.diceRolled){
    tmpCtr ++;
    [die roll];
    NSLog(@"Dice #%d value: %@", tmpCtr, die.displayValue);
  }
}
-(void)holdDie:(NSString *)dieHeld{
  
  //Format string to number
  NSNumberFormatter *numFormatter = [[NSNumberFormatter alloc] init];
  numFormatter.numberStyle = NSNumberFormatterDecimalStyle;
  NSNumber *dieNumber = [numFormatter numberFromString:dieHeld];
  
  //Make sure number is within allowed range
  if ([dieNumber intValue] <= self.diceRolled.count && [dieNumber intValue] >= 1){
    dieNumber = [NSNumber numberWithInt:[dieNumber intValue] - 1];
  
    //Get the dice and save it
    [self.diceHeld addObject: [self.diceRolled objectAtIndex: [dieNumber integerValue] ]];
    NSLog(@"Held %@", [[self.diceRolled objectAtIndex: [dieNumber integerValue]] displayValue ]);
    
    //Remove dice from the rolled later
    [diceToBeDeleted addObject:[self.diceRolled objectAtIndex: [dieNumber integerValue] ]];
    
  }
  
}

-(void)resetDice{
  //Move all the dice back to the diceRolled
  for (Dice *die in self.diceHeld){
    [self.diceRolled addObject:die];
    [self.diceHeld removeObject:die];
  }
}
-(NSString *)getScore{
  NSString *score = [[NSString alloc] init];
  int totalScore = 0;
  
  for (Dice *die in self.diceHeld){
    score = [score stringByAppendingString:die.displayValue];
    totalScore += [die.currentValue intValue];
  }
  
  score = [score stringByAppendingString:[NSString stringWithFormat:@" = %d",totalScore]];
  
  return score;
}

@end
