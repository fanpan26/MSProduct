//
//  MSDataBase.h
//  MSProduct
//
//  Created by FanYuepan on 16/2/12.
//  Copyright © 2016年 Macrosage. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MSSingleton.h"


@class  FMDatabase;
@class FMResultSet;
@interface MSDataBase : NSObject

single_interface(MSDataBase);

/*创建数据库*/
-(FMDatabase *)createDB;

//-(NSString *)createTableSQL:(NSString *)tableName fields:(NSArray *)fields;

-(BOOL)createTable:(NSString *)tableName fields:(NSArray *)fields;

-(BOOL)excuteSQL:(NSString *)SQL;

/*删除某条数据*/
-(BOOL)deleteData:(NSString *)tableName where:(NSString *) where;

/*查询是否存在记录*/

-(BOOL)existsData:(NSString *)SQL;

-(FMResultSet *)queryData:(NSString *)SQL;

-(BOOL) closeDB;
@end
