//
//  Car.swift
//  CarCustomiser
//
//  Created by Ralph Matta on 12/01/2024.
//

import Foundation

struct Car {
    let make: String
    let model: String
    var topSpeed: Int
    var acceleration: Double
    var handling: Int
    
    func displayStats() -> String {
        
        let string = """
                        Make: \(self.make)\n
                        Model: \(self.model)\n
                        Top Speed: \(self.topSpeed)mph \n
                        Acceleration (0-60): \(self.acceleration)s \n
                        Handling: \(self.handling)
                        """
        
        return string
        
    }
}
