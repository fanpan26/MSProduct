//
//  MSPeople.h
//  MSProduct
//
//  Created by FanYuepan on 16/2/5.
//  Copyright © 2016年 Macrosage. All rights reserved.
//

#import "MSBaseUser.h"

/*
 AddTime: "2016-02-01T16:01:41.483"
 Company: null
 //CvNumber: 463229
 IsDoneReg: true
 //Name: "董燕丽"
 RowId: 1
 //headphotos: "http://img1.gurucv.com/image/2016/2/2/bf2609c43cb44e01bac828e82e0ddd72.jpg"
 position: null
 summary: null
 title2string: null
 title3string: "前端 软件园孵化器"
 titlestring: null
 */
@interface MSListUser : MSBaseUser

@property(nonatomic,assign) NSInteger rowid;
@property(nonatomic,copy) NSString *addtime;
@property(nonatomic,assign) BOOL isdonereg;
@property(nonatomic,copy) NSString *position;
@property(nonatomic,copy) NSString *company;
@property(nonatomic,copy) NSString *summary;
@property(nonatomic,copy) NSString *titlestring;
@property(nonatomic,copy) NSString *title2string;
@property(nonatomic,copy) NSString *title3string;


@end
