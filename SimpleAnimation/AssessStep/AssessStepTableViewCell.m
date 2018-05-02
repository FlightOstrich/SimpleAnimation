//
//  AssessStepTableViewCell.m
//  NuoManDi
//
//  Created by Cai on 2018/4/11.
//  Copyright © 2018年 Cai. All rights reserved.
//

#import "AssessStepTableViewCell.h"

@interface AssessStepTableViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *iconImg;

@property (weak, nonatomic) IBOutlet UIView *lineView;

@property (weak, nonatomic) IBOutlet UILabel *assessTitleLabel;

@property (weak, nonatomic) IBOutlet UILabel *assessContentLabel;


@end

@implementation AssessStepTableViewCell

- (void)setModel:(AssessStepModel *)model
{
    if (model.isColor) {
        [UIView animateWithDuration:2 animations:^{
            self.iconImg.image = [UIImage imageNamed:@"assess_pass"];
            self.lineView.backgroundColor = [UIColor redColor];
        } completion:^(BOOL finished) {
            
        }];
    }
    self.assessTitleLabel.text = model.titleStr;
    self.assessContentLabel.text = model.contentStr;
    if (model.currentCell == 5) {
        self.lineView.hidden = YES;
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
