def bubble_sort(list)
    len = list.length-1
    shifted = false
    for i in 0..len-1
      shifted = false
      for j in i..len
        
        if list[i] > list[j]
          shifted = true
          k = list[j]
          list[j] = list[i]
          list[i] = k  
          
        end
      end
      unless shifted
        break
      end
  
    end
    p  list
  end
  bubble_sort([4,3,78,2,0,2])
  bubble_sort([1,2,3,4,5,6,7,8,9])
  bubble_sort([9,8,7,6,5,4,3,2,1])