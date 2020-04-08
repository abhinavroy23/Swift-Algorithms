import Foundation

// Given a string, find the length of longest substring without repeating characters
// Sample inputs
// in - "abcdabc", op - 4 (abcd)
// in - "abcdabcdef", op - 6 (abcdef)
// in - "abcad", op - 4 (bcad)
// in - "abbcdb", op - 3 (bcd)
// in - "", op - 0
// in - " ", op - 1
// in - "aaaa", op - 1 (a)

print("NAIVE approach with Complexity O(n^3)")
// Complexity - O(n^3)
func getLengthOfLongestSubstringNaiveApproach(_ input : String) -> Int{
    var arr : [Character] = Array(input)
    guard arr.count > 0 else {
        return 0
    }
    
    var maxCount = 1
    
    for i in 0..<arr.count{ // O(n)
        for j in i..<arr.count{ // O(n-1)
            let newArr : [Character] = Array(arr[i...j]) // O(n) in worst case
            if maxCount < newArr.count && Set.init(newArr).count == newArr.count{
                maxCount = newArr.count
            }
        }
    }
    
    return maxCount
}

print("abcdabc = \(getLengthOfLongestSubstringNaiveApproach("abcdabc"))")
print("abcdabcdef = \(getLengthOfLongestSubstringNaiveApproach("abcdabcdef"))")
print("abcad = \(getLengthOfLongestSubstringNaiveApproach("abcad"))")
print("abbcdb = \(getLengthOfLongestSubstringNaiveApproach("abbcdb"))")
print(" = \(getLengthOfLongestSubstringNaiveApproach(""))")
print("  = \(getLengthOfLongestSubstringNaiveApproach(" "))")
print("aaaa = \(getLengthOfLongestSubstringNaiveApproach("aaaa"))")

print("OPTIMISED approach with Complexity O(n) with extra size")
// Complexity - O(n) with extra space for a 256 size array and 3 variables
func getLengthOfLongestSubstring(_ input : String) -> Int{
    var arr : [Character] = Array(input)
    guard arr.count > 0 else {
        return 0
    }
    func getAscii(_ char : Character) -> Int{
        if let val = char.unicodeScalars.first?.value{
            return Int(val)
        }
        return 0
    }
    
    /* Initialize the visited array as -1, -1 is used to indicate that character has not been visited yet. */
    var visited : [Int] = [Int].init(repeating: -1, count: 256)
    var prev_index : Int = 0
    var max_length : Int = 1
    var curr_length : Int = 1
    
    /* Mark first character as visited by storing the index of first character in visited array. */
    visited[getAscii(arr[0])] = 0
    
    /* Start from the second character. First character is already processed (cur_length and max_length are initialized as 1, and visited[str[0]] is set */
    for i in 1..<arr.count{
        prev_index = visited[getAscii(arr[i])]
        
        /* If the current character is not present in the already processed substring or it is not part of the current Non repeating character substring (NRCS), then do cur_length++ */
        if prev_index == -1 || i - curr_length > prev_index{
            curr_length = curr_length + 1
            
        /* If the current character is present in currently considered NRCS, then update NRCS to start from the next character of the previous instance. */
        }else{
            /* Also, when we are changing the NRCS, we should also check whether length of the previous NRCS was greater than max_len or not.*/
            if curr_length > max_length{
                max_length = curr_length
            }
            curr_length = i - prev_index
        }
         /* update the index of current character */
        visited[getAscii(arr[i])] = i
    }
    /* Compare the length of last NRCS with max_len and update max_length if needed */
    if curr_length > max_length{
        max_length = curr_length
    }
    return max_length
}

print("abcdabc = \(getLengthOfLongestSubstring("abcdabc"))")
print("abcdabcdef = \(getLengthOfLongestSubstring("abcdabcdef"))")
print("abcad = \(getLengthOfLongestSubstring("abcad"))")
print("abbcdb = \(getLengthOfLongestSubstring("abbcdb"))")
print(" = \(getLengthOfLongestSubstring(""))")
print("  = \(getLengthOfLongestSubstring(" "))")
print("aaaa = \(getLengthOfLongestSubstring("aaaa"))")
