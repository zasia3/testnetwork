//
//  Flight.h
//  DownloadTest
//
//  Created by MacBook Pro on 11.07.2017.
//  Copyright © 2017 Joanna Zatorska. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Flight : NSObject

@property (nonatomic, copy) NSString *airline;
@property (nonatomic, copy) NSDate *departureDate;
@property (nonatomic, copy) NSDate *arrivalDate;
@property (nonatomic, copy) NSNumber *price;
@property (nonatomic, copy) NSString *departureAirport;
@property (nonatomic, copy) NSString *arrivalAirport;

- (id)initWith:(NSDictionary *)dictionary;

@end
