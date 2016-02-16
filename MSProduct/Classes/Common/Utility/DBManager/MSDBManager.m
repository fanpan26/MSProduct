//
//  PPDBManager.m
//  PPoint_iOS
//
//  Created by 范月成 on 16/1/25.
//  Copyright © 2016年 kginc. All rights reserved.
//



#import <objc/runtime.h>

#import "MSDBManager.h"
#import "MSDBModel.h"

@interface MSDBManager ()

@property (nonatomic, retain) FMDatabaseQueue *dbQueue;

@end

@implementation MSDBManager

static MSDBManager *_instance = nil;

+ (instancetype)shareInstance {
    static dispatch_once_t onceToken ;
    dispatch_once(&onceToken, ^{
        _instance = [[super allocWithZone:NULL] init] ;
    }) ;
    
    return _instance;
}

+ (NSString *)dbPathWithDirectoryName:(NSString *)directoryName {
    NSString *docsdir = [NSSearchPathForDirectoriesInDomains( NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSFileManager *fileManage = [NSFileManager defaultManager];
    if (directoryName == nil || directoryName.length == 0) {
        docsdir = [docsdir stringByAppendingPathComponent:@"MSDB"];
    } else {
        docsdir = [docsdir stringByAppendingPathComponent:directoryName];
    }
    BOOL isDir;
    BOOL exit =[fileManage fileExistsAtPath:docsdir isDirectory:&isDir];
    if (!exit || !isDir) {
        [fileManage createDirectoryAtPath:docsdir withIntermediateDirectories:YES attributes:nil error:nil];
    }
    NSString *dbpath = [docsdir stringByAppendingPathComponent:@"MSDB_Tables.sqllite"];
    NSLog(@"%@",dbpath);
    return dbpath;
}

+ (NSString *)dbPath {
    return [self dbPathWithDirectoryName:nil];
}

- (FMDatabaseQueue *)dbQueue {
    if (_dbQueue == nil) {
        _dbQueue = [[FMDatabaseQueue alloc] initWithPath:[self.class dbPath]];
    }
    return _dbQueue;
}

- (BOOL)changeDBWithDirectoryName:(NSString *)directoryName {
    if (_instance.dbQueue) {
        _instance.dbQueue = nil;
    }
    _instance.dbQueue = [[FMDatabaseQueue alloc] initWithPath:[MSDBManager dbPathWithDirectoryName:directoryName]];
    
    int numClasses;
    Class *classes = NULL;
    numClasses = objc_getClassList(NULL,0);
    
    if (numClasses > 0 ) {
        classes = (__unsafe_unretained Class *)malloc(sizeof(Class) * numClasses);
        numClasses = objc_getClassList(classes, numClasses);
        for (int i = 0; i < numClasses; i++) {
            if (class_getSuperclass(classes[i]) == [MSDBModel class]){
                id class = classes[i];
                [class performSelector:@selector(createTable) withObject:nil];
            }
        }
        free(classes);
    }
    
    return YES;
}

+ (id)allocWithZone:(struct _NSZone *)zone {
    return [MSDBManager shareInstance];
}

- (id)copyWithZone:(struct _NSZone *)zone {
    return [MSDBManager shareInstance];
}

#if ! __has_feature(objc_arc)
- (oneway void)release {
    
}

- (id)autorelease {
    return _instance;
}

- (NSUInteger)retainCount {
    return 1;
}
#endif

@end
