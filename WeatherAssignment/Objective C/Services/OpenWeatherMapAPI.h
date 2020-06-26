//
//  OpenWeatherMapAPI.h
//  WeatherAssignment
//
//  Created by AppsGenii on 6/26/20.
//  Copyright © 2020 SaqibBhatti. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import "WeatherData.h"

NS_ASSUME_NONNULL_BEGIN

@interface OpenWeatherMapAPI : NSObject

+ (OpenWeatherMapAPI *)sharedInstance;

- (void)fetchCurrentWeatherDataForLocation:(NSString *)city completion:(void(^)(WeatherData *weatherData))completion failure:(void(^)(NSError* error))failure;

@end

NS_ASSUME_NONNULL_END
