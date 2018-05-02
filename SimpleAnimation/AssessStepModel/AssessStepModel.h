//
//  AssessStepModel.h
//  NuoManDi
//
//  Created by Cai on 2018/4/11.
//  Copyright © 2018年 Cai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AssessStepModel : NSObject
/** 颜色标记 */
@property (nonatomic,  assign)  BOOL isColor;
/** 标题 */
@property (nonatomic,  copy)  NSString * titleStr;
/** 内容 */
@property (nonatomic,  copy)  NSString * contentStr;
/** 当前Cell */
@property (nonatomic,  assign)  NSInteger  currentCell;

@end
