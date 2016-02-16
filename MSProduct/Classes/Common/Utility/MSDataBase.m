//
//  MSDataBase.m
//  MSProduct
//
//  Created by FanYuepan on 16/2/12.
//  Copyright © 2016年 Macrosage. All rights reserved.
//

#import "MSDataBase.h"
#import "MSDBField.h"
#import "FMDB.h"

@implementation MSDataBase

single_implementation(MSDataBase)

/*创建DB*/
-(FMDatabase *)createDB
{
    static FMDatabase *_db;
    if (_db) {
        return  _db;
    }
    NSString *dbPath = [self dbPath];
    FMDatabase *db = [FMDatabase databaseWithPath:dbPath];
    _db = db;
    return _db;
}

-(NSString *)dbPath
{
    static NSString *_path;
    if (_path) {
        return _path;
    }
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [paths objectAtIndex:0];
    NSString *dbPath = [documentDirectory stringByAppendingString:@"MSProduct.db"];
    _path = dbPath;
    NSLog(@"%@",_path);
    return  _path;
}

-(BOOL)createTable:(NSString *)tableName fields:(NSArray *)fields
{
    NSString *SQL = [self createTableSQL:tableName fields:fields];
   return [self excuteSQL:SQL];
}

-(BOOL)excuteSQL:(NSString *)SQL
{
    
    FMDatabase *db = [self createDB];
    if ([db open]) {
        return [db executeUpdate:SQL];
    }
    NSLog(@"db open failed");
    return  NO;
}

-(BOOL)deleteData:(NSString *)tableName where:(NSString *)where
{
    NSString *sql = [NSString stringWithFormat: @"DELETE FROM %@ ",tableName];
    if (where && where.length > 0) {
        sql = [sql stringByAppendingString:[NSString stringWithFormat:@"%@ WHERE %@",sql,where]];
    }
    return  [self excuteSQL:sql];
}

-(BOOL)existsData:(NSString *)SQL
{
    FMDatabase *db = [self createDB];
    if ([db open]) {
        FMResultSet *result = [db executeQuery:SQL];
        while ([result next]) {
            [db close];
            return YES;
        }
        return NO;
    }
    return NO;
}

-(FMResultSet *)queryData:(NSString *)SQL
{
    FMDatabase *db = [self createDB];
    if ([db open]) {
        FMResultSet *result = [db executeQuery:SQL];
        return  result;
    }
    return nil;
}

-(BOOL)closeDB
{
    NSLog(@"关闭DB");
    FMDatabase *db = [self createDB];
    return [db close];
}

#pragma mark 私有方法
-(NSString *)createTableSQL:(NSString *)tableName fields:(NSArray *)fields
{
    NSString *createTableSQL = @"CREATE TABLE IF NOT EXISTS %@ (%@)";//CREATE TABLE TABLENAME
    __block NSString *fieldsString = @"";
    NSString *fieldNameHasDou = @",%@ %@";
    NSString *fieldNameNoDou = @"%@ %@";
    [fields enumerateObjectsUsingBlock:^(MSDBField *field, NSUInteger idx, BOOL * _Nonnull stop) {
        
         fieldsString = [fieldsString stringByAppendingString:
         [NSString stringWithFormat:(idx == 0?fieldNameNoDou:fieldNameHasDou),
          field.fieldName,
          [self getStringWithType:field.type]]];
    }];
    createTableSQL = [NSString stringWithFormat:createTableSQL,tableName,fieldsString];
    NSLog(@"%@",createTableSQL);
    return createTableSQL;
}

-(NSString *)getStringWithType:(MSDBFieldType)type
{
    switch (type) {
        case MSDBFieldTypeText:
            return @"text";
            break;
        case MSDBFieldTypeBlob:
            return  @"blob";
        case MSDBFieldTypeInteger:
            return @"integer";
        default:
            break;
    }
}


@end
