//
//  CollectionDataSource.swift
//  ReactiveDataDisplayManager
//
//  Created by Никита Коробейников on 12.02.2021.
//  Copyright © 2021 Александр Кравченков. All rights reserved.
//

import UIKit

public protocol CollectionDataSource: UICollectionViewDataSource, UICollectionViewDataSourcePrefetching {
    var provider: CollectionGeneratorsProvider? { get set }
    var prefetchPlugins: PluginCollection< BaseCollectionPlugin <PrefetchEvent>> { get set }
    var collectionPlugins: PluginCollection< BaseCollectionPlugin <CollectionEvent>> { get set }
}