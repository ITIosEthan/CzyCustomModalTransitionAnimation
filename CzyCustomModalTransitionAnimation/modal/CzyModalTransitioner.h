//
//  CzyModalTransitioner.h
//  CzyCustomModalTransitionAnimation
//
//  Created by macOfEthan on 17/8/4.
//  Copyright © 2017年 macOfEthan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, CzyModalTransitionStyle) {

    CzyModalTransitionStylePresent,
    CzyModalTransitionStyleDismiss
};

@interface CzyModalTransitioner : NSObject<UIViewControllerAnimatedTransitioning>

//返回一个遵守UIViewControllerAnimatedTransitioning协议的id对象
+ (instancetype)initWithModalTransitionType:(CzyModalTransitionStyle)type;

- (instancetype)initWithModalTransitionType:(CzyModalTransitionStyle)type;

@end
