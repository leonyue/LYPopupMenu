//
//  LYPopupMenuPagenatorView.m
//  LYPopupMenu
//
//  Created by dj.yue on 2017/10/18.
//  Copyright © 2017年 dj.yue. All rights reserved.
//

#import "LYPopupMenuPagenatorView.h"

@implementation LYPopupMenuPagenatorView

+ (CGFloat)pagenatorWidth
{
    return 10 + 10 * 2;
}

+ (instancetype)leftPagenatorViewWithTarget:(id)target action:(SEL)action
{
    return [[self alloc] initWithArrowDirection:LYPopupMenuPagenatorDirectionLeft target:target action:action];
}

+ (instancetype)rightPagenatorViewWithTarget:(id)target action:(SEL)action
{
    return [[self alloc] initWithArrowDirection:LYPopupMenuPagenatorDirectionRight target:target action:action];
}

- (instancetype)initWithArrowDirection:(LYPopupMenuPagenatorDirection)arrowDirection target:(id)target action:(SEL)action
{
    self = [super initWithItem:nil];
    
    if (self) {
        // Property settings
        self.target = target;
        self.action = action;
        
        // Set arrow image
        UIImage *arrowImage = [self arrowImageWithSize:CGSizeMake(10, 10)
                                             direction:arrowDirection
                                           highlighted:NO];
        [self.button setImage:arrowImage forState:UIControlStateNormal];
        
        UIImage *highlightedArrowImage = [self arrowImageWithSize:CGSizeMake(10, 10)
                                                        direction:arrowDirection
                                                      highlighted:YES];
        [self.button setImage:highlightedArrowImage forState:UIControlStateHighlighted];
    }
    
    return self;
}


#pragma mark - Actions

- (void)performAction
{
    if (self.target && self.action) {
        [self.target performSelector:self.action withObject:nil afterDelay:0];
    }
}


#pragma mark - Updating the View

- (CGSize)sizeThatFits:(CGSize)size
{
    CGSize buttonSize = [self.button sizeThatFits:CGSizeZero];
    buttonSize.width = [[self class] pagenatorWidth];
    
    return buttonSize;
}

- (UIImage *)arrowImageWithSize:(CGSize)size direction:(LYPopupMenuPagenatorDirection)direction highlighted:(BOOL)highlighted
{
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    
    // Draw arrow
    [self drawArrowInRect:CGRectMake(0, 0, size.width, size.height) direction:direction highlighted:highlighted];
    
    // Create image from buffer
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
}


#pragma mark - Creating Paths

- (CGMutablePathRef)arrowPathInRect:(CGRect)rect direction:(LYPopupMenuPagenatorDirection)direction
{
    CGMutablePathRef path = CGPathCreateMutable();
    
    switch (direction) {
        case LYPopupMenuPagenatorDirectionLeft:
        {
            CGPathMoveToPoint(path, NULL, rect.origin.x + rect.size.width, rect.origin.y);
            CGPathAddLineToPoint(path, NULL, rect.origin.x + rect.size.width, rect.origin.y + rect.size.height);
            CGPathAddLineToPoint(path, NULL, rect.origin.x, rect.origin.y + rect.size.height / 2.0);
            CGPathCloseSubpath(path);
        }
            break;
            
        case LYPopupMenuPagenatorDirectionRight:
        {
            CGPathMoveToPoint(path, NULL, rect.origin.x, rect.origin.y);
            CGPathAddLineToPoint(path, NULL, rect.origin.x, rect.origin.y + rect.size.height);
            CGPathAddLineToPoint(path, NULL, rect.origin.x + rect.size.width, rect.origin.y + rect.size.height / 2.0);
            CGPathCloseSubpath(path);
        }
            break;
            
        default:
            break;
    }
    
    return path;
}


#pragma mark - Drawing

- (void)drawArrowInRect:(CGRect)rect direction:(LYPopupMenuPagenatorDirection)direction highlighted:(BOOL)highlighted
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    
    CGMutablePathRef path = [self arrowPathInRect:rect direction:direction];
    CGContextAddPath(context, path);
    
    CGContextSetFillColorWithColor(context, [[UIColor whiteColor] CGColor]);
    CGContextFillPath(context);
    
    CGPathRelease(path);
    
    CGContextRestoreGState(context);
}

@end
