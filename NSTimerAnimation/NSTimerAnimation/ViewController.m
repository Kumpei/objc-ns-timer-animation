//
//  ViewController.m
//  NSTimerAnimation
//
//  Created by 廣川政樹 on 2013/04/11.
//  Copyright (c) 2013年 Dolice. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
  //アニメーションさせるラベル初期化
  [self initLabel];
  //アニメーション設定
  [self setAnimationSettings];
  //タイマー定義
  [self setTimer];
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
}

//ラベル初期化
- (void)initLabel
{
  //ラベルを生成
  self.labelWidth = 128;
  self.labelHeight = 32;
  self.myLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.labelWidth, self.labelHeight)];
  self.myLabel.text = @"Animation";
  [self.view addSubview:self.myLabel];
}

//アニメーション設定
- (void)setAnimationSettings
{
  //ラベルのアニメーションスピード
  self.animationSpeedX = 2;
  self.animationSpeedY = 1;
}

//タイマー定義
- (void)setTimer
{
  //0.01秒毎に moveLabelセレクタを呼ぶ
  [NSTimer
   scheduledTimerWithTimeInterval:0.01
   target:self
   selector:@selector(moveLabel:)
   userInfo:nil
   repeats:YES];
}

//ラベルをアニメーションさせるセレクタ
- (void)moveLabel:(NSTimer *)timer {
  float posX = self.myLabel.center.x;
  float posY = self.myLabel.center.y;
  //ラベルを移動させる
  posX += self.animationSpeedX;
  posY += self.animationSpeedY;
  //端までアニメーションしたか判定
  if ([self isLimitLabelX:posX]) posX = 0;
  if ([self isLimitLabelY:posY]) posY = 0;
  //座標反映
  self.myLabel.center = CGPointMake(posX, posY);
}

//横方向の端まで行ったか判定
- (BOOL)isLimitLabelX:(int)posX
{
  return (self.view.frame.size.width + self.labelWidth < posX);
}

//縦方向の端まで行ったか判定
- (BOOL)isLimitLabelY:(int)posY
{
  return (self.view.frame.size.height + self.labelHeight < posY);
}

@end
