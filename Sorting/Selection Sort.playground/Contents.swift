// Copyright 2020 Abhinav Roy, All rights reserved.

// Selection sort - sorts an array
// complexity - O(n^2)
func selectionSort<T : Comparable>(arr : inout [T]) -> [T]{
    for i in 0..<arr.count{
        var min : T = 10000000 as! T
        var minIndex : Int = 0
        for j in i..<arr.count{
            if arr[j] < min{
                min = arr[j]
                minIndex = j
            }
        }
        let temp = arr[minIndex]
        arr[minIndex] = arr[i]
        arr[i] = temp
    }
    return arr
}

// Test - Sort
var unsortedArr1 : [Int] = [64,25,12,22,11]
print("Selection Sort -> \(selectionSort(arr: &unsortedArr1))")
