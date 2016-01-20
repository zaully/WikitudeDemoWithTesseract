//
//  TesseractPluginAdaptor.h
//  WikitudeDemo
//
//  Created by Vince Liang on 2016-01-19.
//  Copyright © 2016 crowley. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "tesseract_plugin.h"

@interface TesseractPluginAdaptor : NSObject

- (id)initWithFrameWidth: (NSInteger)width andHeight: (NSInteger)height;

@property (nonatomic, assign) std::shared_ptr<TesseractPlugin> tesseractPlugin;

@end