//
//  DragAndDroppablePlugin.swift
//  ReactiveDataDisplayManager
//
//  Created by Anton Eysner on 18.02.2021.
//  Copyright © 2021 Александр Кравченков. All rights reserved.
//

import UIKit
import Foundation

/// Plugin to move cells
///
/// Allow moving cells builded with `MovableItem` generators
@available(iOS 11.0, *)
open class TableDragAndDroppablePlugin: TableFeaturePlugin, DragAndDroppable {

    // MARK: - Typealias

    public typealias Provider = TableGeneratorsProvider

    // MARK: - Properties

    open var draggableDelegate = DraggablePluginDelegate<Provider>()
    open var droppableDelegate = DroppablePluginDelegate<Provider, UITableViewDropCoordinator>()

}

// MARK: - Public init

public extension TableFeaturePlugin {

    /// Plugin to move cells
    ///
    /// Allow moving cells builded with `MovableItem` generators
    @available(iOS 11.0, *)
    static func dragAndDroppable() -> TableDragAndDroppablePlugin {
        .init()
    }

}

/// Plugin to move cells
///
/// Allow moving cells builded with `MovableItem` generators
@available(iOS 11.0, *)
open class CollectionDragAndDroppablePlugin: CollectionFeaturePlugin, DragAndDroppable {

    // MARK: - Typealias

    public typealias Provider = CollectionGeneratorsProvider

    // MARK: - Properties

    open var draggableDelegate = DraggablePluginDelegate<Provider>()
    open var droppableDelegate = DroppablePluginDelegate<Provider, UICollectionViewDropCoordinator>()

}

public extension CollectionFeaturePlugin {

    /// Plugin to move cells
    ///
    /// Allow moving cells builded with `MovableItem` generators
    @available(iOS 11.0, *)
    static func dragAndDroppable() -> CollectionDragAndDroppablePlugin {
        .init()
    }

}
