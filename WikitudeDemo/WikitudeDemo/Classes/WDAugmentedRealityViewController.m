//
//  WDAugmentedRealityViewController.m
//  WikitudeDemo
//
//  Created by Vince Liang on 2016-01-18.
//  Copyright © 2016 crowley. All rights reserved.
//

#import "WDAugmentedRealityViewController.h"
#import "WDAugmentedRealityViewController+Plugin.h"

NSString * const WT_LICENSE_CODE = @"GNyIbqHCsfm1/GElB9Cna39EuFJtLkNxyTSEzroYh1poOS2qtwP3oA4IQ8SQ5dNqB1JOv39Kh2wuGCHzN+y39YfL91ogojZ7Oo6q1YQJ4Hfb+tukrd4I+Z4luEFyQz1MECndqoR4vLT+gjOdAFpUXfVJaRUdpFKYcMePQwFtOLxTYWx0ZWRfX6x/YGJn65uvs7BIoTIWfxtstQ2DjwDNYVUY98hFva6CNhximmWRan079ePSKg4JgtBJMvf8aJ3enoNGMuCobbCzL6Do74mXPg4sJmyxGSwQHhlpUoGWMVOHmJG57vrEzpICdTVPulEQ6Hzxrn2UB5lj8m4qciONPOO5DBq68+80LJ15c90udUBFvmS3NvoGJujP9mFB4nMyQrmhKg58U/yVmrEl3t39CooRW4VVijvYf9BiTSAXFVzVwAnNbbl7jGpKQPr9HQLZTxV96KHhUF7G3fAWqtjL4qp3hEiu97n64Tl1y6pAXdJk0cwnwv+ncA1oakRNW5XvmpqL6Rykk+8h56I2S2EdfuxUk/u0hQ6bYW+x8yZF940kmEjRzSArktxAEOo0OL6tsmeHH5VpeHEcF/759gfszcYqn2qe3+belHNN70pTNMFSoYMRqvaJyPcVIzWuNgaRFxcaJgKQxuyNJylmEueI2nvEPf9OeC5FoFJOyxuP5Ic=";

#define kWT_LICENSE_KEY @"tW3Ht861dC8lNC2/xnahrP7DRI7nqfXDGZfUvdeIGJsc64QLICf0leLIO50svo8me8yrGBcglCEHwAQEhqs8eOceTQ0iXJhF6Glf016W/tDsCSXMetFz4vdZIHzOdNOOBJEKuIEPYZgyffutNigYtdWpPzS33L1OQLoVkdQ3z/NTYWx0ZWRfX21xcPVHf8nkO6IcVarrd+BPN3s78E/Ac39sjGX90LKiVK47DeMMovn5X5X3vXIcwrxe3WRZqL6sczpdObKvll+Qwvpbrnej1ausee5uUCCXFC6oevbcnuWyqgYXzctjCjrJlcdfzL1EgPi9W4i87bnT1uf8IYISiPwBlK7vNvLpBIfryzyn9t4EKMGr5X0GTgXA11G5BJW2wkgukMSt7zp8fE1XurT/C97tTtN9P/w5lyWnpjm/1Qt8n409QxB09A9ZW2x9vcOoTzyCKQyTXduWyhW4hv6gXHZUU5A88PJBGtFpX63f40VURgi+6hMNy2Q4I57Ck0d+NTJHQnPbm2NoHKiAkFr5LS2A91lnhF3BI9Qx8YPpjStPNslW93NJPXOstmSFDLep9MpNx+tLzPMRBj5HLjSTPCzWZSQSuXSj31hc/nwoaVl+0MvQzNC1YQdS1QcjeQx5Ln6nFaW+eCmRHOOAZZQJUJeaVvLSMll+zaYwZ+WrIYDCMx/nCwjtQ7Y+Voj2sivGIxPNrcDUuWul6q2D3WJmUwjquibs2M97lLljwojpgLfRf8hWynpvnfliTgk2OZUT96+vcwLW3FHkCLFteuRQ2g=="

@interface WDAugmentedRealityViewController ()

@property (nonatomic, copy) WTNavigation                                    *loadedArchitectWorldNavigation;
@property (nonatomic, weak) WTNavigation                                    *loadingArchitectWorldNavigation;

@end

@implementation WDAugmentedRealityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.architectView setLicenseKey:WT_LICENSE_CODE];
    self.architectView.delegate = self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSURL *absoluteURL = [[NSBundle mainBundle] URLForResource:@"index" withExtension:@"html"];
    self.loadingArchitectWorldNavigation = [self.architectView loadArchitectWorldFromURL:absoluteURL withRequiredFeatures:WTFeature_2DTracking];
    [self startArchitectViewRendering];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self stopArchitectViewRendering];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)startArchitectViewRendering
{
    if ( ![self.architectView isRunning] )
    {
        __weak WDAugmentedRealityViewController *weakSelf = self;
        [self.architectView start:^(WTStartupConfiguration *configuration) {
        } completion:^(BOOL isRunning, NSError *error) {
            [weakSelf registerPlugin];
        }];
    }
}

- (void)stopArchitectViewRendering
{
    if ( [self.architectView isRunning] )
    {
        [self.architectView stop];
    }
}

#pragma mark - Delegate methods
#pragma mark WTArchitectView

/* This architect view delegate method is used to keep the currently loaded architect world url. Every time this view becomes visible again, the controller checks if the current url is not equal to the new one and then loads the architect world */
- (void)architectView:(WTArchitectView *)architectView didFinishLoadArchitectWorldNavigation:(WTNavigation *)navigation
{
    if ( [self.loadingArchitectWorldNavigation isEqual:navigation] )
    {
        self.loadedArchitectWorldNavigation = navigation;
    }
}

- (void)architectView:(WTArchitectView *)architectView didFailToLoadArchitectWorldNavigation:(WTNavigation *)navigation withError:(NSError *)error
{
    NSLog(@"architect view '%@' \ndid fail to load navigation '%@' \nwith error '%@'", architectView, navigation, error);
}

/* As mentioned before, some architect examples require iOS specific implementation details.
 * Here is the decision made which iOS specific details should be executed
 */
- (void)architectView:(WTArchitectView *)architectView invokedURL:(NSURL *)URL
{
    
}

@end
