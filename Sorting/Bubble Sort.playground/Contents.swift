// Copyright 2020 Abhinav Roy, All rights reserved.

// Bubble sort - sorts an array
// complexity - O(n^2)
func bubbleSort<T : Comparable>(arr : inout [T]) -> [T]{
    var swapCount : Int = 0
    repeat{
        swapCount = 0
        for i in 0..<arr.count-1{
            if arr[i] > arr[i+1]{
                let temp = arr[i]
                arr[i] = arr[i+1]
                arr[i+1] = temp
                swapCount = swapCount + 1
            }
        }
    }while swapCount > 0
    return arr
}

// Test - Sort
var unsortedArr2 : [Int] = [64,25,12,22,11]
print("Selection Sort -> \(bubbleSort(arr: &unsortedArr2))")
