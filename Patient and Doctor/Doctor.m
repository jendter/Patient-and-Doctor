//
//  Doctor.m
//  Patient and Doctor
//
//  Created by Josh Endter on 6/11/15.
//  Copyright (c) 2015 Josh Endter. All rights reserved.
//

#import "Doctor.h"
#import "Patient.h"
#import "PrescriptionData.h"

@implementation Doctor

- (instancetype)init
{
    self = [super init];
    if (self) {
        _acceptedPatientList = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void) requestMedication:(Patient *)patient withPrescriptionDataStore:(PrescriptionData *)prescriptionData {
    if (patient.hasValidHealthCard == NO) {
        NSLog(@"\n");
        NSLog(@"%@, you don't have a health card. I can't prescribe you anything.", patient.name);
        return;
    }
    
    NSLog(@"\n");
    
    if (patient.symptoms != nil) {
        
        NSMutableArray *medicationsToPerscribe = [NSMutableArray new];
        
        NSLog(@"%@'s Symptoms Are:", patient.name);
        for (int counter = 0; counter < patient.symptoms.count; counter++) {
            NSLog(@"%@", patient.symptoms[counter]);
        }
        
        for (int counter = 0; counter < patient.symptoms.count; counter++) {
            //NSLog(@"%@", patient.symptoms[counter]);
            if ([patient.symptoms[counter] isEqual:@"fever"]) {
                NSString *drugPrescribed = @"Tylenol";
                [medicationsToPerscribe addObject:drugPrescribed];
                [self addPrescription:drugPrescribed ToPatient:patient WithPrescriptionDataStore:prescriptionData];
            } else if ([patient.symptoms[counter] isEqual:@"allergies"]) {
                NSString *drugPrescribed = @"Allegra";
                [medicationsToPerscribe addObject:drugPrescribed];
                [self addPrescription:drugPrescribed ToPatient:patient WithPrescriptionDataStore:prescriptionData];
            }
        }
                
        if (medicationsToPerscribe.count == 0) {
            NSLog(@"Although you have some symptoms, I'm not prescribing anything.");
        } else {
            
            
            // Print the medications perscribed
            for (int counter = 0; counter < medicationsToPerscribe.count; counter++) {
                NSLog(@"Prescribed %@", medicationsToPerscribe[counter]);
            }
        }
        
        
    } else {
        NSLog(@"%@, you're fine! No medication needed.", patient.name);
    }
}

- (void) addPrescription:(NSString *)prescription ToPatient:(Patient *)patient WithPrescriptionDataStore:(PrescriptionData *)prescriptionData {
    NSArray *oldArray = [prescriptionData.prescriptionHistory objectForKey:patient.uniqueID];
    NSMutableArray *newArray = [[NSMutableArray alloc] initWithArray:oldArray];
    [newArray addObject:prescription];
    
    [prescriptionData.prescriptionHistory setObject:newArray forKey:patient.uniqueID];
}

@end
