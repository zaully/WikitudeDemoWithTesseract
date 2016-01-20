//
//  TesseractPluginAdaptor.m
//  WikitudeDemo
//
//  Created by Vince Liang on 2016-01-19.
//  Copyright © 2016 crowley. All rights reserved.
//

#import "TesseractPluginAdaptor.h"

@interface TesseractPluginAdaptor ()
@end

@implementation TesseractPluginAdaptor
- (id)initWithFrameWidth: (NSInteger)width andHeight: (NSInteger)height {
    self = [super init];
    if (self) {
        self.tesseractPlugin = std::make_shared<TesseractPlugin>("TesseractPlugin", width, height);
        self.tesseractPlugin->set_adaptor(self);
    }
    return self;
}
@end
