//
//  ViewController.m
//  WeatherAssignment
//
//  Created by AppsGenii on 6/26/20.
//  Copyright © 2020 SaqibBhatti. All rights reserved.
//

#import "ViewController.h"
#import "OpenWeatherMapAPI.h"
#import "WeatherForecastViewController.h"
@import JGProgressHUD;

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.locationManager = [[CLLocationManager alloc] init];
    [[self locationManager] setDelegate:self];
    
    if ([[self locationManager] respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [[self locationManager] requestWhenInUseAuthorization];
    }
    
    [[self locationManager] setDesiredAccuracy:kCLLocationAccuracyBest];
    [[self locationManager] startUpdatingLocation];

}

-(void) locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    
    CLLocation *location = locations.lastObject;
    
    NSLog(@"%f", location.coordinate.latitude);
    NSLog(@"%f", location.coordinate.longitude);
    
    CLGeocoder *geocoder = [[CLGeocoder alloc] init] ;
    [geocoder reverseGeocodeLocation: location
                   completionHandler:^(NSArray *placemarks, NSError *error)
    {
        if (error) {
            NSLog(@"Geocode failed with error: %@", error);
            return;
        }
        CLPlacemark *placemark = [placemarks objectAtIndex:0];
        NSLog(@"placemark.ISOcountryCode %@",placemark.ISOcountryCode);
        NSLog(@"locality %@",placemark.locality);
        NSLog(@"postalCode %@",placemark.postalCode);

        self.cityNameLabel.text = placemark.locality;
    }];
    
    [self.locationManager stopUpdatingLocation];
    self.locationManager = nil;
}

- (IBAction)getWeatherData:(UIButton *)sender {
    
    JGProgressHUD *HUD = [JGProgressHUD progressHUDWithStyle:JGProgressHUDStyleDark];
    HUD.textLabel.text = @"Loading";
    [HUD showInView:self.view];
    [HUD dismissAfterDelay:3.0];
    
    [[OpenWeatherMapAPI sharedInstance]
        fetchCurrentWeatherDataForLocation:self.cityNameLabel.text
                                completion:^(WeatherData *weatherData) {
                                    
                                    //NSString *tempString = [weatherData tempString];
        //[self.weatherForecast addObject:weatherData];
        NSLog(@"Array size: %lu", (unsigned long)[weatherData.weatherDataArr count]);
        
        dispatch_async(dispatch_get_main_queue(), ^{
            UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                WeatherForecastViewController* controller = [storyboard instantiateViewControllerWithIdentifier:@"WFViewController"];
            controller.forecastArray = weatherData.weatherDataArr;
            [self.navigationController pushViewController:controller animated:YES];
            
        });
    }
     failure:^(NSError *error) {
        NSLog(@"Failed: %@",error);
    }
    ];
}

@end
