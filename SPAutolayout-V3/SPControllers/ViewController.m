//
//  ViewController.m
//  SPAutolayout-V3
//
//  Created by popovychs on 19.10.15.
//  Copyright © 2015 popovychs. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *showLabel;
@property (weak, nonatomic) IBOutlet UIButton *clearButton;
@property (weak, nonatomic) IBOutlet UIButton *loadButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view removeConstraints:self.view.constraints];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-25-[showLabel]-25-|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:@{@"showLabel":_showLabel}]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-30-[showLabel]->=100-|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:@{@"showLabel":_showLabel}]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[clearButton(60)]->=0-[loadButton(60)]-10-|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:@{@"clearButton":_clearButton, @"loadButton":_loadButton}]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|->=0-[clearButton(30)]-10-|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:@{@"clearButton":_clearButton}]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|->=0-[loadButton(30)]-10-|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:@{@"loadButton":_loadButton}]];
}

- (IBAction)loadText:(UIButton *)sender {
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Data" ofType:@"txt"];
    
    NSString *textFromFile = [NSString stringWithContentsOfFile:filePath
                                                       encoding:NSMacOSRomanStringEncoding
                                                          error:nil];
    _showLabel.text = textFromFile;
}

- (IBAction)clearButton:(UIButton *)sender {
    _showLabel.text = @"";
}

@end
