import UIKit

func quickSort(_ arr : inout [Int],_ low : Int,_ high : Int) -> [Int]{
    if low < high{
        let pi = partition(&arr, low, high)
        quickSort(&arr, low, pi-1)
        quickSort(&arr, pi+1, high)
    }
    return arr
}

func partition(_ arr : inout [Int],_ low : Int,_ high : Int) -> Int{
    let pivot = arr[high]
    var i = low-1 // current index of smaller element
    for j in low..<high{
        if arr[j] < pivot{
            i = i+1
            
            //swap
            let temp = arr[j]
            arr[j] = arr[i]
            arr[i] = temp
        }
    }
    let temp = arr[high]
    arr[high] = arr[i+1]
    arr[i+1] = temp
    
    return i+1
}

var arr = [5,3,1,4,2,6]
print(quickSort(&arr, 0, arr.count-1))

