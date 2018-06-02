//
//  TSZNewHandGuideView.m
//  TSZNewHandGuideDemo
//
//  Created by 涂世展 on 2018/6/2.
//  Copyright © 2018年 tushizhan. All rights reserved.
//

#import "TSZNewHandGuideView.h"
#import "AppDelegate.h"

//是否显示新手引导页的标识
NSString *const whetherShowGuide = @"whetherShowGuide";

@interface TSZNewHandGuideView ()<
UIGestureRecognizerDelegate
>

@property (nonatomic ,copy) NSString *imageName;

@property (nonatomic ,assign) NSInteger imageCount;

@end

@implementation TSZNewHandGuideView


/**
 designated initializer

 @param imageName <#imageName description#>
 @param imageCount <#imageCount description#>
 @return <#return value description#>
 */
- (instancetype)initWithImageName: (NSString *)imageName imageCount: (NSInteger)imageCount{
    
    self = [super init];
    if (self) {
        _imageName = imageName;
        _imageCount = imageCount;
        [self setupUI];
    }
    return self;
}
/**
 secondary initializer
 
 @param imageName <#imageName description#>
 @param imageCount <#imageCount description#>
 @return <#return value description#>
 */
+ (instancetype)whetherShowGuideViewWithImageName:(NSString *)imageName imageCount:(NSInteger)imageCount{
    
    return [[self alloc] initWithImageName:imageName imageCount:imageCount];
    
}

/**
 设置UI
 */
- (void)setupUI{
    self.backgroundColor = [UIColor clearColor];
    self.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    if (_imageCount) {
        for (NSInteger i = 0; i < _imageCount; i ++) {
            NSString *imgName = [NSString stringWithFormat:@"%@_%ld",_imageName,i + 1];
            UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imgName]];
            imgView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
            imgView.userInteractionEnabled = YES;
            imgView.tag = 100 + i;
            UITapGestureRecognizer *t = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imgViewtap:)];
            [imgView addGestureRecognizer:t];
            [self addSubview:imgView];
            
        }
    }
    [self show];
}

- (void)imgViewtap:(UITapGestureRecognizer *)t{
    //将imgView依次移除
    UIImageView *imgView = (UIImageView *)t.view;
    [imgView removeFromSuperview];
    
    //MARK:此处可以根据需求来判断值做事情
    //最后一张图片
    if (imgView.tag - 100 == 0) {
        if (self.isLastTapBlock) {
            self.isLastTapBlock();
        }
        [self hide];
    }
}

- (void)show{
    
    [UIApplication sharedApplication].statusBarHidden = NO;
    AppDelegate *appdelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [appdelegate.window addSubview:self];
    
}

- (void)hide{
    
    [UIApplication sharedApplication].statusBarHidden = NO;
    [self removeFromSuperview];
    
}

+ (BOOL)whetherShouldShowGuide{
    
    NSNumber *number = [[NSUserDefaults standardUserDefaults] objectForKey:whetherShowGuide];
    if ([number isEqual:@10000]) {
        return NO;
    }else{
        [[NSUserDefaults standardUserDefaults] setObject:@10000  forKey:whetherShowGuide];
        [[NSUserDefaults standardUserDefaults] synchronize];
        return YES;
    }
}
@end
