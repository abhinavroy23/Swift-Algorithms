// Copyright 2020 Abhinav Roy, All rights reserved.

// Insertion sort - sorts an array
// complexity - O(n^2)
func insertionSort<T : Comparable>(arr : inout [T]) -> [T]{
    for i in 1..<arr.count{
        let temp : T = arr[i]
        var j = i-1
        while j >= 0 && arr[j] > temp{
            arr[j+1] = arr[j]
            j=j-1
        }
        arr[j+1] = temp
    }
    return arr
}

// Test - Sort
var unsortedArr : [Int] = [4,3,2,10,12,1,5,6]
print("Insertion Sort -> \(insertionSort(arr: &unsortedArr))")
