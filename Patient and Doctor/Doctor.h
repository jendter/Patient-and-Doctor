//
//  Doctor.h
//  Patient and Doctor
//
//  Created by Josh Endter on 6/11/15.
//  Copyright (c) 2015 Josh Endter. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Patient;
@class PrescriptionData;

@interface Doctor : NSObject

@property (strong, nonatomic) NSMutableArray *acceptedPatientList;

- (void) requestMedication:(Patient *)patient withPrescriptionDataStore:(PrescriptionData *)prescriptionData;
- (void) addPrescription:(NSString *)prescription ToPatient:(Patient *)patient WithPrescriptionDataStore:(PrescriptionData *)prescriptionData;

@end
