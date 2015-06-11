//
//  Patient.h
//  Patient and Doctor
//
//  Created by Josh Endter on 6/11/15.
//  Copyright (c) 2015 Josh Endter. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Doctor;

@interface Patient : NSObject

@property (nonatomic) BOOL hasValidHealthCard;
@property (strong, nonatomic) NSNumber *age;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSArray *symptoms;
@property (strong, nonatomic) NSString *uniqueID;

- (void) seeDoctor:(Doctor *)doctor;

@end
