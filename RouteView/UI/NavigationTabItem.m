#import "NavigationTabItem.h"

#define kTabDemoVerticalItemPaddingSize CGSizeMake(18., 5.)
#define kTabDemoVerticalItemFont [UIFont boldSystemFontOfSize:11.]

@implementation NavigationTabItem

@synthesize alternateIcon = alternateIcon_;

- (CGSize) sizeThatFits:(CGSize)size;
{
  CGSize titleSize = [self.title sizeWithFont:kTabDemoVerticalItemFont];
  
  CGFloat titleWidth = titleSize.width;
  
  CGFloat iconWidth = [self.icon size].width;
  
  CGFloat width = (iconWidth > titleWidth) ? iconWidth : titleWidth;
  
  width += (kTabDemoVerticalItemPaddingSize.width * 2);
  
  CGFloat height = 56.;
  
  return CGSizeMake(width, height);
}

- (void)drawRect:(CGRect)rect;
{
  CGRect bounds = rect;
  CGFloat yOffset = kTabDemoVerticalItemPaddingSize.height + 10.;
  
  UIImage * iconImage = (self.highlighted || [self isSelectedTabItem]) ? self.alternateIcon : self.icon;
  
  // calculate icon position
  CGFloat iconWidth = [iconImage size].width;
  CGFloat iconMarginWidth = (bounds.size.width - iconWidth) / 2;
  
  [iconImage drawAtPoint:CGPointMake(iconMarginWidth, yOffset)];
  
  // calculate title position
  CGFloat titleWidth = [self.title sizeWithFont:kTabDemoVerticalItemFont].width;
  CGFloat titleMarginWidth = (bounds.size.width - titleWidth) / 2;
  
  UIColor * textColor = self.highlighted ? [UIColor lightGrayColor] : [UIColor whiteColor];
  [textColor set];
  [self.title drawAtPoint:CGPointMake(titleMarginWidth, yOffset + 22.) withFont:kTabDemoVerticalItemFont];
}

+ (NavigationTabItem *)tabItemWithTitle:(NSString *)title icon:(UIImage *)icon alternateIcon:(UIImage *)alternativeIcon executeBlock:(JMTabExecutionBlock)executeBlock; {
  NavigationTabItem * tabItem = [[NavigationTabItem alloc] initWithTitle:title icon:icon];
  tabItem.alternateIcon = alternativeIcon;
  tabItem.executeBlock = executeBlock;
  return tabItem;
}

@end
