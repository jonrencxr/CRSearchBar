//
//  CRSearchBar.m
//  sunCanteen
//
//  Created by Jonren on 16/4/22.
//  Copyright © 2016年 常宣任. All rights reserved.
//

#import "CRSearchBar.h"

@implementation CRSearchBar

- (instancetype)initWithFrame:(CGRect)frame leftImage:(UIImage *)leftImage placeholderColor:(UIColor *)placeholderColor {
    self = [super initWithFrame:frame];
    if (self) {
        self.hasCentredPlaceholder = YES;
        self.leftImage = leftImage;
        self.placeholderColor = placeholderColor;
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    // 通过遍历self.subviews找到searchField
    UITextField *searchField;
    NSUInteger numViews = [self.subviews count];
    for(int i = 0;i < numViews; i++) {
        if([[self.subviews objectAtIndex:i] isKindOfClass:[UITextField class]]) {
            searchField = [self.subviews objectAtIndex:i];
        }
    }
    // 如果上述方法找不到searchField,试试下面的方法
    if (searchField == nil) {
        NSArray *arraySub = [self subviews];
        UIView *viewSelf = [arraySub objectAtIndex:0];
        NSArray *arrayView = [viewSelf subviews];
        for(int i = 0;i < arrayView.count; i++) {
            if([[arrayView objectAtIndex:i] isKindOfClass:[UITextField class]]) {
                searchField = [arrayView objectAtIndex:i];
            }
        }
    }
    if (searchField) {
        [searchField setBorderStyle:UITextBorderStyleNone];
        [searchField setValue:_placeholderColor forKeyPath:@"_placeholderLabel.textColor"];
        searchField.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
        searchField.font = [UIFont systemFontOfSize:16];
        
        UIImage *image = _leftImage;
        UIImageView *leftImg = [[UIImageView alloc] initWithImage:image];
        leftImg.frame = CGRectMake(0,0,image.size.width, image.size.height);
        searchField.leftView = leftImg;
    }
}


#pragma mark - Methods

- (void)setHasCentredPlaceholder:(BOOL)hasCentredPlaceholder {
    _hasCentredPlaceholder = hasCentredPlaceholder;
    SEL centerSelector = NSSelectorFromString([NSString stringWithFormat:@"%@%@", @"setCenter", @"Placeholder:"]);
    if ([self respondsToSelector:centerSelector]) {
        NSMethodSignature *signature = [[UISearchBar class] instanceMethodSignatureForSelector:centerSelector];
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
        [invocation setTarget:self];
        [invocation setSelector:centerSelector];
        [invocation setArgument:&_hasCentredPlaceholder atIndex:2];
        [invocation invoke];
    }
}


@end
