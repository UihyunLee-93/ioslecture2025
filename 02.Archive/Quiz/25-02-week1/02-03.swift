import Foundation

let MAX = 21

var prev = 0
var cur = 1
var next = 1
var total = 0
var output = "\(cur)"

total += cur

while true {
    next = prev + cur
    if next > MAX { break }
    
    output += " + \(next)"
    total += next

    prev = cur
    cur = next
}

print("일반 피보나치 수열")
print("\(output) = \(total)\n")

prev = 0
cur = 1
next = 1
total = 0
output = "\(cur)"
var flag = false  

total += cur

while true {
    next = prev + cur
    if next > MAX { break }

    let sign = flag ? "-" : "+"
    output += " \(sign) \(next)"
    total += flag ? -next : next

    prev = cur
    cur = next
    flag.toggle()
}

print("반전된 피보나치 수열")
print("\(output) = \(total)")
