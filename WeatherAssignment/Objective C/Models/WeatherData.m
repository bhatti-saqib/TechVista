//
//  WeatherData.m
//  WeatherAssignment
//
//  Created by AppsGenii on 6/26/20.
//  Copyright © 2020 SaqibBhatti. All rights reserved.
//

#import "WeatherData.h"

@implementation WeatherData

- (id)initWithJSON:(NSData *)jsonData {
    if (self = [super init]){
        NSError *error;
        id jsonObject = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
        if (error) {
            NSLog(@"NSJSONSerialization failed with error: %@", [error localizedDescription]);
            return self;
        }
        if ([jsonObject isKindOfClass:[NSDictionary class]]) {
            id listArr = [jsonObject objectForKey:@"list"];
            _weatherDataArr = [[NSMutableArray alloc] init];
            
            for( int index = 0; index < [listArr count]; index++) {
                _weatherDict = [[NSMutableDictionary alloc] init];
                if ([listArr isKindOfClass:[NSArray class]]) {
                    id idWeather = [listArr objectAtIndex:index];
                    if ([idWeather isKindOfClass:[NSDictionary class]]) {
                        id idMain = [idWeather objectForKey:@"main"];
                        if ([idMain isKindOfClass:[NSDictionary class]]) {
                            _temp_min = [NSNumber numberWithDouble: [[idMain objectForKey:@"temp_min"] doubleValue]];
                            [_weatherDict setObject: _temp_min forKey: @"temp_min"];
                            
                            _temp_max = [NSNumber numberWithDouble: [[idMain objectForKey:@"temp_max"] doubleValue]];
                            [_weatherDict setObject: _temp_max forKey: @"temp_max"];
                        }
                        
                        id idWeatherArr = [idWeather objectForKey:@"weather"];
                        if ([idWeatherArr isKindOfClass:[NSArray class]]) {
                            id idWeather = [idWeatherArr objectAtIndex:0];
                            if ([idWeather isKindOfClass:[NSDictionary class]]) {
                                _desc = [NSString stringWithFormat: @"%@", [idWeather objectForKey:@"description"]];
                                [_weatherDict setObject: _desc forKey: @"description"];
                            }
                        }
                        
                        id idWind = [idWeather objectForKey:@"wind"];
                        if ([idWind isKindOfClass:[NSDictionary class]]) {
                            _wind_speed = [NSNumber numberWithDouble:[[idWind objectForKey:@"speed"] doubleValue]];
                            [_weatherDict setObject: _wind_speed forKey: @"speed"];
                        }
                        
                        _dt_txt = [idWeather objectForKey:@"dt_txt"];
                        [_weatherDict setObject: _dt_txt forKey: @"date"];
                    }
                }
                [_weatherDataArr addObject:_weatherDict];
            }
            
        } else {
            NSLog(@"Data is not a Dictionary");
        }
    }
    return self;
}

//- (NSString *)tempString {
//    return [NSString stringWithFormat:@"%i°",[self.temp intValue]];
//}

@end
