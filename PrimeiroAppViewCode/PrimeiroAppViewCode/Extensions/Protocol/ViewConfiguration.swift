//
//  ViewConfiguration.swift
//  PrimeiroAppViewCode
//
//  Created by cassia franco on 23/03/22.
//

import Foundation

protocol ViewConfiguration {
    func setupViews()
    func configViews()
    func buildViews()
    func setupConstraints()
}

extension ViewConfiguration {
    func setupViews() {
         configViews()
         buildViews()
         setupConstraints()
    }
}
