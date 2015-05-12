//
//  UIViewControllerAdditions.m
//  ColorRecall
//
//  Created by xuanqiang on 12-11-8.
//  Copyright (c) 2012年 Ecpalm. All rights reserved.
//

#import "UIViewControllerAdditions.h"
#import <QuartzCore/QuartzCore.h>
#import <CoreImage/CoreImage.h>
#import <Accelerate/Accelerate.h>
#import "Config.h"
@implementation UIViewController(UIViewControllerAdditions)
- (UIImageView*)addTopImageView
{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 12)];
    imageView.image =[UIImage imageNamed:@"huabian.png"];
    [self.navigationController.navigationBar.layer setMasksToBounds:YES];
    [self.view addSubview:imageView];
    return imageView;
    
}
+ (UIViewController *)stroryboardName:(NSString *)name
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:name bundle:nil];
    return [storyboard instantiateInitialViewController];
}
-(void)setBarTintBlue{
    if (IOS7) {
        [self setBarTintColor:[UIColor blueColor]];
    }else{
        [self setBarBackgroundImage:@"TopBlueBar.png"];
    }
}
-(void)setBarTintRed{
    if (IOS7) {
        [self setBarTintColor:[UIColor blueColor]];
    }else{
        [self setBarBackgroundImage:@"TopRedBar.png"];
    }
}
-(void)setBarTintBlueOrRed{
    if (IOS7) {
        [self setBarTintColor:[UIColor blueColor]];
    }else{
        [self setBarBackgroundImage:@"TopRedBar.png"];
    }
}
-(void)setBarTintColor:(UIColor *)color{
    if (IOS7) {
        [self.navigationController.navigationBar setBarTintColor:color];
    } else {
        [self.navigationController.navigationBar setTintColor:color];
    }
}

- (void)setBarBackgroundImage:(NSString *)imageName{
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:imageName] forBarMetrics:UIBarMetricsDefault];
}

