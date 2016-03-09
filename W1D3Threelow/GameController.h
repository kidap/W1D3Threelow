//
//  GameController.h
//  W1D3Threelow
//
//  Created by Karlo Pagtakhan on 03/09/2016.
//  Copyright © 2016 AccessIT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dice.h"

@interface GameController : NSObject

@property (strong, nonatomic) NSMutableArray *diceRolled;
@property (strong, nonatomic) NSMutableArray *diceHeld;

-(void)holdDie:(NSString *)dieHeld;
-(void)resetDice;
-(void)roll;
-(NSString *)getScore;
-(int)getNumberRollsSinceReset;
-(void)show;
@end
