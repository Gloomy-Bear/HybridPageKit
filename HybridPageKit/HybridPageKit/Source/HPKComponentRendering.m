//
//  HPKComponentRendering.m
//  HybridPageKit
//
//  Created by dequanzhu.
//  Copyright © 2018 HybridPageKit. All rights reserved.
//

#import "HPKComponentRendering.h"

@interface HPKComponentRendering ()
@property(nonatomic,copy,readwrite)NSString *componentIndex;
@property(nonatomic,strong,readwrite)GRMustacheTemplate *template;
@end

@implementation HPKComponentRendering

- (void)setComponentIndex:(NSString *)index{
    _componentIndex = index;
}

- (NSString *)renderForMustacheTag:(GRMustacheTag *)tag
                           context:(GRMustacheContext *)context
                          HTMLSafe:(BOOL *)HTMLSafe
                             error:(NSError **)error{

   NSObject<RNSModelProtocol> * RNSObj = [context valueForMustacheKey:_componentIndex];
    
    if (!RNSObj) {
        return @"";
    }
    
    if (!_template) {
        _template = [GRMustacheTemplate templateFromString:@"<div class='HPK-Component-PlaceHolder' style='width:{{width}}px;height:{{height}}px' data-index='{{componentIndex}}'></div>" error:nil];
    }
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width - 16;
    CGFloat height = ceilf([RNSObj getComponentFrame].size.height/[RNSObj getComponentFrame].size.width * width);

    return [_template renderObject:@{@"componentIndex":[RNSObj getUniqueId],@"width":@(width),@"height":@(height)} error:nil] ;
}
@end
