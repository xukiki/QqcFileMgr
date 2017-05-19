//
//  QqcFileMgr.h
//  QqcBaseFramework
//
//  Created by qqc on 16/6/17.
//  Copyright © 2016年 Qqc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QqcSingletonTemplate.h"

@interface QqcFileMgr : NSObject

single_interface_qqc(QqcFileMgr)

#pragma mark - 文件操作相关
/**
 *  根据给定的路径创建文件
 *
 *  @param filePath 要创建的文件的路径
 *
 *  @return YES，成功；NO，失败
 */
- (BOOL)createFileWithPath:(NSString*)filePath;

/**
 *  根据给定的路径创建目录
 *
 *  @param filePath 要创建的目录的路径
 *
 *  @return YES，成功；NO，失败
 */
- (BOOL)createDirWithPath:(NSString*)dirPath;


/**
 *  根据给定的路径删除文件或目录
 *
 *  @param path 要删除的文件或目录的路径
 *
 *  @return YES，成功；NO，失败
 */
- (BOOL)removeFileOrDirWithPath:(NSString*)path;

/**
 *  文件或目录是否存在
 *
 *  @param path 文件或目录路径
 *
 *  @return YES，存在；NO，不存在
 */
- (BOOL)isFileOrDirExistWithPath:(NSString*)path;

/**
 *  是否是目录
 *
 *  @param path 文件或目录路径
 *
 *  @return YES，是目录；NO，不是目录
 */
- (BOOL)isDirWithPath:(NSString*)path;

#pragma mark - 沙盒目录获取相关
/**
 *  获取临时目录路径
 *
 *  @return 返回临时目录路径
 */
- (NSString *)tempPath;

/**
 *  获取文档路径
 *
 *  @return 返回文档目录路径
 */
- (NSString *)documentPath;

/**
 *  获取库路径
 *
 *  @return 返回库目录路径
 */
- (NSString *)libraryPath;

/**
 *  获取缓存路径
 *
 *  @return 返回缓存目录路径
 */
- (NSString *)cachePath;

/**
 *  获取webview访问资源的路径
 *
 *  @param strDocumentPath 沙盒目录路径
 *
 *  @return webview访问资源的路径
 */
- (NSString *)resourceFilePathWithDocumentPath:(NSString*)strDocumentPath;

#pragma iClound 备份相关
/**
 *  添加忽略iclound自动备份路径
 *
 *  @param URL 不被备份路径对应的URL
 *
 *  @return 是否添加成功
 */
+ (BOOL)addSkipBackupAttributeToItemAtURL:(NSURL *)URL;

/**
 *  设置iclound不自动备份Document
 */
+ (void)setiCloundNotBackDocument;


@end
