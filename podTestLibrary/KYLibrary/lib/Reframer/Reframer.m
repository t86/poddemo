//
//  Reframer.m
//  HibuSearch
//
//  Created by Tom York on 04/11/2013.
//  Copyright (c) 2013 HIBU. All rights reserved.
//

#import "Reframer.h"

@interface Reframer ()
@property (nonatomic,strong) UIView* view;
@end

@implementation Reframer {
    CGRect _accumulatedFrame;
}

+ (instancetype)reframerWithView:(UIView*)viewToBeReframed
{
    return [[self alloc] initWithView:viewToBeReframed];
}

- (id)initWithView:(UIView*)viewToBeReframed
{
    NSParameterAssert(viewToBeReframed);
    if((self = [super init]))
    {
        _accumulatedFrame = viewToBeReframed.frame;
        _view = viewToBeReframed;
    }
    return self;
}

- (id)initWithFrame:(CGRect)baseFrame
{
    NSParameterAssert(!CGRectIsNull(baseFrame));
    NSParameterAssert(!CGRectIsInfinite(baseFrame));
    if((self = [super init]))
    {
        _accumulatedFrame = baseFrame;
    }
    return self;
}

- (Reframer*)offsetX:(CGFloat)x
{
    _accumulatedFrame.origin.x += x;
    return self;
}

- (Reframer*)offsetY:(CGFloat)y
{
    _accumulatedFrame.origin.y += y;
    return self;
}

- (Reframer*)offset:(CGPoint)offset
{
    [self offsetX:offset.x];
    [self offsetY:offset.y];
    return self;
}

- (Reframer*)setX:(CGFloat)x
{
    _accumulatedFrame.origin.x = x;
    return self;
}

- (Reframer*)setY:(CGFloat)y
{
    _accumulatedFrame.origin.y = y;
    return self;
}

- (Reframer*)setOrigin:(CGPoint)origin
{
    _accumulatedFrame.origin = origin;
    return self;
}

- (Reframer*)setWidth:(CGFloat)width
{
    _accumulatedFrame.size.width = width;
    return self;
}

- (Reframer*)setHeight:(CGFloat)height
{
    _accumulatedFrame.size.height = height;
    return self;
}

- (Reframer*)setSize:(CGSize)size
{
    _accumulatedFrame.size = size;
    return self;
}

- (Reframer*)setFrame:(CGRect)frame
{
    _accumulatedFrame = frame;
    return self;
}

#pragma mark - Size delta -

- (Reframer*)changeWidthBy:(CGFloat)widthChange
{
    _accumulatedFrame.size.width += widthChange;
    return self;
}

- (Reframer*)changeHeightBy:(CGFloat)heightChange
{
    _accumulatedFrame.size.height += heightChange;
    return self;
}

- (Reframer*)changeSizeBy:(CGSize)sizeChange
{
    _accumulatedFrame.size.width += sizeChange.width;
    _accumulatedFrame.size.height += sizeChange.height;
    return self;
}

#pragma mark - Insetting -

- (Reframer*)insetWithEdgeInsets:(UIEdgeInsets)edgeInsets
{
    _accumulatedFrame = UIEdgeInsetsInsetRect(_accumulatedFrame, edgeInsets);
    return self;
}

#pragma mark - Square off -

- (Reframer*)squareUsingWidth
{
    _accumulatedFrame.size.height = _accumulatedFrame.size.width;
    return self;
}

- (Reframer*)squareUsingHeight
{
    _accumulatedFrame.size.width = _accumulatedFrame.size.height;
    return self;
}

- (Reframer*)makeSmallestSquare
{
    const CGFloat smallestSize = MIN(_accumulatedFrame.size.width, _accumulatedFrame.size.height);
    _accumulatedFrame.size.width = smallestSize;
    _accumulatedFrame.size.height = smallestSize;
    return self;
}

- (Reframer*)makeLargestSquare
{
    const CGFloat largestSize = MAX(_accumulatedFrame.size.width, _accumulatedFrame.size.height);
    _accumulatedFrame.size.width = largestSize;
    _accumulatedFrame.size.height = largestSize;
    return self;
}

#pragma mark - Fitting -

