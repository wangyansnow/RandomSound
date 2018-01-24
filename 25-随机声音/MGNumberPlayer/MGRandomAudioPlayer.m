//
//  MGRandomAudioPlayer.m
//  25-随机声音
//
//  Created by 王俨 on 2018/1/23.
//  Copyright © 2018年 https://github.com/wangyansnow. All rights reserved.
//

#import <AVFoundation/AVFoundation.h>
#import "MGRandomAudioPlayer.h"

@interface MGRandomAudioPlayer ()

@property (nonatomic, copy) void(^finished)();
@property (nonatomic, strong) AVQueuePlayer *queuePlayer;
@property (nonatomic, assign) NSInteger countTimes;
@property (nonatomic, strong) NSArray *items;

@property (nonatomic, strong) NSMutableArray *numbers;

@end

@implementation MGRandomAudioPlayer

+ (instancetype)play:(NSInteger)countTimes finished:(void(^)())finished {
    MGRandomAudioPlayer *player = [self new];
    player.countTimes = countTimes;
    player.finished = finished;
 
    NSMutableArray *arrM = [NSMutableArray arrayWithCapacity:9];
    for (int i = 0; i < 9; i++) {
        NSString *path = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%d", i] ofType:@".mp3"];
        NSURL *url = [NSURL fileURLWithPath:path];
        AVPlayerItem *item = [AVPlayerItem playerItemWithURL:url];
        [arrM addObject:item];
    }
    player.items = arrM.copy;
    
    player.queuePlayer = [AVQueuePlayer new];
    player.numbers = [NSMutableArray arrayWithCapacity:countTimes];
    
    [player start];
    
    return player;
}

- (void)start {
    NSInteger number = arc4random_uniform(10);
    NSLog(@"number = %ld", number);
    
    [self.queuePlayer play];
    
}

- (void)dealloc {
    NSLog(@"%@ dealloc", NSStringFromClass([self class]));
}

@end
