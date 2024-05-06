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
    
    var studentId: Int?
    var gender: String?
    var semOneGrade: Double?
    var semTwoGrade: Double?
    var semThreeGrade:Double?
    var semFourGrade: Double?
    var semFiveGrade: Double?
    var semSixGrade: Double?
    var address: String?
    var sportsName: String?
    
    
    
    init(fromDictionary dictionary : [String : Any]){
        name = dictionary["name"] as? String
        dob = dictionary["dob"] as? String
        department = dictionary["department"] as? String
        if let tempImg: String = dictionary["img"] as? String {
            img = tempImg
        }
        
        if let id: Int = dictionary["studentId"] as? Int {
            studentId = id
        }
        
        
        if let genderStr: String = dictionary["gender"] as? String {
            gender = genderStr
        }
        
        
        if let grade: Double = dictionary["semOneGrade"] as? Double {
            semOneGrade = grade
        }
        
        if let grade: Double = dictionary["semTwoGrade"] as? Double {
            semTwoGrade = grade
        }
        if let grade: Double = dictionary["semThreeGrade"] as? Double {
            semThreeGrade = grade
        }
        if let grade: Double = dictionary["semFourGrade"] as? Double {
            semFourGrade = grade
        }
        
        if let grade: Double = dictionary["semFiveGrade"] as? Double {
            semFiveGrade = grade
        }
        
        if let grade: Double = dictionary["semSixGrade"] as? Double {
            semSixGrade = grade
        }
        
        if let addressStr: String = dictionary["address"] as? String {
            address = addressStr
        }
        if let sport: String = dictionary["sportsName"] as? String {
            sportsName = sport
        }
        
    }
    
    
    
}