- (Reframer*)sizeToFit
{
    return [self setSize:[self.view sizeThatFits:_accumulatedFrame.size]];
}

- (Reframer*)sizeToFitWidth
{
    return [self setWidth:[self.view sizeThatFits:_accumulatedFrame.size].width];
}

- (Reframer*)sizeToFitHeight
{
    return [self setHeight:[self.view sizeThatFits:_accumulatedFrame.size].height];
}

- (Reframer*)sizeToFitMaxWidth:(CGFloat)maximumWidth
{
    const CGFloat bestWidth = [self.view sizeThatFits:_accumulatedFrame.size].width;
    _accumulatedFrame.size.width = MIN(bestWidth, maximumWidth);
    return self;
}

- (Reframer*)sizeToFitSize:(CGSize)size
{
    _accumulatedFrame.size = [self.view sizeThatFits:size];
    return self;
}

- (Reframer*)sizeToFitMaxHeight:(CGFloat)maximumHeight
{
    const CGFloat bestHeight = [self.view sizeThatFits:_accumulatedFrame.size].height;
    _accumulatedFrame.size.height = MIN(bestHeight, maximumHeight);
    return self;
}

- (Reframer*)fillFrameHorizontally:(CGRect)frame
{
    return [self fillFrameHorizontally:frame margin:0.0f];
}

- (Reframer*)fillFrameHorizontally:(CGRect)frame margin:(CGFloat)margin
{
    _accumulatedFrame.origin.x = frame.origin.x + margin;
    _accumulatedFrame.size.width = frame.size.width - 2.0f*margin;
    return self;
}

- (Reframer*)fillFrameVertically:(CGRect)frame
{
    return [self fillFrameVertically:frame margin:0.0f];
}

- (Reframer*)fillFrameVertically:(CGRect)frame margin:(CGFloat)margin
{
    _accumulatedFrame.origin.y = frame.origin.y + margin;
    _accumulatedFrame.size.height = frame.size.height - 2.0f*margin;
    return self;
}

#pragma mark - Center -

- (Reframer*)centerInFrame:(CGRect)frame
{
    [self centerInFrameHorizontally:frame];
    [self centerInFrameVertically:frame];
    return self;
}

- (Reframer*)centerInFrameHorizontally:(CGRect)frame
{
    _accumulatedFrame.origin.x = CGRectGetMidX(frame) - floorf(0.5f*_accumulatedFrame.size.width);
    return self;
}

- (Reframer*)centerInFrameVertically:(CGRect)frame
{
    _accumulatedFrame.origin.y = CGRectGetMidY(frame) - floorf(0.5f*_accumulatedFrame.size.height);
    return self;
}

#pragma mark - Align -

- (Reframer*)alignToTopOfFrame:(CGRect)frame
{
    return [self alignToTopOfFrame:frame inset:0.0f];
}

- (Reframer*)alignToLeftOfFrame:(CGRect)frame
{
    return [self alignToLeftOfFrame:frame inset:0.0f];
}

- (Reframer*)alignToBottomOfFrame:(CGRect)frame
{
    return [self alignToBottomOfFrame:frame inset:0.0f];
}

- (Reframer*)alignToRightOfFrame:(CGRect)frame
{
    return [self alignToRightOfFrame:frame inset:0.0f];
}

- (Reframer*)alignToTopLeftOfFrame:(CGRect)frame
{
    return [self alignToTopLeftOfFrame:frame insets:CGSizeZero];
}

- (Reframer*)alignToTopRightOfFrame:(CGRect)frame
{
    return [self alignToTopRightOfFrame:frame insets:CGSizeZero];
}

- (Reframer*)alignToBottomLeftOfFrame:(CGRect)frame
{
    return [self alignToBottomLeftOfFrame:frame insets:CGSizeZero];
}

- (Reframer*)alignToBottomRightOfFrame:(CGRect)frame
{
    return [self alignToBottomRightOfFrame:frame insets:CGSizeZero];
}

- (Reframer*)alignToTopLeftOfFrame:(CGRect)frame insets:(CGSize)insets
{
    [self alignToLeftOfFrame:frame inset:insets.width];
    [self alignToTopOfFrame:frame inset:insets.height];
    return self;
}

