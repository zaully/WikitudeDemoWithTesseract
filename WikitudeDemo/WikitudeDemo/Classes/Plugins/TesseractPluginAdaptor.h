//
//  TesseractPluginAdaptor.h
//  WikitudeDemo
//
//  Created by Vince Liang on 2016-01-19.
//  Copyright © 2016 crowley. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <TesseractOCR/TesseractOCR.h>

#import "tesseract_plugin.h"

@interface TesseractPluginAdaptor: NSObject
- (void)frameAvailable: (UIImage *)image;
@end

@interface WDTesseractPluginAdaptorImpl : TesseractPluginAdaptor <G8TesseractDelegate>

- (id)initWithFrameWidth: (NSInteger)width andHeight: (NSInteger)height;

@property (nonatomic, assign) std::shared_ptr<TesseractPlugin> tesseractPlugin;
@property (nonatomic, strong) G8Tesseract *tesseract;

@end