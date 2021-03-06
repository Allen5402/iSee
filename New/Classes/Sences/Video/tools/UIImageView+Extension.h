

#import <UIKit/UIKit.h>

@interface UIImageView (Extension)

-(void)TT_setImageWithURL:(NSURL *)url;

-(void)TT_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder completed:(void (^)(UIImage *image, NSError *error))complete;

- (void)TT_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(NSInteger)options progress:(void (^)(NSInteger receivedSize, NSInteger expectedSize))progressBlock completed:(void (^)(UIImage *image, NSError *error))complete;

- (void)TT_setImageAfterClickWithURL:(NSURL *)url;


@end
