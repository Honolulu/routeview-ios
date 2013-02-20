//  Created by Jason Morrissey

#import "NavigationSelectionView.h"
#import "UIView+InnerShadow.h"
#import "UIColor+Hex.h"

#define kTriangleHeight 8.

@implementation NavigationSelectionView

- (void)drawRect:(CGRect)rect
{
    [[UIColor colorWithHex:0x252525] set];
    CGRect squareRect = CGRectOffset(rect, 0, kTriangleHeight);
    squareRect.size.height -= kTriangleHeight;
    UIBezierPath * squarePath = [UIBezierPath bezierPathWithRoundedRect:squareRect cornerRadius:4.];
    [squarePath fill];
    
    UIBezierPath *trianglePath = [UIBezierPath bezierPath];
    [trianglePath moveToPoint:CGPointMake(rect.size.width / 2 - kTriangleHeight, kTriangleHeight)];
    [trianglePath addLineToPoint:CGPointMake(rect.size.width / 2, 0.)];
    [trianglePath addLineToPoint:CGPointMake(rect.size.width / 2 + kTriangleHeight, kTriangleHeight)];
    [trianglePath closePath];
    [trianglePath fill];
}

+ (NavigationSelectionView *) createSelectionView;
{
    NavigationSelectionView * selectionView = [[NavigationSelectionView alloc] initWithFrame:CGRectZero];
    return selectionView;
}

@end
