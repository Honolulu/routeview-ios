#import "JMTabView.h"

@interface NavigationTabItem : JMTabItem

@property (nonatomic,retain) UIImage * alternateIcon;

+ (NavigationTabItem *)tabItemWithTitle:(NSString *)title icon:(UIImage *)icon alternateIcon:(UIImage *)icon executeBlock:(JMTabExecutionBlock)executeBlock;

@end
