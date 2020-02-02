// Copyright 2020 Abhinav Roy, All rights reserved.


// Linear search - returns the index if found, -1 if not found
// applicable on sorted/unsorted array
// complexity - O(n)
func linearSearch<T : Comparable>(arr : [T], elementToFind : T) -> Int{
    for i in 0..<arr.count{
        if elementToFind == arr[i]{
            return i
        }
    }
    return -1
}

// Test - Search
let linearArr : [Int] = [1,4,6,2,7,8,36,7,8]
print(linearSearch(arr: linearArr, elementToFind: 7))
