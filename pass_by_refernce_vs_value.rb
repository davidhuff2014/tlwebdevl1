# encoding: UTF-8
arr = [1, 2, 3, 4, 5, 6]
def mymethod(arr)
  arr.size # non-mutating
  arr.pop # mutating
end
p arr
p mymethod(arr)
p arr
