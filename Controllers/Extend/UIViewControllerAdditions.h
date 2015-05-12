//
//  UIViewControllerAdditions.h
//  ColorRecall
//
//  Created by xuanqiang on 12-11-8.
//  Copyright (c) 2012年 Ecpalm. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
@interface UIViewController(UIViewControllerAdditions)
-(void)setBarTintBlue;
-(void)setBarTintRed;
-(void)setBarTintBlueOrRed;
- (void)setBarTintColor:(UIColor *)color;
- (void)setBarBackgroundImage:(NSString *)imageName;
- (void)setTitleForNavigation:(NSString *)title;
- (void)setLeftButtonForNavigation:(NSString *)imageName selector:(SEL)sel;
- (void)setRightButtonForNavigation:(NSString *)imageName selector:(SEL)sel;
- (void)setLeftBackButtonForNavigation;

- (void)backActionForNavigation:(id)sender;
- (UIImageView*)addTopImageView;
+ (UIViewController *)stroryboardName:(NSString *)name ;

@end
@interface NSString(Emoji)
+(BOOL)isContainsEmoji:(NSString *)string;
///根据时间戳获取距离显在的时间间隔
+(NSString *)intDateToStrFromNSTimeInterval:(NSString *)dateStr;

///时间转时间字符串
+(NSString *)dateToDateStr:(NSString *)dateFormatterStr Date:(NSDate *)date;
///时间字符串转时间
+(NSDate *)dateStrToDate:(NSString *)dateFormatterStr DateStr:(NSString *)dateStr;
///根据时间获取时间戳
+ (NSTimeInterval)dateToTimeInterval:(NSDate *)date;
///获取当前时间戳
+ (NSTimeInterval)currentTime;
///时间戳转时间字符串
+(NSString *)dateTimeIntervalToDateStr:(NSString *)dateFormatterStr TimeInterval:(NSString *)timeInterval;
///时间字符串转时间戳
+(NSTimeInterval)dateStrToDateTimeInterval:(NSString *)dateFormatterStr DateStr:(NSString *)dateStr;


@end
@interface UIImageView(AnimationImageView)
//给imageView添加放大全屏点击事件
-(void)addImageFullViewAnimation;
@end

@interface UIImage (REFrostedViewController)
- (UIImage *)re_applyBlurWithRadius:(CGFloat)blurRadius tintColor:(UIColor *)tintColor saturationDeltaFactor:(CGFloat)saturationDeltaFactor maskImage:(UIImage *)maskImage;
@end
@interface UIView (REFrostedViewController)
//将视图转化为图片
- (UIImage *)re_screenshot;
- (UIImage *)re_screenshotFrame:(CGRect)frame;
@end