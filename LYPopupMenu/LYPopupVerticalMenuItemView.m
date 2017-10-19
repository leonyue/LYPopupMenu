//
//  LYPopupVerticalMenuItemView.m
//  LYPopupMenu
//
//  Created by dj.yue on 2017/10/18.
//  Copyright © 2017年 dj.yue. All rights reserved.
//

#import "LYPopupVerticalMenuItemView.h"

#import "LYPopupMenu.h"
#import "LYPopupMenuItem.h"

@interface LYPopupVerticalMenuItemView ()

@property (nonatomic, strong, readwrite) UIButton *button;

@end

@implementation LYPopupVerticalMenuItemView

+ (instancetype)itemViewWithItem:(LYPopupMenuItem *)item
{
    return [[self alloc] initWithItem:item];
}

- (instancetype)initWithItem:(LYPopupMenuItem *)item
{
    self = [super initWithFrame:CGRectZero];
    
    if (self) {
        // View settings
        self.opaque = NO;
        self.backgroundColor = [UIColor clearColor];
        self.clipsToBounds = YES;
        
        // Create button
        self.button = ({
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = self.bounds;
            button.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
            [button addTarget:self action:@selector(performAction) forControlEvents:UIControlEventTouchUpInside];
            
            // Set style
            button.contentMode = UIViewContentModeScaleAspectFit;
            button.titleLabel.font = [UIFont systemFontOfSize:14.0];
            button.imageView.contentMode = UIViewContentModeScaleAspectFit;
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
            
            button;
        });
        [self addSubview:self.button];
        
        // Property settings
        self.item = item;
    }
    
    return self;
}


#pragma mark - Accessors

- (void)setImage:(UIImage *)image
{
    [self.button setBackgroundImage:image forState:UIControlStateNormal];
}

- (UIImage *)image
{
    return [self.button backgroundImageForState:UIControlStateNormal];
}

- (void)setHighlightedImage:(UIImage *)highlightedImage
{
    [self.button setBackgroundImage:highlightedImage forState:UIControlStateHighlighted];
}

- (UIImage *)highlightedImage
{
    return [self.button backgroundImageForState:UIControlStateHighlighted];
}

- (void)setItem:(LYPopupMenuItem *)item
{
    _item = item;
    
    // Update
    [self configureButton];
}


#pragma mark - Actions

- (void)performAction
{
    if (self.item.target && self.item.action) {
        [self.item.target performSelector:self.item.action withObject:nil afterDelay:0];
    }
    
    // Close popup menu
    [self.popupMenu dismissAnimated:YES];
}


#pragma mark - Updating the View

- (void)sizeToFit
{
    CGSize size = [self sizeThatFits:CGSizeZero];
    
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGSize)sizeThatFits:(CGSize)size
{
    CGSize buttonImageSize = [self.button.imageView sizeThatFits:CGSizeZero];
    CGSize buttonLabelSize = [self.button.titleLabel sizeThatFits:CGSizeZero];
    CGSize buttonSize = CGSizeMake(MAX(buttonImageSize.width, buttonLabelSize.width), buttonLabelSize.height + buttonImageSize.height);
    buttonSize.width += 10 * 2;
    buttonSize.height += 5;
    buttonSize.height += 10 * 2;
    return buttonSize;
}

- (void)configureButton
{
    // Title
    [self.button setTitle:self.item.title forState:UIControlStateNormal];
    
    // Image
    [self.button setImage:self.item.image forState:UIControlStateNormal];
    [self.button setImage:self.item.image forState:UIControlStateHighlighted];
    
    // Content edge insets
    if (self.item.title && self.item.image) {
        CGSize imageSize = [self.button.imageView sizeThatFits:CGSizeZero];
        CGSize titleSize = [self.button.titleLabel sizeThatFits:CGSizeZero];
        self.button.titleEdgeInsets = UIEdgeInsetsMake(0, -imageSize.width,  -imageSize.height - 5,  0);
        self.button.imageEdgeInsets = UIEdgeInsetsMake( -titleSize.height - 5,  0,  0,  -titleSize.width);
    } else {
        self.button.titleEdgeInsets = UIEdgeInsetsZero;
        self.button.imageEdgeInsets = UIEdgeInsetsZero;
    }
}

@end
