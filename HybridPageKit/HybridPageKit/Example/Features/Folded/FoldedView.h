//
//  FoldedView.h
//  HybridPageKit
//
//  Created by dequanzhu.
//  Copyright © 2018 HybridPageKit. All rights reserved.
//

typedef void (^FoldedViewClickBlock)(CGFloat height);

@class FoldedModel;

#define kFoldedViewFoldedHeight 150.f
#define kFoldedViewExpendHeight 300.f

@interface FoldedView : UIView
-(void)layoutWithData:(FoldedModel *)foldedModel
           clickBlock:(FoldedViewClickBlock)clickBlock;
@end
