//
//  CollectionFooterGenerator.swift
//  ReactiveDataDisplayManager
//
//  Created by Никита Коробейников on 18.06.2021.
//

import UIKit

/// Protocol that incapsulated type of Footer
public protocol CollectionFooterGenerator: AnyObject {

    var identifier: UICollectionReusableView.Type { get }

    func generate(collectionView: UICollectionView, for indexPath: IndexPath) -> UICollectionReusableView

    func registerFooter(in collectionView: UICollectionView)

    func size(_ collectionView: UICollectionView, forSection section: Int) -> CGSize

    /// Method for SPM support
    ///
    /// If you use SPM return Bundle.module
    static func bundle() -> Bundle?
}

// MARK: - Defaults

public extension CollectionFooterGenerator {

    static func bundle() -> Bundle? {
        return nil
    }

}

// MARK: - ViewBuilder

public extension CollectionFooterGenerator where Self: ViewBuilder {
    func generate(collectionView: UICollectionView, for indexPath: IndexPath) -> UICollectionReusableView {
        guard let footer = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter,
                                                                           withReuseIdentifier: self.identifier.nameOfClass,
                                                                           for: indexPath) as? Self.ViewType else {
            return UICollectionReusableView()
        }

        self.build(view: footer)

        return footer as? UICollectionReusableView ?? UICollectionReusableView()
    }

    func registerFooter(in collectionView: UICollectionView) {
        collectionView.registerNib(self.identifier, kind: UICollectionView.elementKindSectionFooter, bundle: Self.bundle())
    }
}