- (void)setTitleForNavigation:(NSString *)title {
  UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
  titleLabel.backgroundColor = [UIColor clearColor];
  titleLabel.textAlignment = NSTextAlignmentCenter;
  titleLabel.textColor = [UIColor whiteColor];
  titleLabel.font = [UIFont boldSystemFontOfSize:20];
  titleLabel.text = title;
  [titleLabel sizeToFit];
  self.navigationItem.titleView = titleLabel;
}
- (UIBarButtonItem *)leftUIBarButtonItem:(NSString *)imageName selector:(SEL)sel{
    UIImage *img = [UIImage imageNamed:imageName];
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    button.showsTouchWhenHighlighted=YES;
    [button setImage:img forState:UIControlStateNormal];
    button.imageEdgeInsets = UIEdgeInsetsMake((44-img.size.height)/2, 0, (44-img.size.height)/2, 44-img.size.width);// UIEdgeInsetsMake(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right)
    if(sel){
        [button addTarget:self action:sel forControlEvents:UIControlEventTouchUpInside];
    }
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}
- (UIBarButtonItem *)rightUIBarButtonItem:(NSString *)imageName selector:(SEL)sel{
    UIImage *img = [UIImage imageNamed:imageName];
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    button.showsTouchWhenHighlighted=YES;
    [button setImage:img forState:UIControlStateNormal];
    button.imageEdgeInsets = UIEdgeInsetsMake((44-img.size.height)/2, 44-img.size.width, (44-img.size.height)/2, 0);// UIEdgeInsetsMake((44-img.size.height)/2, 0, 0, 0);
    if(sel){
        [button addTarget:self action:sel forControlEvents:UIControlEventTouchUpInside];
    }
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

- (void)setLeftButtonForNavigation:(NSString *)imageName selector:(SEL)sel{
    if (!imageName) {
        imageName = @"BackBtn.png";
    }
    if(!sel){
        sel = @selector(backActionForNavigation:);
    }
    self.navigationItem.leftBarButtonItem = [self leftUIBarButtonItem:imageName selector:sel];
}
- (void)setRightButtonForNavigation:(NSString *)imageName selector:(SEL)sel{
    if (!imageName) {
        imageName = @"ConfirmBtn.png";
    }
    if (!sel) {
        sel = @selector(backActionForNavigation:);
    }
    self.navigationItem.rightBarButtonItem = [self rightUIBarButtonItem:imageName selector:sel];
}
- (void)setLeftBackButtonForNavigation{
    self.navigationItem.leftBarButtonItem = [self leftUIBarButtonItem:@"BackBtn.png" selector:@selector(backActionForNavigation:)];
}
- (void)backActionForNavigation:(id)sender {
    @synchronized(self)
    {
        [self.navigationController popViewControllerAnimated:YES];

    }
}

@end


@implementation NSString(Emoji)
+(BOOL)isContainsEmoji:(NSString *)string {
    __block BOOL isEomji = NO;
    [string enumerateSubstringsInRange:NSMakeRange(0, [string length]) options:NSStringEnumerationByComposedCharacterSequences usingBlock:
     
     ^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
         
         
         
         const unichar hs = [substring characterAtIndex:0];
         
         // surrogate pair
         
         if (0xd800 <= hs && hs <= 0xdbff) {
             
             if (substring.length > 1) {
                 
                 const unichar ls = [substring characterAtIndex:1];
                 
                 const int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
                 
                 if (0x1d000 <= uc && uc <= 0x1f77f) {
                     
                     isEomji = YES;
                     
                 }
                 
             }
             
         } else if (substring.length > 1) {
             
             const unichar ls = [substring characterAtIndex:1];
             
             if (ls == 0x20e3) {
                 
                 isEomji = YES;
                 
             }
             
             
             
         } else {
             
             // non surrogate
             
             if (0x2100 <= hs && hs <= 0x27ff && hs != 0x263b) {
                 
                 isEomji = YES;
                 
             } else if (0x2B05 <= hs && hs <= 0x2b07) {
                 
                 isEomji = YES;
                 
             } else if (0x2934 <= hs && hs <= 0x2935) {
                 
                 isEomji = YES;
                 
             } else if (0x3297 <= hs && hs <= 0x3299) {
                 
                 isEomji = YES;
                 
             } else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50|| hs == 0x231a ) {
                 
                 isEomji = YES;
                 
             }
             
         }
         
     }];
    
    
    
    return isEomji;
    
}
+(NSString *)intDateToStrFromNSTimeInterval:(NSString *)dateStr{
    NSTimeInterval newDateStr = [[NSDate date] timeIntervalSince1970];
    NSInteger seconds = newDateStr - [dateStr integerValue];
    NSInteger minute = seconds/60;
    if (minute<1) {
        return @"刚刚";
    } else {
        if (minute<60) {
            return [NSString stringWithFormat:@"%ld分钟前",(long)minute];
        } else {
            NSInteger hour = minute/60;
            if (hour<24) {
                return [NSString stringWithFormat:@"%ld小时前",(long)hour];
            } else {
                NSDateFormatter *dateFormatter=[[NSDateFormatter alloc]init];
                [dateFormatter setDateFormat:@"yyyy-MM-dd"];
                NSDate *date=[NSDate dateWithTimeIntervalSince1970:[dateStr doubleValue]];
                return [dateFormatter stringFromDate:date];
            }
        }
    }
}
///时间转时间字符串
+(NSString *)dateToDateStr:(NSString *)dateFormatterStr Date:(NSDate *)date{
    static NSDateFormatter *dateFormatter;
    if (dateFormatter == nil) {
        dateFormatter = [[NSDateFormatter alloc]init];
        dateFormatter.dateFormat = dateFormatterStr;
    }
    NSString *dateStr = [dateFormatter stringFromDate:date];
    return dateStr;
}
///时间字符串转时间
+(NSDate *)dateStrToDate:(NSString *)dateFormatterStr DateStr:(NSString *)dateStr{
    static NSDateFormatter *dateFormatter;
    if (dateFormatter == nil) {
        dateFormatter = [[NSDateFormatter alloc]init];
        dateFormatter.dateFormat = dateFormatterStr;
    }
    NSDate *date = [dateFormatter dateFromString:dateStr];
    return date;
}
///获取当前时间戳
+ (NSTimeInterval)currentTime
{
    NSDate *date = [NSDate date];
    NSTimeInterval aInterval =[date timeIntervalSince1970];
    return aInterval;
}
///根据时间获取时间戳
+ (NSTimeInterval)dateToTimeInterval:(NSDate *)date
{
    NSTimeInterval aInterval =[date timeIntervalSince1970];
    return aInterval;
}
///时间戳转时间字符串
+(NSString *)dateTimeIntervalToDateStr:(NSString *)dateFormatterStr TimeInterval:(NSString *)timeInterval{
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[timeInterval doubleValue]];
    static NSDateFormatter *dateFormatter;
    if (dateFormatter == nil) {
        dateFormatter = [[NSDateFormatter alloc]init];
        dateFormatter.dateFormat = dateFormatterStr;
    }
    NSString *dateStr = [dateFormatter stringFromDate:date];
    return dateStr;
}
///时间字符串转时间戳
+(NSTimeInterval)dateStrToDateTimeInterval:(NSString *)dateFormatterStr DateStr:(NSString *)dateStr{
    static NSDateFormatter *dateFormatter;
    if (dateFormatter == nil) {
        dateFormatter = [[NSDateFormatter alloc]init];
        dateFormatter.dateFormat = dateFormatterStr;
    }
    NSDate *date = [dateFormatter dateFromString:dateStr];
    NSTimeInterval aInterval =[date timeIntervalSince1970];
    return aInterval;
}
@end
//@interface UIImageView()
//{
//    UIView *loadSuperView;
//}
//@end
@implementation UIImageView(AnimationImageView)

