//: [Previous](@previous)

import Foundation

var mySet : Set = [1,2,3,4,5]

print(mySet)


var myStringSet : Set = ["a","b","c","a"]

print(myStringSet)

var myArray = [1,2,3,1,2,5,6]
var mySetList = Set(myArray)
print(myArray)
print(mySetList)


var unionSet1: Set = [1,2,3]
var unionSet2: Set = [3,4,5]

var myUnion = unionSet1.union(unionSet2)
print(myUnion)
    
