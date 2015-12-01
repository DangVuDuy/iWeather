//
//  ViewController.m
//  iWeather
//
//  Created by Dang Vu Duy on 11/30/15.
//  Copyright © 2015 Dang Vu Duy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *location;
@property (weak, nonatomic) IBOutlet UIButton *temperature;
@property (weak, nonatomic) IBOutlet UIImageView *weatherIcon;
@property (weak, nonatomic) IBOutlet UILabel *quote;
@property (weak, nonatomic) IBOutlet UILabel *unit;

@end

@implementation ViewController
{
    NSArray* quotes;
    NSArray* locations;
    NSArray* photoFile;
    float X;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    quotes = @[@"Mò kim đáy bể",@"Có công mài sắt có ngày nên kim",@"Một cây làm chăng nên non bà cậy chụm lại nên hòn núi cao",@"Bầu ơi thương lây bí cùng tuy răng khác giống nhưng chung một giàn",@"Một con ngựa đau cả tàu bỏ cỏ",@"Đi một ngày đàng học một sàng khôn"];
    locations = @[@"Hai Bà Trưng, Hà Nội",@"Mỹ Đình, Hà Nội",@"Đông Anh, Hà Nội",@"Sydney, Australia",@"New York, USA"];
    photoFile = @[@"rain",@"sunny",@"thunder",@"windy"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)convertFarenheight:(id)sender {
    NSString* string = [NSString stringWithFormat:@"%2.1f", [self getconvertFarenheight]];
    [self.temperature setTitle:string forState:UIControlStateNormal];
    self.unit.text = @"F";
    
    
}
- (IBAction)updateweather:(id)sender {
    int quoteIndex = arc4random_uniform(quotes.count);
    NSLog(@"%d",quoteIndex);
    self.quote.text = quotes[quoteIndex];
    
    int locationIndext = arc4random_uniform(locations.count);
    self.location.text = locations[locationIndext];
    
    int photoFileIndext = arc4random_uniform(photoFile.count);
    self.weatherIcon.image = [UIImage imageNamed:photoFile[photoFileIndext]];
    
    NSString* string = [NSString stringWithFormat:@"%2.1f", [self getTemperature]];
    [self.temperature setTitle:string forState:UIControlStateNormal];
    self.unit.text = @"C";

}
- (float) getTemperature {
     X = 14.0 + arc4random_uniform(19) + (float)arc4random() /(float) INT32_MAX;
    return X;
}
- (float) getconvertFarenheight {
    return (X * 1.8) + 32;
}

@end
