//
//  popFrame.h
//  ChatDemo
//
//  Created by 周传祥 on 2018/11/15.
//  Copyright © 2018 zcx. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol clickDelegate <NSObject>

-(void)clickedWithButton:(UIButton*)sender;

@end

@interface PopFrame : UIView
@property NSArray *img;
@property NSArray *name;
@property id<clickDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