//给imageView添加放大全屏点击事件
-(void)addImageFullViewAnimation{
    return;
//    self.userInteractionEnabled = YES;
//    UITapGestureRecognizer *tapp = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(imageAnimation:)];
//    [self addGestureRecognizer:tapp];
}
//虚化图片
-(UIImage *)blurImage:(UIImage *)image{
    UIImage *images = [image re_applyBlurWithRadius:10 tintColor:[UIColor colorWithWhite:1 alpha:0.25f] saturationDeltaFactor:1.8 maskImage:nil];
//    NSLog(@"ss");
    return images;
}

-(void)imageAnimation:(UIGestureRecognizer *)tap
{
    AppDelegate * appl =( AppDelegate *)[UIApplication sharedApplication].delegate;
    UIImage *bgimage = [self blurImage:[appl.window re_screenshot]];
//    UIImageView *imageBGView = [[UIImageView alloc]initWithImage:[self blurImage:[appl.window re_screenshot]]];
//    imageBGView.frame =[appl.window convertRect:self.frame toView:appl.window];
    UIImageView *imageBGView = [[UIImageView alloc]initWithFrame:[self.superview convertRect:self.frame toView:appl.window]];
//    imageBGView.image = [self blurImage:[appl.window re_screenshot]];
    imageBGView.userInteractionEnabled = YES;
    [appl.window addSubview:imageBGView];
    UIImageView *imageView = [[UIImageView alloc]initWithImage:self.image];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.userInteractionEnabled = YES;
    imageView.frame =imageBGView.bounds;
    [imageBGView addSubview:imageView];
    
    [UIView animateWithDuration:0.8f animations:^{
        imageBGView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
//        imageBGView.image = ngimage;
//        imageBGView.image = [self blurImage:[appl.window re_screenshotFrame:imageBGView.frame]];
        imageView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    } completion:^(BOOL finished) {
        [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationNone];
        imageBGView.image = bgimage;
        UITapGestureRecognizer *tapp = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hidenBigImage:)];
        [imageView addGestureRecognizer:tapp];
    }];
    
}
-(void)hidenBigImage:(UIGestureRecognizer *)tap{
    UIImageView *imageView = (UIImageView *)tap.view;
    UIImageView *imageBGView = (UIImageView *)imageView.superview;
    imageBGView.image = nil;
    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationNone];
    [UIView animateWithDuration:.8f animations:^{
        AppDelegate * appl =( AppDelegate *)[UIApplication sharedApplication].delegate;
        imageBGView.frame = [self.superview convertRect:self.frame toView:appl.window];
        imageView.frame = imageBGView.bounds;
    } completion:^(BOOL finished) {
        [imageBGView removeFromSuperview];
        [imageView removeFromSuperview];
    }];
    
}
@end

@implementation UIImage (REFrostedViewController)

