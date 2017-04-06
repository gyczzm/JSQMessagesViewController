//
//  Created by Jesse Squires
//  http://www.jessesquires.com
//
//
//  Documentation
//  http://cocoadocs.org/docsets/JSQMessagesViewController
//
//
//  GitHub
//  https://github.com/jessesquires/JSQMessagesViewController
//
//
//  License
//  Copyright (c) 2014 Jesse Squires
//  Released under an MIT license: http://opensource.org/licenses/MIT
//

#import "JSQMessagesCollectionViewCellOutgoing.h"

@implementation JSQMessagesCollectionViewCellOutgoing

#pragma mark - Overrides

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.messageBubbleTopLabel.textAlignment = NSTextAlignmentRight;
    self.cellBottomLabel.textAlignment = NSTextAlignmentRight;
}

#pragma mark - KVO

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"alpha"]) {
        if (self.messageBubbleContainerView.alpha != 0.0) {
            return;
        }
        
        self.messageBubbleImageView.transform = CGAffineTransformMakeScale(0.0, 0.0);
        self.textView.alpha = 0.0;
        
        [UIView animateWithDuration:0.3 delay:0.5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            self.messageBubbleContainerView.alpha = 1.0;
            self.messageBubbleImageView.transform = CGAffineTransformIdentity;
        } completion:nil];
        
        [UIView animateWithDuration:0.2 delay:0.8 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            self.textView.alpha = 1.0;
            self.accessoryButton.alpha = 1.0;
        } completion:nil];
    }
}

@end
