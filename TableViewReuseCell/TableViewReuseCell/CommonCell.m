//
//  CommonCell.m
//  TableViewReuseCell
//
//  Created by armingli on 16/2/23.
//  Copyright © 2016年 armingli. All rights reserved.
//

#import "CommonCell.h"

@implementation CommonCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        NSLog(@"CommonCell Init %@",self);
    }
    return self;
}

-(NSString *)description
{
    NSMutableString *str = [[NSMutableString alloc]init];
    [str appendString: [NSString stringWithFormat:@"<CommonCell: %p; ",self] ];
    if (self.textLabel.text.length > 0) {
        [str appendString:[NSString stringWithFormat:@"text = '%@'; ", self.textLabel.text]];
    }
    if (self.hidden) {
        [str appendString:@"hidden = YES; "];
    }
    if (self.tag > 0) {
        [str appendString:[NSString stringWithFormat:@"tag = %zi",self.tag]];
    }
    [str appendString:@">"];
    return str;
}
@end
