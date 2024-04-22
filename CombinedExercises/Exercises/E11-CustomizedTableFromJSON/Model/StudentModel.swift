//
//  StudentModel.swift
//  CombinedExercises
//
//  Created by Jay Bhensdadia on 16/04/24.
//

import Foundation

class StudentModel : NSObject {
    var name : String!
    var dob:String!
    var department : String!
    var img: String?
    
    
    
    init(fromDictionary dictionary : [String : Any]){
        name = dictionary["name"] as? String
        dob = dictionary["dob"] as? String
        department = dictionary["department"] as? String
        if let tempImg: String = dictionary["img"] as? String {
            img = tempImg
        }
    }
    
    
    
}
