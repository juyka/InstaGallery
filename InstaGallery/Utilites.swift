//
//  Utilites.swift
//  InstaGallery
//
//  Created by Анастасия Васюра on 10/07/16.
//  Copyright © 2016 Анастасия Васюра. All rights reserved.
//

import Foundation

func onMain<A>(f: A -> ()) -> A -> () {
    return { x in
        dispatch_async(dispatch_get_main_queue()) {
            f(x)
        }
    }
}