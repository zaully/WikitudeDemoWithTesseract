//
//  tesseract_plugin.cpp
//  WikitudeDemo
//
//  Created by Vince Liang on 2016-01-19.
//  Copyright © 2016 crowley. All rights reserved.
//

#include "tesseract_plugin.h"

#include <sstream>

#include "TesseractPluginAdaptor.h"
#include "ImageConversion.h"

TesseractPlugin::TesseractPlugin(std::string identifier_, int camera_frame_width, int camera_frame_height) :
wikitude::sdk::Plugin(identifier_) {
    
}


void TesseractPlugin::initialize() {
    
}

void TesseractPlugin::destroy() {
    
}

void TesseractPlugin::cameraFrameAvailable(const wikitude::sdk::Frame& cameraFrame_) {
    auto luminance_data = cameraFrame_.getLuminanceData();
    int width = cameraFrame_.getSize().width;
    int height = cameraFrame_.getSize().height;
    UIImage *image = [ImageConversion convertBitmapRGBA2ToUIImage:luminance_data withWidth:width withHeight:height];
    [adaptor_ frameAvailable:image];
}

void TesseractPlugin::update(const std::list<wikitude::sdk::RecognizedTarget>& recognizedTargets_) {
    
}

void TesseractPlugin::set_adaptor(TesseractPluginAdaptor *adaptor) {
    adaptor_ = adaptor;
}