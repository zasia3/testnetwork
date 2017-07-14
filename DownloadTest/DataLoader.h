//
//  DataLoader.h
//  DownloadTest
//
//  Created by MacBook Pro on 11.07.2017.
//  Copyright © 2017 Joanna Zatorska. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^CompletionBlock)(NSArray *);

@interface DataLoader : NSObject

-(void) getFlightsWithCompletion:(CompletionBlock)completion;

@end
