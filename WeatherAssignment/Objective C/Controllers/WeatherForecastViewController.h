//
//  WeatherForecastViewController.h
//  WeatherAssignment
//
//  Created by AppsGenii on 6/26/20.
//  Copyright © 2020 SaqibBhatti. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WeatherForecastViewController : UIViewController <UITableViewDataSource,
UITableViewDelegate> {
    
    IBOutlet UITableView *myTable;
}

@property NSMutableArray *forecastArray;

@end

NS_ASSUME_NONNULL_END
