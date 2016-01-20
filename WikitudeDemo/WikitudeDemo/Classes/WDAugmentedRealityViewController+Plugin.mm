//
//  WDAugmentedRealityViewController+Plugin.m
//  WikitudeDemo
//
//  Created by Vince Liang on 2016-01-19.
//  Copyright © 2016 crowley. All rights reserved.
//

#import "WDAugmentedRealityViewController+Plugin.h"

#import <memory>
#import <objc/runtime.h>
#import <WikitudeSDK/WTArchitectView+Plugins.h>

#import "TesseractPluginAdaptor.h"

static const char *kWDAugmentedRealityViewController_AssociatedTesseractPluginAdaptorKey = "kWDTesseractPluginAdaptorKey";

@implementation WDAugmentedRealityViewController (Plugin)

- (void)registerPlugin {
    WDTesseractPluginAdaptorImpl *adaptor = [[WDTesseractPluginAdaptorImpl alloc] initWithFrameWidth:50 andHeight:50];
    [self.architectView registerPlugin:adaptor.tesseractPlugin];
    objc_setAssociatedObject(self, kWDAugmentedRealityViewController_AssociatedTesseractPluginAdaptorKey, adaptor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
