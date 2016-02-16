//
//  PPDBManager.h
//  PPoint_iOS
//
//  Created by 范月成 on 16/1/25.
//  Copyright © 2016年 kginc. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "FMDB.h"

@interface MSDBManager : NSObject

@property (nonatomic, retain, readonly) FMDatabaseQueue *dbQueue;

+ (MSDBManager *)shareInstance;

+ (NSString *)dbPath;

- (BOOL)changeDBWithDirectoryName:(NSString *)directoryName;

@end