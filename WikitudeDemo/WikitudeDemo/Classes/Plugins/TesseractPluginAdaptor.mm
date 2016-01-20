//
//  TesseractPluginAdaptor.m
//  WikitudeDemo
//
//  Created by Vince Liang on 2016-01-19.
//  Copyright © 2016 crowley. All rights reserved.
//

#import "TesseractPluginAdaptor.h"
#import "GPUImage.h"

@implementation TesseractPluginAdaptor
- (void)frameAvailable: (NSData *)data {
}
@end

@interface WDTesseractPluginAdaptorImpl ()
@property (nonatomic, assign) NSInteger looperIndex;
@property (nonatomic, strong) GPUImageAdaptiveThresholdFilter *stillImageFilter;
@end

@implementation WDTesseractPluginAdaptorImpl
- (id)initWithFrameWidth: (NSInteger)width andHeight: (NSInteger)height {
    self = [super init];
    if (self) {
        self.tesseractPlugin = std::make_shared<TesseractPlugin>("TesseractPlugin", width, height);
        self.tesseractPlugin->set_adaptor(self);
        self.stillImageFilter = [[GPUImageAdaptiveThresholdFilter alloc] init];
        self.stillImageFilter.blurRadiusInPixels = 4.0;
        self.tesseract = [[G8Tesseract alloc] initWithLanguage:@"eng"];
        self.tesseract.engineMode = G8OCREngineModeTesseractCubeCombined;
        self.tesseract.maximumRecognitionTime = 2;
        self.tesseract.delegate = self;
        self.looperIndex = 0;
    }
    return self;
}

- (void)frameAvailable: (UIImage *)image {
    if (self.looperIndex == 0) {
        self.tesseract.image = image;
        [self.tesseract recognize];
        NSLog(@"%@", [self.tesseract recognizedText]);
//        NSArray *characterBoxes = [self.tesseract recognizedBlocksByIteratorLevel:G8PageIteratorLevelSymbol];
//        if (characterBoxes) {
//            UIImage *imageWithBlocks = [self.tesseract imageWithBlocks:characterBoxes drawText:YES thresholded:NO];
//            NSArray *paragraphs = [self.tesseract recognizedBlocksByIteratorLevel:G8PageIteratorLevelParagraph];
//        }
    }
    self.looperIndex++;
    if (self.looperIndex > 59) {
        self.looperIndex = 0;
    }
}

- (void)progressImageRecognitionForTesseract:(G8Tesseract *)tesseract {
    /*
     currently there's nothing to be done here.
     */
    if ([tesseract isEqual:self.tesseract]) {
    }
}

- (UIImage *)preprocessedImageForTesseract:(G8Tesseract *)tesseract sourceImage:(UIImage *)sourceImage {
    return [self.stillImageFilter imageByFilteringImage:sourceImage];
}

@end
