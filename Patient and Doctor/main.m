//
//  main.m
//  Patient and Doctor
//
//  Created by Josh Endter on 6/11/15.
//  Copyright (c) 2015 Josh Endter. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Doctor.h"
#import "Patient.h"
#import "PrescriptionData.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Doctor *currentDoctor = [[Doctor alloc] init];
        NSMutableArray *patientsForTheDay = [NSMutableArray new];
        PrescriptionData *prescriptionData = [[PrescriptionData alloc] init];
        
        // Make some example patients
        Patient *patient1 = [[Patient alloc] init];
        patient1.hasValidHealthCard = YES;
        patient1.age = @26;
        patient1.name = @"Julie";
        patient1.symptoms = @[@"coughing", @"sneezing"];
        [patientsForTheDay addObject:patient1];
        
        Patient *patient2 = [[Patient alloc] init];
        patient2.hasValidHealthCard = YES;
        patient2.age = @72;
        patient2.name = @"John";
        patient2.symptoms = @[@"allergies"];
        [patientsForTheDay addObject:patient2];
        
        Patient *patient3 = [[Patient alloc] init];
        patient3.hasValidHealthCard = NO;
        patient3.age = @45;
        patient3.name = @"Lauren";
        patient3.symptoms = @[@"tired"];
        [patientsForTheDay addObject:patient3];
        
        Patient *patient4 = [[Patient alloc] init];
        patient4.hasValidHealthCard = YES;
        patient4.age = @50;
        patient4.name = @"Sarah";
        patient4.symptoms = @[@"fever"];
        [patientsForTheDay addObject:patient4];
        
        Patient *patient5 = [[Patient alloc] init];
        patient5.hasValidHealthCard = YES;
        patient5.age = @36;
        patient5.name = @"Timmy";
        patient5.symptoms = nil;
        [patientsForTheDay addObject:patient5];
        
        
        for (int counter = 0; counter < patientsForTheDay.count; counter++) {
            [patientsForTheDay[counter] seeDoctor:currentDoctor];
        }
        
        NSLog(@"\n");
        
        NSLog(@"Number of accepted patients: %lu", currentDoctor.acceptedPatientList.count);
        
        NSLog(@"Final Accepted Patient List:");
        for (int counter = 0; counter < currentDoctor.acceptedPatientList.count; counter++) {
            Patient *acceptedPatient = (Patient *)currentDoctor.acceptedPatientList[counter];
            NSLog(@"%@", acceptedPatient.name);
        }
        
        // Have all the patients for the day (even the ones without health cards) request medication
        for (int counter = 0; counter < patientsForTheDay.count; counter++) {
            Patient *patientRequestingMedication = patientsForTheDay[counter];
            [currentDoctor requestMedication:patientRequestingMedication withPrescriptionDataStore:prescriptionData];
        }
        
        // Print the medications perscribed
        NSLog(@"\n");
        NSLog(@"Dictionary of unique patient id's and their prescriptions:");
        NSLog(@"%@", prescriptionData.prescriptionHistory);
        
        
    }
    return 0;
}
