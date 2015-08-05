//
//  ALAnnotationView.m
//  mapkitTest
//
//  Created by 罗骏彬 on 15/8/4.
//  Copyright (c) 2015年 罗骏彬. All rights reserved.
//

#import "ALAnnotationView.h"
#import "ALAnnotation.h"
@implementation ALAnnotationView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)setAnnotation:(ALAnnotation *)annotation{
    [super setAnnotation:annotation];
    UIImage *image = [UIImage imageNamed:annotation.imageName];
    self.image = image;
}
@end
