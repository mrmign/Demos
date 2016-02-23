//
//  NSObject+Swizzle.m
//  TableViewReuseCell
//
//  Created by armingli on 16/2/23.
//  Copyright © 2016年 armingli. All rights reserved.
//

#import "NSObject+Swizzle.h"
#import <objc/runtime.h>
#import "UITableView+Swizzle.h"

@implementation NSObject (Swizzle)
+ (BOOL)swizzleMethod:(SEL)origSel withMethod:(SEL)altSel
{
    Method originMethod = class_getInstanceMethod(self, origSel);
    Method newMethod = class_getInstanceMethod(self, altSel);
    
    if (originMethod && newMethod) {
        if (class_addMethod(self, origSel, method_getImplementation(newMethod), method_getTypeEncoding(newMethod))) {
            class_replaceMethod(self, altSel, method_getImplementation(originMethod), method_getTypeEncoding(originMethod));
        } else {
            method_exchangeImplementations(originMethod, newMethod);
        }
        return YES;
    }
    return NO;
}

+ (BOOL)swizzleClassMethod:(SEL)origSel withClassMethod:(SEL)altSel
{
    Class c = object_getClass((id)self);
    return [c swizzleMethod:origSel withMethod:altSel];
}

+ (void)doSwizzle
{
    [UITableView swizzleMethod:@selector(reloadData) withMethod:@selector(swizzleReloadData)];
}
@end
