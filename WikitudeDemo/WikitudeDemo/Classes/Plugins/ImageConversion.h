//
//  ImageConversion.h
//  WikitudeDemo
//
//  Created by Vince Liang on 2016-01-19.
//  Copyright © 2016 crowley. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageConversion : NSObject

///** Converts a UIImage to RGBA8 bitmap.
// @param image - a UIImage to be converted
// @return a RGBA8 bitmap, or NULL if any memory allocation issues. Cleanup memory with free() when done.
// */
//+ (unsigned char *) convertUIImageToBitmapRGBA8:(UIImage *)image;
//
///** A helper routine used to convert a RGBA8 to UIImage
// @return a new context that is owned by the caller
// */
//+ (CGContextRef) newBitmapRGBA8ContextFromImage:(CGImageRef)image;


/** Converts a RGBA8 bitmap to a UIImage.
 @param buffer - the RGBA8 unsigned char * bitmap
 @param width - the number of pixels wide
 @param height - the number of pixels tall
 @return a UIImage that is autoreleased or nil if memory allocation issues
 */
+ (UIImage *) convertBitmapRGBA2ToUIImage:(const unsigned char *)buffer withWidth:(int)width withHeight:(int)height;

@end
