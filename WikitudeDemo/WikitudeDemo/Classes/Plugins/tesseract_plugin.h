#pragma once

#import <WikitudeSDK/Plugin.h>
#import <WikitudeSDK/Frame.h>
#import <WikitudeSDK/RecognizedTarget.h>

@class TesseractPluginAdaptor;
class TesseractPlugin : public wikitude::sdk::Plugin {
public:
    TesseractPlugin(std::string identifier_, int camera_frame_width, int camera_frame_height);
    
    virtual ~TesseractPlugin(){}
    
    virtual void initialize() override;
    virtual void destroy() override;
    
    virtual void cameraFrameAvailable(const wikitude::sdk::Frame& cameraFrame_) override;
    virtual void update(const std::list<wikitude::sdk::RecognizedTarget>& recognizedTargets_) override;
    
    virtual void set_adaptor(TesseractPluginAdaptor *adaptor);
private:
    __weak TesseractPluginAdaptor *adaptor_;
};