- (Reframer*)alignToTopRightOfFrame:(CGRect)frame insets:(CGSize)insets
{
    [self alignToRightOfFrame:frame inset:insets.width];
    [self alignToTopOfFrame:frame inset:insets.height];
    return self;
}

- (Reframer*)alignToBottomLeftOfFrame:(CGRect)frame insets:(CGSize)insets
{
    [self alignToLeftOfFrame:frame inset:insets.width];
    [self alignToBottomOfFrame:frame inset:insets.height];
    return self;
}

- (Reframer*)alignToBottomRightOfFrame:(CGRect)frame insets:(CGSize)insets
{
    [self alignToRightOfFrame:frame inset:insets.width];
    [self alignToBottomOfFrame:frame inset:insets.height];
    return self;
}

- (Reframer*)alignToTopOfFrame:(CGRect)frame inset:(CGFloat)inset
{
    _accumulatedFrame.origin.y = frame.origin.y + floorf(inset);
    return self;
}

- (Reframer*)alignToLeftOfFrame:(CGRect)frame inset:(CGFloat)inset
{
    _accumulatedFrame.origin.x = frame.origin.x + floorf(inset);
    return self;
}

- (Reframer*)alignToBottomOfFrame:(CGRect)frame inset:(CGFloat)inset
{
    _accumulatedFrame.origin.y = CGRectGetMaxY(frame) - _accumulatedFrame.size.height - ceilf(inset);
    return self;
}

- (Reframer*)alignToRightOfFrame:(CGRect)frame inset:(CGFloat)inset
{
    _accumulatedFrame.origin.x = CGRectGetMaxX(frame) - _accumulatedFrame.size.width - ceilf(inset);
    return self;
}

#pragma mark - Place on -

- (Reframer*)placeOnTopOfFrame:(CGRect)frame
{
    return [self placeOnTopOfFrame:frame padding:0.0f];
}

- (Reframer*)placeOnLeftOfFrame:(CGRect)frame
{
    return [self placeOnLeftOfFrame:frame padding:0.0f];
}

- (Reframer*)placeOnBottomOfFrame:(CGRect)frame
{
    return [self placeOnBottomOfFrame:frame padding:0.0f];
}

- (Reframer*)placeOnRightOfFrame:(CGRect)frame
{
    return [self placeOnRightOfFrame:frame padding:0.0f];
}

- (Reframer*)placeOnTopOfFrame:(CGRect)frame padding:(CGFloat)padding
{
    _accumulatedFrame.origin.y = CGRectGetMinY(frame) - ceilf(padding) - _accumulatedFrame.size.height;
    return self;
}

- (Reframer*)placeOnLeftOfFrame:(CGRect)frame padding:(CGFloat)padding
{
    _accumulatedFrame.origin.x = CGRectGetMinX(frame) - ceilf(padding) - _accumulatedFrame.size.width;
    return self;
}

- (Reframer*)placeOnBottomOfFrame:(CGRect)frame padding:(CGFloat)padding
{
    _accumulatedFrame.origin.y = CGRectGetMaxY(frame) + ceilf(padding);
    return self;
}

- (Reframer*)placeOnRightOfFrame:(CGRect)frame padding:(CGFloat)padding
{
    _accumulatedFrame.origin.x = CGRectGetMaxX(frame) + ceilf(padding);
    return self;
}

#pragma mark - Block action -

- (Reframer*)reframeWithBlock:(void(^)(Reframer* reframer))block
{
    NSParameterAssert(block);
    block(self);
    return self;
}

#pragma mark - Apply -

- (void)apply
{
    self.view.frame = _accumulatedFrame;
    self.view = nil;
}

- (void)reframeAndApplyBlock:(void(^)(Reframer* reframer))block
{
    [self reframeWithBlock:block];
    [self apply];
}

#pragma mark - Extract -

- (CGRect)extractFrame
{
    return _accumulatedFrame;
}

- (CGRect)extractFrameWithBlock:(void(^)(Reframer* reframer))block
{
    NSParameterAssert(block);
    block(self);
    return _accumulatedFrame;
}


@end
