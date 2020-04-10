import UIKit

func merge(_ arr : inout [Int], _ low : Int,_ mid : Int, _ high : Int){
    //ceate two temp arrays for merging
    var first : [Int] = [Int]()
    var second : [Int] = [Int]()
    
    //calculate size of first and second array
    var n1 = mid - low + 1
    var n2 = high - mid
    
    print("low = \(low), mid = \(mid), high = \(high), n1 = \(n1) & n2 = \(n2)")
    
    //fill first array
    for i in 0..<n1{
        first.append(arr[low + i])
    }
    
    //fill second array
    for i in 0..<n2{
        second.append(arr[mid + 1 + i])
    }
    
    print("first = \(first)")
    print("second = \(second)")
    
    
    var i = 0 //initial index of first array
    var j = 0 //initial index of second array
    var k = low //corresponding index of original array
    
    while i < n1 && j < n2{
        
        if first[i] <= second[j]{
            arr[k] = first[i]
            i = i + 1
        }else{
            arr[k] = second[j]
            j = j + 1
        }
        k = k + 1
    }
    
    // copy remaining elements from n1
    while i < n1{
        arr[k] = first[i]
        i = i + 1
        k = k + 1
    }
    
    while j < n2{
        arr[k] = second[j]
        j = j + 1
        k = k + 1
    }
    
}

func mergeSort(_ arr : inout [Int], _ low : Int,_ high : Int) -> [Int]{
    if low < high{
        let mid : Int = (low + high)/2
        mergeSort(&arr, low, mid)
        mergeSort(&arr, mid+1, high)
        merge(&arr, low, mid, high)
    }
    return arr
}

var arr = [5,4,2,1,3]
print(mergeSort(&arr, 0, arr.count-1))
