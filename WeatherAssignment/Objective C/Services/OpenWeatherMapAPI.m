//
//  OpenWeatherMapAPI.m
//  WeatherAssignment
//
//  Created by AppsGenii on 6/26/20.
//  Copyright © 2020 SaqibBhatti. All rights reserved.
//

#import "OpenWeatherMapAPI.h"
#import "Keys.h"

@implementation OpenWeatherMapAPI

+ (OpenWeatherMapAPI *)sharedInstance {
    static OpenWeatherMapAPI *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[OpenWeatherMapAPI alloc] init];
    });
    return sharedInstance;
}

- (void)fetchCurrentWeatherDataForLocation:(NSString *)city completion:(void(^)(WeatherData *weatherData))completion failure:(void(^)(NSError* error))failure{
    
    NSString *urlString = [NSString stringWithFormat:@"https://api.openweathermap.org/data/2.5/forecast?q=%@&appid=%@",city,kOpenWeatherMapAPIKey];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURL *url = [NSURL URLWithString:urlString];
    
    [[session dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error){
        if(error) {
            failure(error);
        } else {
            WeatherData *weather = [[WeatherData alloc] initWithJSON:data];
            completion(weather);
        }
        
    }] resume];
}

@end
