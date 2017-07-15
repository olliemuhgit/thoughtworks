//
//  OllieServiceConsumerDelegate.swift
//  thoughtworksInterview
//
//  Created by Andrew Oliver on 7/15/17.
//  Copyright © 2017 Andrew Oliver. All rights reserved.
//

import Foundation

protocol OllieServiceConsumerDelegate {
    func haveJsonPayload(payload : Any, serviceCalled : String)
}
