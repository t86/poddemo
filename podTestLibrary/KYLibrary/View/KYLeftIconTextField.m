//
//  KYLeftIconTextField.m
//  icfappIOS
//
//  Created by xwzhou on 20/3/18.
//  Copyright © 2016年 kaiyuandao. All rights reserved.
//

#import "KYLeftIconTextField.h"
#import "UIView+Reframer.h"

@implementation KYLeftIconTextField

#pragma mark - init
- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    return  self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit {
    UIImageView *imv = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    imv.contentMode = UIViewContentModeScaleAspectFit;
    self.leftView = imv;
    self.leftViewMode = UITextFieldViewModeAlways;
    self.font = [UIFont systemFontOfSize:16.0f];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onTextFieldBeginEditing:) name:UITextFieldTextDidBeginEditingNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onTextFieldEndEditing:) name:UITextFieldTextDidEndEditingNotification object:nil];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [[[[self.leftView rf_reframer] sizeToFit] centerInFrameVertically:self.bounds] apply];
}

#pragma mark - notification
- (void)onTextFieldBeginEditing:(NSNotification *)notification {
    if (notification.object != self) {
        return;
    }
    
    UIImageView *imv = (UIImageView *)self.leftView;
    imv.image = [UIImage imageNamed:_highlightedIconName];
}

- (void)onTextFieldEndEditing:(NSNotification *)notification {
    if (notification.object != self) {
        return;
    }
    

    UIImageView *imv = (UIImageView *)self.leftView;
    imv.image = [UIImage imageNamed:_normalIconName];
}

#pragma mark - access method
- (void)setNormalIconName:(NSString *)normalIconName {
    _normalIconName = normalIconName;
    
    UIImageView *imv = (UIImageView *)self.leftView;
    imv.image = [UIImage imageNamed:_normalIconName];
}

- (void)setHighlightedIconName:(NSString *)highlightedIconName {
    _highlightedIconName = highlightedIconName;
}

#pragma mark - 控制文字左端距离
- (CGRect)textRectForBounds:(CGRect)bounds {
    CGFloat leftSpace = self.leftView.frame.size.width + 8;
    return CGRectMake(bounds.origin.x + leftSpace, bounds.origin.y, bounds.size.width - leftSpace, bounds.size.height);
}

- (CGRect)editingRectForBounds:(CGRect)bounds {
    CGFloat leftSpace = self.leftView.frame.size.width + 8;
    return CGRectMake(bounds.origin.x + leftSpace, bounds.origin.y, bounds.size.width - leftSpace, bounds.size.height);
}

@end
