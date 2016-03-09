//
//  Dice.h
//  W1D3Threelow
//
//  Created by Karlo Pagtakhan on 03/09/2016.
//  Copyright © 2016 AccessIT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Dice : NSObject

@property(nonatomic) NSNumber *currentValue;
@property(nonatomic) NSString *displayValue;
@property(nonatomic) BOOL held;

-(NSNumber *)roll;

@end
