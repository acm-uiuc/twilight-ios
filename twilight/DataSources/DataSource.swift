//
//  DataSource.swift
//  twilight
//
//  Created by Rauhul Varma on 11/13/17.
//  Copyright © 2017 acm. All rights reserved.
//

import Foundation

//enum DataSourceError: Error {
//    case indexOutOfBounds(reason: String)
//}
//
//protocol DataSource {
//    associatedtype Model
//
//    var delegate: DataSourceDelegate? { get set }
//
//    var data: [[Model]] { get set }
//    var sectionInfo: [DataSourceSectionInfo] { get set }
//
//    func insertItem(_ item: Model, at indexPath: IndexPath)
//    func moveItem(from fromIndexPath: IndexPath, to toIndexPath: IndexPath)
//    func deleteItemAt(_ indexPath: IndexPath)
//    func updateItem(_ item: Model, at indexPath: IndexPath)
//
//    func modelForItemAt(_ indexPath: IndexPath) throws -> Model
//    func infoForSectionAt(_ section: IndexPath) throws -> DataSourceSectionInfo
//
//    func deleteAll()
//    func loadData()
//    func reloadData()
//}
//
//
//extension DataSource {
//
//    mutating func insertItem(_ item: Model, at indexPath: IndexPath) throws {
//        guard indexPath.section >= 0 else {
//            throw DataSourceError.indexOutOfBounds(reason: "`indexPath.section` must be greater than or equal to `0`.")
//        }
//
//        guard indexPath.item >= 0 else {
//            throw DataSourceError.indexOutOfBounds(reason: "`indexPath.item` must be greater than or equal to `0`.")
//        }
//
//        delegate?.dataSourceWillChangeContent(self)
//
//        let sectionInfo: DataSourceSectionInfo
//        if indexPath.section >= data.count {
//            sectionInfo = DataSourceSectionInfo()
//            data.insert([], at: indexPath.section)
//        }
//
//
//
//
//        delegate?.dataSource(self, didChange: <#T##DataSourceSectionInfo#>, atSectionIndex: <#T##Int#>, for: <#T##DataSourceChange#>)
//        let newSectionInfo = DataSourceSectionInfo()
//        newSectionInfo.numberOfObjects = 1
//        newSectionInfo.objects = data[section]
//
//        delegate?.dataSourceDidChangeContent(self)
//    }
//
//    func moveItem(from fromIndexPath: IndexPath, to toIndexPath: IndexPath) {
//
//    }
//
//    func deleteItemAt(_ indexPath: IndexPath) {
//
//    }
//
//    func updateItem(_ item: Model, at indexPath: IndexPath) {
//
//    }
//
//    func modelForItemAt(_ indexPath: IndexPath) throws -> Model {
//        guard indexPath.section >= 0 else {
//            throw DataSourceError.indexOutOfBounds(reason: "`indexPath.section` must be greater than or equal to `0`.")
//        }
//
//        guard indexPath.item >= 0 else {
//            throw DataSourceError.indexOutOfBounds(reason: "`indexPath.item` must be greater than or equal to `0`.")
//        }
//
//        guard indexPath.section < data.count else {
//            throw DataSourceError.indexOutOfBounds(reason: "`indexPath.section` must be less than than `data.count`.")
//        }
//
//        guard indexPath.section > 0 else {
//            throw DataSourceError.indexOutOfBounds(reason: "`indexPath.section` must be greater than `data[indexPath.section].count`.")
//        }
//
//        return data[indexPath.section][indexPath.item]
//    }
//
//    func infoForSectionAt(_ section: Int) throws -> DataSourceSectionInfo {
//        guard section >= 0 else {
//            throw DataSourceError.indexOutOfBounds(reason: "`section` must be greater than or equal to `0`.")
//        }
//
//        guard section < data.count else {
//            throw DataSourceError.indexOutOfBounds(reason: "`section` must be less than than `data.count`.")
//        }
//
//        return sectionInfo[section]
//    }
//
//}
//
//
//protocol DataSourceDelegate {
//    /// Notifies the receiver that the fetched results controller is about to start processing of one or more changes due to an add, remove, move, or update.
//    func dataSourceWillChangeContent<T: DataSource>(_ dataSource: T)
//
//    /// Notifies the receiver that a fetched object has been changed due to an add, remove, move, or update.
//    func dataSource<T: DataSource>(_ dataSource: T, didChange anObject: Any, at indexPath: IndexPath?, for type: DataSourceChange, newIndexPath: IndexPath?)
//
//    /// Notifies the receiver of the addition or removal of a section.
//    func dataSource<T: DataSource>(_ dataSource: T, didChange sectionInfo: DataSourceSectionInfo, atSectionIndex sectionIndex: Int, for type: DataSourceChange)
//
//    /// Notifies the receiver that the fetched results controller has completed processing of one or more changes due to an add, remove, move, or update.
//    func dataSourceDidChangeContent<T: DataSource>(_ dataSource: T)
//}
//
//
//enum DataSourceChange {
//    case insert
//    case move
//    case delete
//    case update
//}
//
//
//class DataSourceSectionInfo {
//    // MARK: Accessing Objects
//
//    // The number of objects (rows) in the section.
//    var numberOfObjects: Int = 0
//
//    // The array of objects in the section.
//    var objects: [Any]?
//
//    // MARK: Accessing the Name and Title
//    // The name of the section.
//    var name: String = ""
//
//    // The index title of the section.
//    var indexTitle: String?
//}

