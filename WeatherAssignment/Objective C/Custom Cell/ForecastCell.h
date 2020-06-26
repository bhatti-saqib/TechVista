//
//  ForecastCell.h
//  WeatherAssignment
//
//  Created by AppsGenii on 6/26/20.
//  Copyright © 2020 SaqibBhatti. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ForecastCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *tempLabel;
@property (nonatomic, weak) IBOutlet UILabel *windLabel;
@property (nonatomic, weak) IBOutlet UILabel *descLabel;

@end

NS_ASSUME_NONNULL_END
