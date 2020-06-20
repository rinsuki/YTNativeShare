@interface YTIShareTargetServiceUpdateRenderer
- (int)serviceId;
@end

@interface YTShareTargetCell: UIView
- (void)didTap;
@end

@interface YTShareRequestViewController: UIViewController
@end

%hook YTShareTargetCell

- (void)drawRect:(CGRect)rect {
	%orig;
	NSLog(@"!!!draw");
	UIView* superview = self.superview;
	NSLog(@"!!!%@", superview);
	if ([superview isKindOfClass: [UICollectionView class]]) {
		UICollectionView* collectionView = (UICollectionView*)superview;
		[collectionView setContentOffset: CGPointMake([collectionView contentSize].width - collectionView.frame.size.width, 0) animated: NO];
	}
}

- (void)setEntry:(YTIShareTargetServiceUpdateRenderer*)entry {
	%orig;
	NSLog(@"!!!%d", [entry serviceId]);
	if ([entry serviceId] != 82) {
		return;
	}
	[self didTap];
}

%end

%hook YTShareRequestViewController

- (void)viewDidLoad {
	[self.view setAlpha: 0.1];
}

%end