//
//  PrescriptionData.h
//  Patient and Doctor
//
//  Created by Josh Endter on 6/11/15.
//  Copyright (c) 2015 Josh Endter. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Patient;

@interface PrescriptionData : NSObject

@property (strong, nonatomic) NSMutableDictionary *prescriptionHistory;

@end
