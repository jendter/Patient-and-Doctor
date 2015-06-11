//
//  PrescriptionData.m
//  Patient and Doctor
//
//  Created by Josh Endter on 6/11/15.
//  Copyright (c) 2015 Josh Endter. All rights reserved.
//

#import "PrescriptionData.h"

@implementation PrescriptionData

- (instancetype)init
{
    self = [super init];
    if (self) {
        _prescriptionHistory = [NSMutableDictionary new];
    }
    return self;
}

@end