- (UIImage *)re_applyBlurWithRadius:(CGFloat)blurRadius tintColor:(UIColor *)tintColor saturationDeltaFactor:(CGFloat)saturationDeltaFactor maskImage:(UIImage *)maskImage
{
    // Check pre-conditions.
    if (self.size.width < 1 || self.size.height < 1) {
        NSLog (@"*** error: invalid size: (%.2f x %.2f). Both dimensions must be >= 1: %@", self.size.width, self.size.height, self);
        return nil;
    }
    if (!self.CGImage) {
        NSLog (@"*** error: image must be backed by a CGImage: %@", self);
        return nil;
    }
    if (maskImage && !maskImage.CGImage) {
        NSLog (@"*** error: maskImage must be backed by a CGImage: %@", maskImage);
        return nil;
    }
    
    CGRect imageRect = { CGPointZero, self.size };
    UIImage *effectImage = self;
    
    BOOL hasBlur = blurRadius > __FLT_EPSILON__;
    BOOL hasSaturationChange = fabs(saturationDeltaFactor - 1.) > __FLT_EPSILON__;
    if (hasBlur || hasSaturationChange) {
        UIGraphicsBeginImageContextWithOptions(self.size, NO, [[UIScreen mainScreen] scale]);
        CGContextRef effectInContext = UIGraphicsGetCurrentContext();
        CGContextScaleCTM(effectInContext, 1.0, -1.0);
        CGContextTranslateCTM(effectInContext, 0, -self.size.height);
        CGContextDrawImage(effectInContext, imageRect, self.CGImage);
        
        vImage_Buffer effectInBuffer;
        effectInBuffer.data     = CGBitmapContextGetData(effectInContext);
        effectInBuffer.width    = CGBitmapContextGetWidth(effectInContext);
        effectInBuffer.height   = CGBitmapContextGetHeight(effectInContext);
        effectInBuffer.rowBytes = CGBitmapContextGetBytesPerRow(effectInContext);
        
        UIGraphicsBeginImageContextWithOptions(self.size, NO, [[UIScreen mainScreen] scale]);
        CGContextRef effectOutContext = UIGraphicsGetCurrentContext();
        vImage_Buffer effectOutBuffer;
        effectOutBuffer.data     = CGBitmapContextGetData(effectOutContext);
        effectOutBuffer.width    = CGBitmapContextGetWidth(effectOutContext);
        effectOutBuffer.height   = CGBitmapContextGetHeight(effectOutContext);
        effectOutBuffer.rowBytes = CGBitmapContextGetBytesPerRow(effectOutContext);
        
        if (hasBlur) {
            // A description of how to compute the box kernel width from the Gaussian
            // radius (aka standard deviation) appears in the SVG spec:
            // http://www.w3.org/TR/SVG/filters.html#feGaussianBlurElement
            //
            // For larger values of 's' (s >= 2.0), an approximation can be used: Three
            // successive box-blurs build a piece-wise quadratic convolution kernel, which
            // approximates the Gaussian kernel to within roughly 3%.
            //
            // let d = floor(s * 3*sqrt(2*pi)/4 + 0.5)
            //
            // ... if d is odd, use three box-blurs of size 'd', centered on the output pixel.
            //
            CGFloat inputRadius = blurRadius * [[UIScreen mainScreen] scale];
            uint32_t radius = floor(inputRadius * 3. * sqrt(2 * M_PI) / 4 + 0.5);
            if (radius % 2 != 1) {
                radius += 1; // force radius to be odd so that the three box-blur methodology works.
            }
            vImageBoxConvolve_ARGB8888(&effectInBuffer, &effectOutBuffer, NULL, 0, 0, radius, radius, 0, kvImageEdgeExtend);
            vImageBoxConvolve_ARGB8888(&effectOutBuffer, &effectInBuffer, NULL, 0, 0, radius, radius, 0, kvImageEdgeExtend);
            vImageBoxConvolve_ARGB8888(&effectInBuffer, &effectOutBuffer, NULL, 0, 0, radius, radius, 0, kvImageEdgeExtend);
        }
        BOOL effectImageBuffersAreSwapped = NO;
        if (hasSaturationChange) {
            CGFloat s = saturationDeltaFactor;
            CGFloat floatingPointSaturationMatrix[] = {
                0.0722 + 0.9278 * s,  0.0722 - 0.0722 * s,  0.0722 - 0.0722 * s,  0,
                0.7152 - 0.7152 * s,  0.7152 + 0.2848 * s,  0.7152 - 0.7152 * s,  0,
                0.2126 - 0.2126 * s,  0.2126 - 0.2126 * s,  0.2126 + 0.7873 * s,  0,
                0,                    0,                    0,  1,
            };
            const int32_t divisor = 256;
            NSUInteger matrixSize = sizeof(floatingPointSaturationMatrix)/sizeof(floatingPointSaturationMatrix[0]);
            int16_t saturationMatrix[matrixSize];
            for (NSUInteger i = 0; i < matrixSize; ++i) {
                saturationMatrix[i] = (int16_t)roundf(floatingPointSaturationMatrix[i] * divisor);
            }
            if (hasBlur) {
                vImageMatrixMultiply_ARGB8888(&effectOutBuffer, &effectInBuffer, saturationMatrix, divisor, NULL, NULL, kvImageNoFlags);
                effectImageBuffersAreSwapped = YES;
            }
            else {
                vImageMatrixMultiply_ARGB8888(&effectInBuffer, &effectOutBuffer, saturationMatrix, divisor, NULL, NULL, kvImageNoFlags);
            }
        }
        if (!effectImageBuffersAreSwapped)
            effectImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        if (effectImageBuffersAreSwapped)
            effectImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }
    
    // Set up output context.
    UIGraphicsBeginImageContextWithOptions(self.size, NO, [[UIScreen mainScreen] scale]);
    CGContextRef outputContext = UIGraphicsGetCurrentContext();
    CGContextScaleCTM(outputContext, 1.0, -1.0);
    CGContextTranslateCTM(outputContext, 0, -self.size.height);
    
    // Draw base image.
    CGContextDrawImage(outputContext, imageRect, self.CGImage);
    
    // Draw effect image.
    if (hasBlur) {
        CGContextSaveGState(outputContext);
        if (maskImage) {
            CGContextClipToMask(outputContext, imageRect, maskImage.CGImage);
        }
        CGContextDrawImage(outputContext, imageRect, effectImage.CGImage);
        CGContextRestoreGState(outputContext);
    }
    
    // Add in color tint.
    if (tintColor) {
        CGContextSaveGState(outputContext);
        CGContextSetFillColorWithColor(outputContext, tintColor.CGColor);
        CGContextFillRect(outputContext, imageRect);
        CGContextRestoreGState(outputContext);
    }
    
    // Output image is ready.
    UIImage *outputImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return outputImage;
}

