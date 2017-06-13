//
//  Reframer.h
//  HibuSearch
//
//  Created by Tom York on 04/11/2013.
//  Copyright (c) 2013 HIBU. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 Reframer is a basic DSL for helping to layout UIViews.
 To use, first obtain an instance of Reframer by calling -[initWithView:], +[reframerWithView:] (or -[UIView rf_reframer] with the UIView+Reframer category).
 Next, call any frame adjustment methods you want on the Reframer instance. Each method returns the reframer instance so you can nest calls.
 Finally, call -[apply] to have the Reframer instance update its associated view. You don't need to retain the Reframer instance after that.
 
 
 Reframer is intended to replace UIView+HibuSearch as it's more flexible and simpler to write.
 The current implementation of Reframer is mostly useful while we still have iOS 5 support, as beyond that we should modify it for use with Autolayout.
 @todo Update once we drop support iOS 5, as we should use a similar DSL but autolayout-based.
 */
@interface Reframer : NSObject

/**
 Returns a new reframer object. You should pass the view to be reframed as the parameter.
 */
+ (instancetype)reframerWithView:(UIView*)viewToBeReframed;

/**
 Returns a new reframer object for the specified view.
 */
- (id)initWithView:(UIView*)viewToBeReframed;

/**
 Returns a new reframer object with the specified starting frame.
 Note that this reframer cannot be applied directly to a view.
 */
- (id)initWithFrame:(CGRect)baseFrame;

- (Reframer*)setX:(CGFloat)x;
- (Reframer*)setY:(CGFloat)y;
- (Reframer*)setOrigin:(CGPoint)origin;
- (Reframer*)setWidth:(CGFloat)width;
- (Reframer*)setHeight:(CGFloat)height;
- (Reframer*)setSize:(CGSize)size;
- (Reframer*)setFrame:(CGRect)frame;

- (Reframer*)offsetX:(CGFloat)x;
- (Reframer*)offsetY:(CGFloat)y;
- (Reframer*)offset:(CGPoint)offset;

- (Reframer*)insetWithEdgeInsets:(UIEdgeInsets)edgeInsets;

- (Reframer*)changeWidthBy:(CGFloat)widthChange;
- (Reframer*)changeHeightBy:(CGFloat)heightChange;
- (Reframer*)changeSizeBy:(CGSize)sizeChange;
- (Reframer*)squareUsingWidth;
- (Reframer*)squareUsingHeight;
- (Reframer*)makeSmallestSquare;
- (Reframer*)makeLargestSquare;

- (Reframer*)sizeToFit;
- (Reframer*)sizeToFitWidth;
- (Reframer*)sizeToFitHeight;
- (Reframer*)sizeToFitMaxWidth:(CGFloat)maximumWidth;
- (Reframer*)sizeToFitMaxHeight:(CGFloat)maximumHeight;
- (Reframer*)sizeToFitSize:(CGSize)size;

- (Reframer*)fillFrameHorizontally:(CGRect)frame;
- (Reframer*)fillFrameHorizontally:(CGRect)frame margin:(CGFloat)margin;
- (Reframer*)fillFrameVertically:(CGRect)frame;
- (Reframer*)fillFrameVertically:(CGRect)frame margin:(CGFloat)margin;

- (Reframer*)centerInFrame:(CGRect)frame;
- (Reframer*)centerInFrameHorizontally:(CGRect)frame;
- (Reframer*)centerInFrameVertically:(CGRect)frame;

- (Reframer*)alignToTopOfFrame:(CGRect)frame;
- (Reframer*)alignToLeftOfFrame:(CGRect)frame;
- (Reframer*)alignToBottomOfFrame:(CGRect)frame;
- (Reframer*)alignToRightOfFrame:(CGRect)frame;
- (Reframer*)alignToTopLeftOfFrame:(CGRect)frame;
- (Reframer*)alignToTopRightOfFrame:(CGRect)frame;
- (Reframer*)alignToBottomLeftOfFrame:(CGRect)frame;
- (Reframer*)alignToBottomRightOfFrame:(CGRect)frame;

- (Reframer*)alignToTopOfFrame:(CGRect)frame inset:(CGFloat)inset;
- (Reframer*)alignToLeftOfFrame:(CGRect)frame inset:(CGFloat)inset;
- (Reframer*)alignToBottomOfFrame:(CGRect)frame inset:(CGFloat)inset;
- (Reframer*)alignToRightOfFrame:(CGRect)frame inset:(CGFloat)inset;
- (Reframer*)alignToTopLeftOfFrame:(CGRect)frame insets:(CGSize)insets;
- (Reframer*)alignToTopRightOfFrame:(CGRect)frame insets:(CGSize)insets;
- (Reframer*)alignToBottomLeftOfFrame:(CGRect)frame insets:(CGSize)insets;
- (Reframer*)alignToBottomRightOfFrame:(CGRect)frame insets:(CGSize)insets;

- (Reframer*)placeOnTopOfFrame:(CGRect)frame;
- (Reframer*)placeOnLeftOfFrame:(CGRect)frame;
- (Reframer*)placeOnBottomOfFrame:(CGRect)frame;
- (Reframer*)placeOnRightOfFrame:(CGRect)frame;
- (Reframer*)placeOnTopOfFrame:(CGRect)frame padding:(CGFloat)padding;
- (Reframer*)placeOnLeftOfFrame:(CGRect)frame padding:(CGFloat)padding;
- (Reframer*)placeOnBottomOfFrame:(CGRect)frame padding:(CGFloat)padding;
- (Reframer*)placeOnRightOfFrame:(CGRect)frame padding:(CGFloat)padding;

/**
 Executes the supplied block, which should contain any of the Reframer DSL calls.
 This can help with code clarity where you want to have logic decide which reframer calls to make,
 e.g. you want to lay out a view to the left but only if another view is hidden, as the logic and layout for the view will
 be completely contained in the block.
 Note that you need to call @ref apply after this to see the changes made to the associated view.
 @see reframeAndApplyBlock:
 */
- (Reframer*)reframeWithBlock:(void(^)(Reframer* reframer))block;

/**
 Applies the frame changes to the receiver's associated UIView.
 Call this after making any frame changes you want through Reframer's interface.
 If this method is not called, frame changes will not affect the UIView and will be lost when the reframer instance goes out of scope.
 */
- (void)apply;

/**
 Equivalent to calling @ref reframeWithBlock: followed by @ref apply.
 */
- (void)reframeAndApplyBlock:(void(^)(Reframer* reframer))block;

/**
 Returns the currently accumulated frame without applying it to the associated view, if there is one.
 */
- (CGRect)extractFrame;

/**
 Accumulates and returns the frame resulting from executing the supplied block, which can contain any of the reframer DSL calls.
 The frame is not applied to the view.
 */
- (CGRect)extractFrameWithBlock:(void(^)(Reframer* reframer))block;

@end
