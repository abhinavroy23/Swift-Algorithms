// Copyright 2020 Abhinav Roy, All rights reserved.

// Binary search Recursive - returns the index if found, -1 if not found
// Only appicable on 'sorted array'
// complexity - O(logn)
func binarySearchRecursive<T : Comparable>(arr : [T], startIndex : Int, endIndex : Int,elementToFind : T) -> Int{
    let mid : Int = (startIndex + endIndex)/2
    if arr[mid] == elementToFind{
        return mid
    }else if arr[mid] > elementToFind{
        return binarySearchRecursive(arr: arr, startIndex: startIndex, endIndex: mid, elementToFind: elementToFind)
    }else if arr[mid] < elementToFind{
        return binarySearchRecursive(arr: arr, startIndex: mid+1, endIndex: endIndex, elementToFind: elementToFind)
    }
    return -1
}

// Binary search Iterative - returns the index if found, -1 if not found
// Only appicable on 'sorted array'
// complexity - O(logn)
func binarySearchIterative<T : Comparable>(arr : [T], startIndex : Int, endIndex : Int,elementToFind : T) -> Int{
    var start : Int = startIndex
    var end : Int = endIndex
    
    while start < end {
        let mid : Int = (start + end)/2
        if arr[mid] == elementToFind{
            return mid
        }else if arr[mid] < elementToFind{
            start = mid+1
        }else if arr[mid] > elementToFind{
            end = mid
        }
    }
    return -1
}


// Test - Search
let binaryArr : [Int] = [1,2,3,4,5,6,7,8,9,10,11]
print(binarySearchRecursive(arr: binaryArr, startIndex: 0, endIndex: binaryArr.count-1, elementToFind: 6))
print(binarySearchIterative(arr: binaryArr, startIndex: 0, endIndex: binaryArr.count-1, elementToFind: 6))