@end
@implementation UIView (REFrostedViewController)

- (UIImage *)re_screenshot
{
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, [UIScreen mainScreen].scale);
    
    if ([self respondsToSelector:@selector(drawViewHierarchyInRect:afterScreenUpdates:)]) {
        
        NSInvocation* invoc = [NSInvocation invocationWithMethodSignature:
                               [self methodSignatureForSelector:
                                @selector(drawViewHierarchyInRect:afterScreenUpdates:)]];
        [invoc setTarget:self];
        [invoc setSelector:@selector(drawViewHierarchyInRect:afterScreenUpdates:)];
        CGRect arg2 = self.bounds;
        BOOL arg3 = YES;
        [invoc setArgument:&arg2 atIndex:2];
        [invoc setArgument:&arg3 atIndex:3];
        [invoc invoke];
    } else {
        [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    }
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
- (UIImage *)re_screenshotFrame:(CGRect)frame
{
    UIGraphicsBeginImageContextWithOptions(frame.size, NO, [UIScreen mainScreen].scale);
    
    if ([self respondsToSelector:@selector(drawViewHierarchyInRect:afterScreenUpdates:)]) {
        
        NSInvocation* invoc = [NSInvocation invocationWithMethodSignature:
                               [self methodSignatureForSelector:
                                @selector(drawViewHierarchyInRect:afterScreenUpdates:)]];
        [invoc setTarget:self];
        [invoc setSelector:@selector(drawViewHierarchyInRect:afterScreenUpdates:)];
        CGRect arg2 = self.bounds;
        BOOL arg3 = YES;
        [invoc setArgument:&arg2 atIndex:2];
        [invoc setArgument:&arg3 atIndex:3];
        [invoc invoke];
    } else {
        [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    }
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
@end
