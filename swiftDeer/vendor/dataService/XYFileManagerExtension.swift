//
//  XYFileManagerExtension.swift
//  swiftDeer
//
//  Created by coderxxy on 2025/9/21.
//

import Foundation

extension FileManager {
    // TODO: 获取documents 目录路径
    static var documentsDirectory: URL
    {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask);
        return paths[0];
    }
    static var documentDirectory: String
    {
        let docDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!;
        return docDirectory;
    }
    // TODO: 获取 library 目录路径
    static var libraryDirectory: URL
    {
        let paths = FileManager.default.urls(for: .libraryDirectory, in: .userDomainMask);
        return paths[0];
    }
    // TODO: 获取 Caches 目录路径
    static var cachesDirectory: URL
    {
        let paths = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask);
        return paths[0];
    }
    // TODO: 获取 Application Support 目录路径
    static var applicationSupportDirectory: URL
    {
        let paths = FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask);
        return paths[0];
    }
    // TODO: 获取 Temp 目录路径
//    static var tempDirectory: URL
//    {
//        let paths = FileManager.default.temporaryDirectory;
//    }
}
