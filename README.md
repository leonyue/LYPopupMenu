# LYPopupMenu

Based on QBPopupMenu

Add showSeperator property

Add auto height

Add image top title bottom menuItem

![](LYPopupMenu.gif)
## Demo codes
```
LYPopupMenuItem *item = [LYPopupMenuItem itemWithTitle:@"标准地图" image:[UIImage imageNamed:@"standard_map"] target:self action:@selector(action:)];
    LYPopupMenuItem *item2 = [LYPopupMenuItem itemWithTitle:@"卫星地图" image:[UIImage imageNamed:@"satellite_map"] target:self action:@selector(action:)];
     LYPopupMenuItem *item3 = [LYPopupMenuItem itemWithTitle:@"复合地图" image:[UIImage imageNamed:@"compound_map"] target:self action:@selector(action:)];
    LYPopupVerticalMenu *popupMenu = [[LYPopupVerticalMenu alloc] initWithItems:@[item, item2, item3]];
    popupMenu.showSeparator = NO;
    popupMenu.cornerRadius = 0.f;
    [popupMenu showInView:self.view targetRect:sender.frame animated:YES];
```
