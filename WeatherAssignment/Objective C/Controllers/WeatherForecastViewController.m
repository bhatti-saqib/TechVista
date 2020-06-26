//
//  WeatherForecastViewController.m
//  WeatherAssignment
//
//  Created by AppsGenii on 6/26/20.
//  Copyright © 2020 SaqibBhatti. All rights reserved.
//

#import "WeatherForecastViewController.h"
#import "WeatherData.h"
#import "ForecastCell.h"

@interface WeatherForecastViewController ()

@end

@implementation WeatherForecastViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:
(NSInteger)section {
    return [_forecastArray count]/5;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:
(NSIndexPath *)indexPath {
    static NSString *cellId = @"ForecastCell";
    
    ForecastCell *cell = [tableView dequeueReusableCellWithIdentifier:
                             cellId forIndexPath: indexPath];

    WeatherData *data = _forecastArray[indexPath.row];
    NSString *tempMinMax = [[[data valueForKey:@"temp_min"] stringValue] stringByAppendingString: @" - "];
    tempMinMax = [tempMinMax stringByAppendingString: [[data valueForKey:@"temp_max"] stringValue]];
    
    [cell.tempLabel setText: [@"Temperature:     " stringByAppendingString: tempMinMax]];
    [cell.windLabel setText: [@"Wind Speed:     " stringByAppendingString: [[data valueForKey:@"speed"] stringValue]]];
    [cell.descLabel setText: [@"Description:     " stringByAppendingString:[data valueForKey:@"description"]]];
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:
(NSInteger)section {
    NSString *headerTitle;
    if (section == 0) {
        headerTitle = @"Day 1";
    }
    else if(section == 1) {
        headerTitle = @"Day 2";
    }
    else if(section == 2) {
        headerTitle = @"Day 3";
    }
    else if(section == 3) {
        headerTitle = @"Day 4";
    }
    else{
        headerTitle = @"Day 5";
    }
    return headerTitle;
}

@end
