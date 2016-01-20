//
//  WDAugmentedRealityViewController.h
//  WikitudeDemo
//
//  Created by Vince Liang on 2016-01-18.
//  Copyright © 2016 crowley. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <WikitudeSDK/WikitudeSDK.h>

@interface WDAugmentedRealityViewController : UIViewController <WTArchitectViewDelegate>

@property (weak, nonatomic) IBOutlet WTArchitectView *architectView;

@end
