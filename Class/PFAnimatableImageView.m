//
//  PFAnimatableImageView.m
//  PFAnimatableImageView
//
//  Created by Cee on 29/07/2016.
//  Copyright © 2016 Cee. All rights reserved.
//

#import "PFAnimatableImageView.h"

@interface PFAnimatableImageView ()
@property (nonatomic, strong) UIImageView *imageView;
@end

@implementation PFAnimatableImageView

#pragma mark - Initialization

- (id)init {
    self = [super initWithImage:nil highlightedImage:nil];
    if (self) {
        [self setup];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (id)initWithImage:(UIImage *)image {
    self = [super initWithImage:image];
    if (self) {
        [self setup];
    }
    return self;
}

- (id)initWithImage:(UIImage *)image highlightedImage:(UIImage *)highlightedImage {
    self = [super initWithImage:image highlightedImage:highlightedImage];
    if (self) {
        [self setup];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setup];
    }
    return self;
}

#pragma mark - Private Methods

- (void)setup {
    [self addSubview:self.imageView];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self layoutImageView];
}

#pragma mark - Getters & Setters

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
    }
    return _imageView;
}

- (UIImage *)originalImage {
    return self.imageView.image;
}

- (UIImage *)originalHighlightedImage {
    return self.imageView.highlightedImage;
}

- (void)setImage:(UIImage *)image {
    self.imageView.image = image;
}

- (void)setHighlightedImage:(UIImage *)highlightedImage {
    self.imageView.highlightedImage = highlightedImage;
}

- (void)setContentMode:(UIViewContentMode)contentMode {
    _contentMode = contentMode;
    [self layoutImageView];
}

#pragma mark - LayoutImageView

- (void)layoutImageView {
    UIImage *image = self.imageView.image;
    if (!image) return;
    switch (_contentMode) {
        case UIViewContentModeScaleToFill:
            [self layoutFill];
            break;
        case UIViewContentModeScaleAspectFit:
            [self layoutAspectFit];
            break;
        case UIViewContentModeScaleAspectFill:
            [self layoutAspectFill];
            break;
        case UIViewContentModeRedraw:
            break;
        case UIViewContentModeCenter:
            [self layoutCenter];
            break;
        case UIViewContentModeTop:
            [self layoutTop];
            break;
        case UIViewContentModeBottom:
            [self layoutBottom];
            break;
        case UIViewContentModeLeft:
            [self layoutLeft];
            break;
        case UIViewContentModeRight:
            [self layoutRight];
            break;
        case UIViewContentModeTopLeft:
            [self layoutTopLeft];
            break;
        case UIViewContentModeTopRight:
            [self layoutTopRight];
            break;
        case UIViewContentModeBottomLeft:
            [self layoutBottomLeft];
            break;
        case UIViewContentModeBottomRight:
            [self layoutBottomRight];
            break;
    }
}

#pragma mark - Helpers

- (CGFloat)imageToBoundsWidthRatio:(UIImage *)image {
    return image.size.width / self.bounds.size.width;
}

- (CGFloat)imageToBoundsHeightRatio:(UIImage *)image {
    return image.size.height / self.bounds.size.height;
}

- (void)centerImageViewToPoint:(CGPoint)point {
    self.imageView.center = point;
}

- (void)imageViewBoundsToImageSize {
    [self imageViewBoundsToSize:self.imageView.image.size];
}

- (void)imageViewBoundsToSize:(CGSize)size {
    self.imageView.frame = CGRectMake(0, 0, size.width, size.height);
}

- (void)centerImageView {
    self.imageView.center = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2);
}

#pragma mark - Layouts

- (void)layoutAspectFit {
    CGFloat widthRatio = [self imageToBoundsWidthRatio:self.imageView.image];
    CGFloat heightRatio = [self imageToBoundsHeightRatio:self.imageView.image];
    [self imageViewBoundsToSize:CGSizeMake(self.imageView.image.size.width / MAX(widthRatio, heightRatio), self.imageView.image.size.height / MAX(widthRatio, heightRatio))];
    [self centerImageView];
}

- (void)layoutAspectFill {
    CGFloat widthRatio = [self imageToBoundsWidthRatio:self.imageView.image];
    CGFloat heightRatio = [self imageToBoundsHeightRatio:self.imageView.image];
    [self imageViewBoundsToSize:CGSizeMake(self.imageView.image.size.width / MIN(widthRatio, heightRatio), self.imageView.image.size.height / MIN(widthRatio, heightRatio))];
    [self centerImageView];
}

- (void)layoutFill {
    [self imageViewBoundsToSize:CGSizeMake(self.bounds.size.width, self.bounds.size.height)];
}

- (void)layoutCenter {
    [self imageViewBoundsToImageSize];
    [self centerImageView];
}

- (void)layoutTop {
    [self imageViewBoundsToImageSize];
    [self centerImageViewToPoint:CGPointMake(self.bounds.size.width / 2, self.imageView.image.size.height / 2)];
}

- (void)layoutBottom {
    [self imageViewBoundsToImageSize];
    [self centerImageViewToPoint:CGPointMake(self.bounds.size.width / 2, self.bounds.size.height - self.imageView.image.size.height / 2)];
}

- (void)layoutLeft {
    [self imageViewBoundsToImageSize];
    [self centerImageViewToPoint:CGPointMake(self.imageView.image.size.width / 2, self.bounds.size.height / 2)];
}

- (void)layoutRight {
    [self imageViewBoundsToImageSize];
    [self centerImageViewToPoint:CGPointMake(self.bounds.size.width - self.imageView.image.size.width / 2, self.bounds.size.height / 2)];
}

- (void)layoutTopLeft {
    [self imageViewBoundsToImageSize];
    [self centerImageViewToPoint:CGPointMake(self.imageView.image.size.width / 2, self.imageView.image.size.height / 2)];
}

- (void)layoutTopRight {
    [self imageViewBoundsToImageSize];
    [self centerImageViewToPoint:CGPointMake(self.bounds.size.width - self.imageView.image.size.width / 2, self.imageView.image.size.height / 2)];
}

- (void)layoutBottomLeft {
    [self imageViewBoundsToImageSize];
    [self centerImageViewToPoint:CGPointMake(self.imageView.image.size.width / 2, self.bounds.size.height - self.imageView.image.size.height / 2)];
}

- (void)layoutBottomRight {
    [self imageViewBoundsToImageSize];
    [self centerImageViewToPoint:CGPointMake(self.bounds.size.width - self.imageView.image.size.width / 2, self.bounds.size.height - self.imageView.image.size.height / 2)];
}

@end
