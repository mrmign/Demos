//
//  NSObject+Swizzle.h
//  TableViewReuseCell
//
//  Created by armingli on 16/2/23.
//  Copyright © 2016年 armingli. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Swizzle)
+ (BOOL)swizzleMethod:(SEL)origSel withMethod:(SEL)altSel;
+ (BOOL)swizzleClassMethod:(SEL)origSel withClassMethod:(SEL)altSel;
+ (void)doSwizzle;
@end
