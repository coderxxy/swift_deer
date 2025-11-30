//
//  XYGRDBBaseService.swift
//  swiftDeer
//
//  Created by coderxxy on 2025/9/21.
//

import Foundation
import GRDB

class XYGRDBBaseService: NSObject {
    private let dbName: String = "xy_deerDb.sqlite";
    private let fileManager = FileManager.default;
    private var databaseQueue: DatabaseQueue?;
    //
    private override init() {
        super.init();
    }
    // TODO: dbpath
    func dbPath() -> String {
        // 获取数据库路径
        let dbPath = (FileManager.documentDirectory as NSString).appendingPathComponent(self.dbName);
        return dbPath;
    }
    // TODO: 判断数据库是否存在
//    func openDB(dbName :String) throws -> DatabaseQueue{
    func dbQueue() throws -> DatabaseQueue {
        // 获取数据库路径
        let dbPath = self.dbPath();
        // 检查路径是否存在
        let fileManager = FileManager.default;
        // 检查目录是否存在，不存在则创建
        if !fileManager.fileExists(atPath: dbPath) {
            try fileManager.createDirectory(atPath: dbPath, withIntermediateDirectories: true, attributes: nil)
            XYCommonService.XYDLog("数据库目录已创建:"+dbPath);
        }
        XYCommonService.XYDLog("数据库目录:"+dbPath);
        // 检查数据库文件是否存在
        let dbExists = fileManager.fileExists(atPath: dbPath)
        XYCommonService.XYDLog("数据库文件是否存在: \(dbExists)");
        // 创建或打开数据库
        let dbQueue = try DatabaseQueue(path: dbPath);
        if !dbExists {
            // 创建新的数据库文件
            // 在这里执行建表等初始化操作
        }
        else{
            // 打开已存在的数据库
        }
        return dbQueue;
    }
    
    func dbIsExists() -> Bool {
        return true;
    }
    
    // 初始化数据库表结构
    
    
    // 查
    // 增
    // 删
    // 改
}
