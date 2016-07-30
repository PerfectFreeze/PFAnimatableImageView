//
//  PFAnimatableImageView.h
//  PFAnimatableImageView
//
//  Created by Cee on 29/07/2016.
//  Copyright © 2016 Cee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PFAnimatableImageView : UIImageView
@property (nonatomic, strong) UIImage *originalImage;
@property (nonatomic, strong) UIImage *originalHighlightedImage;
@property (nonatomic) UIViewContentMode contentMode;
@end
