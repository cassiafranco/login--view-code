//
//  NavViewProtocol.swift
//  PrimeiroAppViewCode
//
//  Created by cassia franco on 23/03/22.
//

import Foundation

protocol NavViewProtocol: class {
    func typeScreenMessage(type: TypeConversationOrContact)
}
enum TypeConversationOrContact{
    case conversation
    case contact
}
