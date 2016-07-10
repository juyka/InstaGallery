//
//  JSON.swift
//  InstaGallery
//
//  Created by Анастасия Васюра on 10/07/16.
//  Copyright © 2016 Анастасия Васюра. All rights reserved.
//

import Foundation

enum JSON {
    
    case Object(AnyObject)
    case Error
    
    subscript(key: String) -> JSON {
        switch self {
        case .Object(let object as Dictionary<String, AnyObject>):
            return object[key].map{JSON.Object($0)} ?? .Error
        default:
            return .Error
        }
    }
    
    func inferType<A>() -> A? {
        switch self {
        case .Object(let object as A):
            return .Some(object)
        default:
            return .None
        }
    }
}