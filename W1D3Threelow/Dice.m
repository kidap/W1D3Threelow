//
//  Dice.m
//  W1D3Threelow
//
//  Created by Karlo Pagtakhan on 03/09/2016.
//  Copyright © 2016 AccessIT. All rights reserved.
//

#import "Dice.h"

@interface Dice()
-(NSNumber *)randomizeValue;
-(NSString *)getCurrentValue;

@end

@implementation Dice

-(instancetype) init{
  self = [super init];
  
  if (self){
    _currentValue = [[NSNumber alloc] init];
    self.currentValue = [self randomizeValue];
  
  }
  
  return self;
}
-(void) setCurrentValue:(NSNumber *)inputValue{
  _currentValue = inputValue;
  _displayValue = [self getCurrentValue];

}

-(NSNumber *)randomizeValue{
  int randomValue = arc4random_uniform(6);
  
  randomValue ++;
  self.currentValue = [NSNumber numberWithInt:randomValue];
  
  return self.currentValue;
}

-(NSNumber *)roll{
  self.currentValue = [self randomizeValue];
  
  return self.currentValue;
}

-(NSString *) getCurrentValue{

// Use the ffg characters
//  ⚀ ⚁ ⚂ ⚃ ⚄ ⚅
  
  switch (self.currentValue.intValue) {
    case 1:
      return @"⚀";
      break;
    case 2:
      return @"⚁";
      break;
    case 3:
      return @"⚂";
      break;
    case 4:
      return @"⚃";
      break;
    case 5:
      return @"⚄";
      break;
    case 6:
      return @"⚅";
      break;
      
    default:
      break;
  }
  
  return nil;
}


@end
