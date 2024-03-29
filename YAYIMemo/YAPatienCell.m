//
//  YAPatienCell.m
//  YAYIMemo
//
//  Created by hxp on 17/8/15.
//  Copyright © 2017年 achego. All rights reserved.
//

#import "YAPatienCell.h"

@implementation YAPatienCell


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createViews];
    }
    return self;
}
-(void)setModel:(YAPersonModel *)model
{
    _model = model;
    [self loadData];
}

-(void)loadData{
    self.titleLab.text = _model.name;
    [[SDImageCache sharedImageCache] removeImageForKey:_model.avatar];
    
    [self.icon sd_setImageWithURL:[NSURL URLWithString:_model.avatar] placeholderImage:[UIImage imageNamed:@"book_avatar"]];
}

-(void)createViews{
    self.icon = [UIImageView new];
    self.icon.backgroundColor = [UIColor clearColor];
    [self.icon zy_cornerRadiusAdvance:13.5*YAYIScreenScale rectCornerType:UIRectCornerAllCorners];
    [self.contentView addSubview:self.icon];
    
    self.titleLab = [UILabel new];
    self.titleLab.font = [UIFont systemFontOfSize:14];
    self.titleLab.textColor = [UIColor colorWithHexString:@"#424242"];
    self.titleLab.font = [UIFont systemFontOfSize:YAYIFontWithScale(15)];
    [self.contentView addSubview:self.titleLab];
    
    self.hLine = [UILabel new];
    self.hLine.backgroundColor = [UIColor colorWithHexString:@"#e7e7e7"];
    [self.contentView addSubview:self.hLine];
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    [self.icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(58*YAYIScreenScale));
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
        make.width.equalTo(@(30*YAYIScreenScale));
        make.height.equalTo(@(30*YAYIScreenScale));
    }];
    
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.icon.mas_right).offset(20*YAYIScreenScale);
            make.centerY.mas_equalTo(self.icon.mas_centerY);
            make.height.equalTo(@20);
    }];
    
    [self.hLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.titleLab.mas_left);
        make.bottom.mas_equalTo(self.contentView.mas_bottom);
        make.height.equalTo(@1);
        make.right.equalTo(@0);
    }];

    
    
}


@end
