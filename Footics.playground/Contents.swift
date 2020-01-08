import UIKit
//
//var str = "Hello, playground"
//
//// 문제1
//
//var quanxs = ["Denma", "Lot", "Gongja", "Jiro", "Marbin"]
//for quanx in quanxs {
//    if quanx.count > 3 {
//        print(quanx)
//    }
//    if quanx.hasPrefix("D"){
//        print(quanx)
//    }
//}
//
//// 풀이
//
//quanxs.filter(){$0.count > 3}.map(){print($0)}

// 문제2

var fruits = ["Banana", "Apple", "Watermelon", "Grape", "Peach"]

for fruit in fruits{
    if fruit.count > 4 && fruit.hasSuffix("e")
    {
        print(fruit)
    }
}

// 풀이

fruits.filter(){$0.count > 4 && $0.hasSuffix("e")}.map(){print($0)}

// 문제 3

var score = [100, 87, 65, 94, 88, 41, 52]

var max = 0

for i in score{
    if i > max
    {
        max = i
        print(max)
    }
}

// 풀이


score.filter(){$0 > max}.map(){print($0)}




// 문제 4

var score2 = [37, 87, 65, 94, 88, 41, 52]

var min = 9999

for i in score2{
    if i < min
    {
        min = i
        print(min)
    }
}

// 문제 5

var iphones = ["iPhone 3GS", "iPhone X", "iPhone 8", "iPhone 11 Pro", "iPhone XR"]

for phone in iphones{
    if phone.count > 8{
        print(phone)
    }
}

//풀이

iphones.filter(){$0.count > 8}.map(){print($0)}

// 문제 6

var pixels = ["Pixel 3A XL", "Pixel 3A", "Pixel 3", "Pixel 3 XL", "Pixel 4"]

for pixel in pixels{
    if pixel.count > 7{
        print(pixel)
    }
}

// 풀이

pixels.filter(){$0.count > 7}.map(){print($0)}
