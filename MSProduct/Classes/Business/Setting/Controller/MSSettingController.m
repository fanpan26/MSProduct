//
//  MSSettingController.m
//  MSProduct
//
//  Created by FanYuepan on 16/2/4.
//  Copyright © 2016年 Macrosage. All rights reserved.
//

#import "MSSettingController.h"
#import "MSPhotoView.h"

@implementation MSSettingController

-(void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"设置";
    [self testPhotoView];
}

-(void)testPhotoView
{
    //http://img1.gurucv.com/image/2016/1/31/dea89edec0ba465d9fb10ecf6503c472.jpg
    NSString *imgUrl = @"http://img1.gurucv.com/image/2016/1/31/dea89edec0ba465d9fb10ecf6503c472.jpg";
    MSPhotoView *photoView = [[MSPhotoView alloc] initWithPhoto:imgUrl];
    photoView.frame = CGRectMake(10, 100, 0, 0);
    [self.view addSubview:photoView];
    
    MSPhotoView *photoView1 = [[MSPhotoView alloc] initWithPhoto:imgUrl];
    photoView1.frame = CGRectMake(10, 200, 0, 0);
    photoView1.photoType = MSPhotoViewTypeRound;
    [self.view addSubview:photoView1];
    
    MSPhotoView *photoView2 = [[MSPhotoView alloc] initWithPhoto:imgUrl];
    photoView2.frame = CGRectMake(10, 300, 0, 0);
    photoView2.photoType = MSPhotoViewTypeSquareRectRound;
    [self.view addSubview:photoView2];

    
    MSPhotoView *photoView3 = [[MSPhotoView alloc] initWithPhoto:imgUrl size:MSPhotoViewSizeBig];
    photoView3.frame = CGRectMake(10, 400, 0, 0);
    photoView3.photoType = MSPhotoViewTypeRoundWhite;
    [self.view addSubview:photoView3];

    
}


@end
