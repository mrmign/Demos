//
//  CustomCellTableViewCell.m
//  TableViewReuseCell
//
//  Created by armingli on 16/2/23.
//  Copyright © 2016年 armingli. All rights reserved.
//

#import "CustomTableViewCell.h"

@implementation CustomTableViewCell

- (void)awakeFromNib {
    // Initialization code
    
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        NSLog(@"New Cell Initilization %@", self);
        _titleLabel = [[UILabel alloc] initWithFrame:self.bounds];
        [self.contentView addSubview:_titleLabel];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    CGRect f = _titleLabel.frame;
    f.origin.x = 20;
    _titleLabel.frame = f;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(NSString *)description
{
    NSMutableString *str = [[NSMutableString alloc]init];
    [str appendString: [NSString stringWithFormat:@"<CustomTableViewCell: %p; ",self] ];
    if (self.titleLabel.text.length > 0) {
        [str appendString:[NSString stringWithFormat:@"text = '%@'; ", self.titleLabel.text]];
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
