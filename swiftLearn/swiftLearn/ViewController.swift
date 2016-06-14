//
//  ViewController.swift
//  swiftLearn
//
//  Created by MAC on 16/6/14.
//  Copyright © 2016年 chenzuo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let label = "The width is"
        let width = 94
        let widthLabel = label + String(width)
        print( "宽度 " + widthLabel)
        
        let apple = 3
        let oranges = 5
        let appleSummary = "I have \(apple) apples."
        let orangeSummary = "I have \(oranges) oranges"
        
        print(appleSummary + "\n" + orangeSummary)
        
        
        var shoppingList = ["catfish","water","tulips","blue paint"]
        shoppingList[1] = "bottle of water"
        
        print(shoppingList)
        
        
        var occupations = [
        "Malcolm":"Captain",
        "Kaylee":"Mechanic",
        ]
        occupations["Jayne"] = "Public Relations"
        
        print(occupations)
        
        //()空初始化？
        let array = [String]()
        let dictionary = [String:Float]()
        
        print(array)
        print(dictionary)
        
        let numberList = [75,43,106,87,12]
        
        for score in  numberList{
            if score > 50{
                print(String(score) + ">50")
            }else{
                print(String(score) + "<＝50")
            }
        }
        
        
        var optionalString:String? = "hello"
        print(optionalString == nil)
        
        var optionaName:String? = "John Appleseed"
        var greeting = "Hello!"
        if let name = optionaName {
            greeting = "Hello, \(name)"
        }
        print(greeting)
        
        let nickName: String? = nil
        let fullName: String = "John Appleseed"
        let informalGreeting = "Hi \(nickName ?? fullName)"
        
        print(informalGreeting)
        
        let vegetable = "red peper"
        switch vegetable {
        case "celery":
            print("is celery")
        case "cucumber","watercress":
            print( "is cucumber or watercress")
        case let x where x.hasSuffix("peper"):
            print("Is it a spicy \(x)?")
        default:
            print("everything tastes good in soup")
            
        }
        
        var total = 0
        
        for i in 0...100 {
            total += i
        }
        print(total)
        
        print( greet("bob", day: "tuesday"))
        
        let statistics = calculateStatustics([5,3,100,3,9])
        print(statistics.sum)
        print(statistics.1)
        
        
        print(sumOf(42,58,69))
        print(returnFifteen())
        
        var increment = makeIncrementer()
        print(increment(7))
        
        var numbers = [20, 19, 7, 12]
        
        if hasAnyMatches(numbers, condition: lessThanTen) {
            print(lessThanTen)
            print(numbers)
        }
        
        numbers.map { (number: Int) -> Int in
            let result = 3 * number
            return result
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func greet(name: String, day: String) -> String {
        return "hello, \(name),today is \(day)"
    }
    func calculateStatustics(scores: [Int]) -> (min:Int,max:Int,sum:Int) {
        var min = scores[0]
        var max = scores[0]
        var sum = 0
        
        for score in scores {
            if score > max {
                max = score
            }else if score < min{
                min = score
            }
            sum += score
        }
        return (min, max ,sum)
    }
    
    func sumOf(numbers: Int...) -> Int {
        var sum = 0
        for number in numbers {
            sum += number
        }
        return sum
    }
    
    func returnFifteen() -> Int {
        var y = 10
        func add() {
            y += 5
        }
        add()
        return y
    }
    
    func makeIncrementer() -> (Int -> Int) {
        func addOne(number:Int) -> Int {
            return 1 + number
        }
        return addOne
    }
    
    func hasAnyMatches(list: [Int], condition: Int -> Bool) -> Bool {
        for item in list {
            if condition(item) {
                return true
            }
        }
        return false
    }
    
    func lessThanTen(number: Int) -> Bool {
        return number < 10
    }
    
}

