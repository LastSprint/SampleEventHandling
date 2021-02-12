//
//  TableSwipeActionsConfigurable.swift
//  ReactiveDataDisplayManager
//
//  Created by Anton Eysner on 12.02.2021.
//  Copyright © 2021 Александр Кравченков. All rights reserved.
//

@available(iOS 11.0, *)
public protocol SwipeableItem {
    var actionTypes: [String] { get set }
    var didSwipeEvent: BaseEvent<String> { get }
}

@available(iOS 11.0, *)
public protocol TableSwipeActionsProvider {
    var isEnableSwipeActions: Bool { get set }

    func getLeadingSwipeActionsForGenerator(_ generator: SwipeableItem) -> TableSwipeActionsConfiguration?
    func getTrailingSwipeActionsForGenerator(_ generator: SwipeableItem) -> TableSwipeActionsConfiguration?
}

@available(iOS 11.0, *)
public protocol TableSwipeActionsConfigurable: FeaturePlugin {
    func leadingSwipeActionsConfigurationForRow(at indexPath: IndexPath, with manager: BaseTableManager?) -> UISwipeActionsConfiguration?
    func trailingSwipeActionsConfigurationForRow(at indexPath: IndexPath, with manager: BaseTableManager?) -> UISwipeActionsConfiguration?
}