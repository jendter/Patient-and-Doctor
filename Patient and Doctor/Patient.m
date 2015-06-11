//
//  Patient.m
//  Patient and Doctor
//
//  Created by Josh Endter on 6/11/15.
//  Copyright (c) 2015 Josh Endter. All rights reserved.
//

#import "Patient.h"
#import "Doctor.h"

@implementation Patient

- (instancetype)init
{
    self = [super init];
    if (self) {
        _symptoms = [[NSArray alloc] init];
        _uniqueID = [[NSUUID UUID] UUIDString];
    }
    return self;
}

- (void) seeDoctor:(Doctor *)doctor {
    if (self.hasValidHealthCard == YES) {
        [doctor.acceptedPatientList addObject:self];
        //NSLog(@"Accepted patient: %@", doctor.name);
        NSLog(@"Accepted patient: %@", self.name);
    } else {
        // Doctor cannot accept patient
        NSLog(@"Cannot accept patient: %@", self.name);
    }
}

@end
