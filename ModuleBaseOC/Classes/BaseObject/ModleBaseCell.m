//
//  ModleBaseCell.m
//  Pods
//
//  Created by 邱俊荣 on 2020/8/10.
//

#import "ModleBaseCell.h"

@implementation ModleBaseCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    self.backgroundColor = [UIColor clearColor];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}


- (void)setBaseItem:(ModleBaseItem *)baseItem {
    _baseItem = baseItem;
}

@end
