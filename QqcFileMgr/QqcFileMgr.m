//
//  QqcFileMgr.m
//  QqcBaseFramework
//
//  Created by qqc on 16/6/17.
//  Copyright © 2016年 Qqc. All rights reserved.
//

#import "QqcFileMgr.h"

@implementation QqcFileMgr

single_implementation_qqc(QqcFileMgr)

#pragma mark - 文件操作相关
- (BOOL)createFileWithPath:(NSString*)filePath
{
    BOOL bRet = YES;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if (![fileManager fileExistsAtPath:filePath]) {
        
        bRet = [fileManager createFileAtPath:filePath contents:nil attributes:nil];
    }
    
    return bRet;
}

- (BOOL)createDirWithPath:(NSString*)dirPath
{
    BOOL bRet = YES;
    NSError *error = nil;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    bRet = [fileManager createDirectoryAtPath:dirPath withIntermediateDirectories:YES
                                               attributes:nil error:&error];
    if (error) {
        bRet = NO;
        NSLog(@"创建图片路径:%@失败, \nerror = %@", dirPath, error);
    }
    
    return bRet;
}

- (BOOL)removeFileOrDirWithPath:(NSString*)path
{
    BOOL bRet = YES;
    NSError *error = nil;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    bRet =[fileManager removeItemAtPath:path error:&error];
    
    if (error) {
        bRet = NO;
        NSLog(@"删除:%@失败, \nerror = %@", path, error);
    }
    
    return bRet;
}


- (BOOL)isFileOrDirExistWithPath:(NSString*)path
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    return [fileManager fileExistsAtPath:path];
}

- (BOOL)isDirWithPath:(NSString*)path
{
    BOOL bRet = YES;
    BOOL isDir = YES;
    BOOL isDirExist = YES;
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    isDirExist = [fileManager fileExistsAtPath:path isDirectory:&isDir];
    
    if( ! (isDirExist && isDir) ){
        bRet = NO;
    }
    
    return bRet;
}

#pragma mark - 目录操作
- (NSString *)tempPath
{
    return NSTemporaryDirectory();
}

- (NSString *)documentPath
{
    static NSString *documentPath;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    });
    
    return documentPath;
}

- (NSString *)libraryPath
{
    static NSString *libraryPath;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        libraryPath = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    });
    
    return libraryPath;
}

- (NSString *)cachePath
{
    static NSString *cachePath;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    });
    
    return cachePath;
}

- (NSString *)resourceFilePathWithDocumentPath:(NSString*)strDocumentPath;
{
    NSString *fileFullPath = strDocumentPath;
    fileFullPath = [fileFullPath stringByReplacingOccurrencesOfString:@"/" withString:@"//"];
    fileFullPath = [fileFullPath stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
    fileFullPath = [NSString stringWithFormat:@"file:/%@",fileFullPath];
    
    return fileFullPath;
}

+ (BOOL)addSkipBackupAttributeToItemAtURL:(NSURL *)URL
{
    assert([[NSFileManager defaultManager] fileExistsAtPath: [URL path]]);
    
    NSError *error = nil;
    BOOL success = [URL setResourceValue: [NSNumber numberWithBool: YES]
                                  forKey: NSURLIsExcludedFromBackupKey error: &error];
    if(!success)
    {
        NSLog(@"Error excluding %@ from backup %@", [URL lastPathComponent], error);
    }
    
    return success;
}

+ (void)setiCloundNotBackDocument
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *folderPath = [documentsDirectory stringByAppendingPathComponent:@""];
    [self addSkipBackupAttributeToItemAtURL:[NSURL fileURLWithPath:folderPath]];
}


@end
