//
//  MGRandomAudioPlayer.h
//  25-随机声音
//
//  Created by 王俨 on 2018/1/23.
//  Copyright © 2018年 https://github.com/wangyansnow. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MGRandomAudioPlayer : NSObject

+ (instancetype)play:(NSInteger)countTimes finished:(void(^)())finished;

@end
