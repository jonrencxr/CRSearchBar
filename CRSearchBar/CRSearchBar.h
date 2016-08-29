//
//  CRSearchBar.h
//  sunCanteen
//
//  Created by Jonren on 16/4/22.
//  Copyright © 2016年 常宣任. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CRSearchBar : UISearchBar

// 默认YES居中，通过设置NO，可居左
@property (nonatomic, assign, setter = setHasCentredPlaceholder:) BOOL hasCentredPlaceholder;

// searchField 左侧图片
@property (nonatomic, strong) UIImage *leftImage;

// placeholder颜色
@property (nonatomic, strong) UIColor *placeholderColor;


- (instancetype)initWithFrame:(CGRect)frame leftImage:(UIImage *)leftImage placeholderColor:(UIColor *)placeholderColor;


@end
