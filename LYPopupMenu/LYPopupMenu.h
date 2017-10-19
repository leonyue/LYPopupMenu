//
//  LYPopupMenu.h
//  LYPopupMenu
//
//  Created by dj.yue on 2017/10/18.
//  Copyright © 2017年 dj.yue. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "LYPopupMenuItem.h"

@class LYPopupMenu;
@class LYPopupMenuItemView;
@class LYPopupMenuPagenatorView;

@protocol LYPopupMenuDelegate <NSObject>

@optional
- (void)popupMenuWillAppear:(LYPopupMenu *)popupMenu;
- (void)popupMenuDidAppear:(LYPopupMenu *)popupMenu;
- (void)popupMenuWillDisappear:(LYPopupMenu *)popupMenu;
- (void)popupMenuDidDisappear:(LYPopupMenu *)popupMenu;

@end

typedef NS_ENUM(NSUInteger, LYPopupMenuArrowDirection) {
    LYPopupMenuArrowDirectionDefault,
    LYPopupMenuArrowDirectionUp,
    LYPopupMenuArrowDirectionDown,
    LYPopupMenuArrowDirectionLeft,
    LYPopupMenuArrowDirectionRight
};

@interface LYPopupMenu : UIView

@property (nonatomic, weak) id<LYPopupMenuDelegate> delegate;

@property (nonatomic, assign, getter = isVisible, readonly) BOOL visible;
@property (nonatomic, copy) NSArray *items;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat cornerRadius;
@property (nonatomic, assign) CGFloat arrowSize;
@property (nonatomic, assign) LYPopupMenuArrowDirection arrowDirection;
@property (nonatomic, assign) UIEdgeInsets popupMenuInsets;
@property (nonatomic, assign) CGFloat margin;
@property (nonatomic, assign) BOOL showSeparator;

@property (nonatomic, strong) UIColor *color;
@property (nonatomic, strong) UIColor *highlightedColor;

+ (instancetype)popupMenuWithItems:(NSArray *)items;
- (instancetype)initWithItems:(NSArray *)items;

- (void)showInView:(UIView *)view targetRect:(CGRect)targetRect animated:(BOOL)animated;
- (void)dismissAnimated:(BOOL)animated;
- (void)updateWithTargetRect:(CGRect)targetRect;

// NOTE: When subclassing this class, use these methods to customize the appearance.
+ (Class)itemViewClass;
+ (Class)pagenatorViewClass;

- (CGMutablePathRef)arrowPathInRect:(CGRect)rect direction:(LYPopupMenuArrowDirection)direction CF_RETURNS_RETAINED;
- (CGMutablePathRef)headPathInRect:(CGRect)rect cornerRadius:(CGFloat)cornerRadius CF_RETURNS_RETAINED;
- (CGMutablePathRef)tailPathInRect:(CGRect)rect cornerRadius:(CGFloat)cornerRadius CF_RETURNS_RETAINED;
- (CGMutablePathRef)bodyPathInRect:(CGRect)rect CF_RETURNS_RETAINED;

- (void)drawArrowAtPoint:(CGPoint)point arrowSize:(CGFloat)arrowSize arrowDirection:(LYPopupMenuArrowDirection)arrowDirection highlighted:(BOOL)highlighted;
- (void)drawArrowInRect:(CGRect)rect direction:(LYPopupMenuArrowDirection)direction highlighted:(BOOL)highlighted;
- (void)drawHeadInRect:(CGRect)rect cornerRadius:(CGFloat)cornerRadius highlighted:(BOOL)highlighted;
- (void)drawTailInRect:(CGRect)rect cornerRadius:(CGFloat)cornerRadius highlighted:(BOOL)highlighted;
- (void)drawBodyInRect:(CGRect)rect firstItem:(BOOL)firstItem lastItem:(BOOL)lastItem highlighted:(BOOL)highlighted;

@end
