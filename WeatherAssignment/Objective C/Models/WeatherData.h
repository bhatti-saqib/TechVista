//
//  WeatherData.h
//  WeatherAssignment
//
//  Created by AppsGenii on 6/26/20.
//  Copyright © 2020 SaqibBhatti. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WeatherData : NSObject

//@property (strong, nonatomic) NSString *name;
//@property (strong, nonatomic) NSString *main;
@property (strong, nonatomic) NSString *desc;
//@property (strong, nonatomic) NSNumber *temp;
//@property (strong, nonatomic) NSNumber *pressure;
//@property (strong, nonatomic) NSNumber *humidity;
@property (strong, nonatomic) NSNumber *temp_min;
@property (strong, nonatomic) NSNumber *temp_max;
@property (strong, nonatomic) NSNumber *wind_speed;
@property (strong, nonatomic) NSString *dt_txt;

@property NSMutableDictionary *weatherDict;
@property NSMutableArray *weatherDataArr;

-(id)initWithJSON:(NSData *)jsonData;
//- (NSString *)tempString;

@end

NS_ASSUME_NONNULL_END
