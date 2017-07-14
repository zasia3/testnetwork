//
//  Flight.m
//  DownloadTest
//
//  Created by MacBook Pro on 11.07.2017.
//  Copyright © 2017 Joanna Zatorska. All rights reserved.
//

#import "Flight.h"

@implementation Flight

- (id)initWith:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        self.airline = dictionary[@"airline"];
        self.arrivalAirport = dictionary[@"arrival_airport"];
        self.arrivalDate = dictionary[@"arrival_date"];
        self.departureAirport = dictionary[@"departure_airport"];
        self.departureDate = dictionary[@"departure_date"];
        self.price = dictionary[@"price"];
    }
    
    return self;
}

@end
