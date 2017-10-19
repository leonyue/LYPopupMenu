//
//  LYPopupMenuItem.h
//  LYPopupMenu
//
//  Created by dj.yue on 2017/10/18.
//  Copyright © 2017年 dj.yue. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LYPopupMenuItem : NSObject

@property (nonatomic, weak, readonly) id target;
@property (nonatomic, assign, readonly) SEL action;

@property (nonatomic, copy, readonly) NSString *title;
@property (nonatomic, copy, readonly) UIImage *image;

+ (instancetype)itemWithTitle:(NSString *)title target:(id)target action:(SEL)action;
+ (instancetype)itemWithImage:(UIImage *)image target:(id)target action:(SEL)action;
+ (instancetype)itemWithTitle:(NSString *)title image:(UIImage *)image target:(id)target action:(SEL)action;

- (instancetype)initWithTitle:(NSString *)title target:(id)target action:(SEL)action;
- (instancetype)initWithImage:(UIImage *)image target:(id)target action:(SEL)action;
- (instancetype)initWithTitle:(NSString *)title image:(UIImage *)image target:(id)target action:(SEL)action;

@end
