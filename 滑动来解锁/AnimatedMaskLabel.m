//
//  AnimatedMaskLabel.m
//  滑动来解锁
//
//  Created by  wuhiwi on 2017/7/26.
//  Copyright © 2017年 huijiayou.com. All rights reserved.
//

#import "AnimatedMaskLabel.h"

@interface AnimatedMaskLabel ()

@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) CAGradientLayer *leftGradientLayer;
@property (nonatomic, strong) CAGradientLayer *rightGradientLayer;
@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation AnimatedMaskLabel


#pragma mark - init
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.bgView];
        
        self.clipsToBounds = YES;
        [self.bgView.layer addSublayer:self.rightGradientLayer];
        [self.bgView.layer addSublayer:self.leftGradientLayer];
        
        [self addSubview:self.titleLabel];
        
        [self addAnimation];
    }
    return self;
}

- (void)addAnimation
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.translation.x"];
    animation.beginTime = 1;
    animation.duration = 4;
    animation.repeatCount = MAXFLOAT;
    animation.fromValue = @(0);
    animation.toValue = @(self.bgView.frame.size.width + 90);
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = @[animation];
    group.repeatCount = MAXFLOAT;
    group.duration = 4;
    [self.bgView.layer addAnimation:group forKey:nil];
}

#pragma mark - getter

- (UIView *)bgView
{
    if (!_bgView) {
        _bgView = [[UIView alloc] initWithFrame:self.bounds];
        _bgView.backgroundColor = [UIColor clearColor];
    }
    return _bgView;
}

- (CAGradientLayer *)leftGradientLayer
{
    if (!_leftGradientLayer) {
        _leftGradientLayer = [CAGradientLayer layer];
        _leftGradientLayer.startPoint = CGPointMake(0, 0.5);
        _leftGradientLayer.endPoint = CGPointMake(1, 0.5);
        _leftGradientLayer.bounds = self.bgView.bounds;
        _leftGradientLayer.anchorPoint = CGPointMake(0, 0);
        _leftGradientLayer.position = CGPointMake(-self.bgView.bounds.size.width, 0);
        
        NSArray *colors = @[
                            (__bridge id)[UIColor blackColor].CGColor,
                            (__bridge id)[UIColor whiteColor].CGColor,
                            (__bridge id)[UIColor blackColor].CGColor
                            ];
        _leftGradientLayer.colors = colors;
        NSArray *locations = @[
                               @(0.10),
                               @(0.50),
                               @(0.90)
                               ];
        _leftGradientLayer.locations = locations;
    }
    return _leftGradientLayer;
}


- (CAGradientLayer *)rightGradientLayer
{
    if (!_rightGradientLayer) {
        _rightGradientLayer = [CAGradientLayer layer];
        _rightGradientLayer.startPoint = CGPointMake(0, 0.5);
        _rightGradientLayer.endPoint = CGPointMake(1, 0.5);
        _rightGradientLayer.bounds = self.bgView.bounds;
        _rightGradientLayer.anchorPoint = CGPointMake(0, 0);
        _rightGradientLayer.position = CGPointMake(0, 0);
        
        NSArray *colors = @[
                            (__bridge id)[UIColor blackColor].CGColor,
                            (__bridge id)[UIColor whiteColor].CGColor,
                            (__bridge id)[UIColor blackColor].CGColor
                            ];
        _rightGradientLayer.colors = colors;
        NSArray *locations = @[
                               @(0.10),
                               @(0.50),
                               @(0.90)
                               ];
        _rightGradientLayer.locations = locations;
    }
    return _rightGradientLayer;
}


- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.frame = self.bounds;
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.text = @"滑动解锁>>";
        _titleLabel.textColor = [UIColor whiteColor];
    }
    return _titleLabel;
}

@end
