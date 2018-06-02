//
//  TSZNewHandGuideView.h
//  TSZNewHandGuideDemo
//
//  Created by 涂世展 on 2018/6/2.
//  Copyright © 2018年 tushizhan. All rights reserved.
//

#import <UIKit/UIKit.h>

//配置用来判断是否显示新手引导页的全局变量
extern NSString *const whetherShowGuide;

@interface TSZNewHandGuideView : UIView

//最后一次点击的block
@property (nonatomic,copy) void (^isLastTapBlock)(void);


/**
 显示新手引导页的类方法

 @param imageName 新手引导页的图片
 @param imageCount 新手引导页的图片数量
 @return <#return value description#>
 */
+ (instancetype)whetherShowGuideViewWithImageName:(NSString *)imageName imageCount: (NSInteger)imageCount;


/**
 是否应该显示新手引导页的类方法

 @return 是否需要
 */
+ (BOOL)whetherShouldShowGuide;


@end
