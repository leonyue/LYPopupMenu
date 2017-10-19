//
//  LYPopupMenuPagenatorView.h
//  LYPopupMenu
//
//  Created by dj.yue on 2017/10/18.
//  Copyright © 2017年 dj.yue. All rights reserved.
//

#import "LYPopupMenuItemView.h"

typedef NS_ENUM(NSUInteger, LYPopupMenuPagenatorDirection) {
    LYPopupMenuPagenatorDirectionLeft,
    LYPopupMenuPagenatorDirectionRight
};

@interface LYPopupMenuPagenatorView : LYPopupMenuItemView

@property (nonatomic, weak) id target;
@property (nonatomic, assign) SEL action;

+ (CGFloat)pagenatorWidth;

+ (instancetype)leftPagenatorViewWithTarget:(id)target action:(SEL)action;
+ (instancetype)rightPagenatorViewWithTarget:(id)target action:(SEL)action;

- (instancetype)initWithArrowDirection:(LYPopupMenuPagenatorDirection)arrowDirection target:(id)target action:(SEL)action;

// NOTE: When subclassing this class, use these methods to customize the appearance.
- (CGMutablePathRef)arrowPathInRect:(CGRect)rect direction:(LYPopupMenuPagenatorDirection)direction CF_RETURNS_RETAINED;
- (void)drawArrowInRect:(CGRect)rect direction:(LYPopupMenuPagenatorDirection)direction highlighted:(BOOL)highlighted;

@end
