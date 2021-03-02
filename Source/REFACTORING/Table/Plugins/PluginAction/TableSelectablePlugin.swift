//
//  TableSelectablePlugin.swift
//  ReactiveDataDisplayManager
//
//  Created by Никита Коробейников on 28.01.2021.
//  Copyright © 2021 Александр Кравченков. All rights reserved.
//

/// Plugin to support `RDDMSelectableItem`
///
/// Handle `didSelect` event inside generator and `deselectRow`
public class TableSelectablePlugin: BaseTablePlugin<TableEvent> {

    // MARK: - BaseTablePlugin

    public override func process(event: TableEvent, with manager: BaseTableManager?) {
        switch event {
        case .didSelect(let indexPath):
            guard let selectable = manager?.generators[indexPath.section][indexPath.row] as? RDDMSelectableItem else {
                return
            }
            selectable.didSelectEvent.invoke(with: ())

            if selectable.isNeedDeselect {
                manager?.view?.deselectRow(at: indexPath, animated: true)
            }
        default:
            break
        }
    }

}

// MARK: - Public init

public extension BaseTablePlugin {

    /// Plugin to support `RDDMSelectableItem`
    ///
    /// Handle `didSelect` event inside generator and `deselectRow`
    static func selectable() -> TableSelectablePlugin {
        .init()
    }

}
