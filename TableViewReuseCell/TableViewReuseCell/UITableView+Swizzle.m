//
//  UITableView+Swizzle.m
//  TableViewReuseCell
//
//  Created by armingli on 16/2/23.
//  Copyright © 2016年 armingli. All rights reserved.
//

#import "UITableView+Swizzle.h"

@implementation UITableView (Swizzle)
- (void)swizzleReloadData
{
    NSLog(@"TableView ReloadData Before: %@", [self.subviews[0] subviews]);
    [self swizzleReloadData];
    NSLog(@"TableView ReloadData After: %@", [self.subviews[0] subviews]);
}
@end
