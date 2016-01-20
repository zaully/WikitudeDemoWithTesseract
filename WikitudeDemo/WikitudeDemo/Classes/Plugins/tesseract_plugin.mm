//
//  tesseract_plugin.cpp
//  WikitudeDemo
//
//  Created by Vince Liang on 2016-01-19.
//  Copyright © 2016 crowley. All rights reserved.
//

#include "tesseract_plugin.h"
#include <sstream>

TesseractPlugin::TesseractPlugin(std::string identifier_, int camera_frame_width, int camera_frame_height) :
wikitude::sdk::Plugin(identifier_) {
    
}


void TesseractPlugin::initialize() {
    
}

void TesseractPlugin::destroy() {
    
}

void TesseractPlugin::cameraFrameAvailable(const wikitude::sdk::Frame& cameraFrame_) {
}

void TesseractPlugin::update(const std::list<wikitude::sdk::RecognizedTarget>& recognizedTargets_) {
    
}

void TesseractPlugin::set_adaptor(TesseractPluginAdaptor *adaptor) {
    
}