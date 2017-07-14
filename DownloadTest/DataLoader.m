//
//  DataLoader.m
//  DownloadTest
//
//  Created by MacBook Pro on 11.07.2017.
//  Copyright © 2017 Joanna Zatorska. All rights reserved.
//

#import "DataLoader.h"
#import "AFNetworking.h"
#import <RestKit/RestKit.h>
#import "Flight.h"



@implementation DataLoader


-(void) getFlightsWithCompletion:(CompletionBlock)completion {
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    ((AFJSONResponseSerializer *)manager.responseSerializer).acceptableContentTypes = [NSSet setWithObjects:@"text/plain",nil];
    
    NSURL *baseURL = [NSURL URLWithString:@"http://pastebin.com/raw/bFnZQEx0"];
//    AFRKHTTPClient* client = [[AFRKHTTPClient alloc] initWithBaseURL:baseURL];
//    [client setDefaultHeader:@"Accept" value: @"text/plain"];
    NSURLRequest *request = [NSURLRequest requestWithURL:baseURL];
//
////    RKObjectManager *objectManager = [[RKObjectManager alloc] initWithHTTPClient:client];
//    RKObjectManager *objectManager = [RKObjectManager managerWithBaseURL:baseURL];
//    [objectManager setAcceptHeaderWithMIMEType:@"text/plain"];
//    // Setup our object mappings
//    RKObjectMapping *flightMapping = [RKObjectMapping mappingForClass:[Flight class]];
//    [flightMapping addAttributeMappingsFromDictionary:@{
//                                                      @"airline" : @"airline",
//                                                      @"departure_date" : @"departureDate",
//                                                      @"arrival_date" : @"arrivalDate",
//                                                      @"price" : @"price",
//                                                      @"departure_airport" : @"departureAirport",
//                                                      @"arrival_airport" : @"arrivalAirport"
//                                                      }];
//    
//    [objectManager getObjectsAtPath:@"/raw/bFnZQEx0"
//                         parameters:nil
//                            success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
//                                NSArray* flights = [mappingResult array];
//                                NSLog(@"Loaded flights: %@", flights);
//                            }
//                            failure:^(RKObjectRequestOperation *operation, NSError *error) {
//
//                                NSLog(@"Hit error: %@", error);
//                            }];
//    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {
            NSLog(@"Error: %@", error);
        } else {
            NSLog(@"%@ %@", response, responseObject);
            NSDictionary * data = (NSDictionary *)responseObject;
            NSArray * flightsArray = data[@"flights"];
            NSMutableArray * flights = [[NSMutableArray alloc] init];
            for (NSDictionary * dict in flightsArray) {
                Flight * flight = [[Flight alloc] initWith:dict];
                [flights addObject:flight];
            }
            completion(flights);
        }
    }];
    [dataTask resume];
}

@end
