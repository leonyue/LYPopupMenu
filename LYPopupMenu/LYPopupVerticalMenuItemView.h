//
//  LYPopupVerticalMenuItemView.h
//  LYPopupMenu
//
//  Created by dj.yue on 2017/10/18.
//  Copyright © 2017年 dj.yue. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LYPopupMenu;
@class LYPopupMenuItem;

@interface LYPopupVerticalMenuItemView : UIView

@property (nonatomic, weak) LYPopupMenu *popupMenu;

@property (nonatomic, strong, readonly) UIButton *button;
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) UIImage *highlightedImage;

@property (nonatomic, strong) LYPopupMenuItem *item;

+ (instancetype)itemViewWithItem:(LYPopupMenuItem *)item;
- (instancetype)initWithItem:(LYPopupMenuItem *)item;

- (void)performAction;

@end
