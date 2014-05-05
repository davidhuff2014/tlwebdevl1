# encoding: UTF-8
count = 0

def over_under(count)
  p count + 1
  p count - 1
end

[1, 2, 3].each { |e|  count = e }

def add_one(count)
  count + 1
end
over_under(count)
p count
count = add_one(count)
mynum.add_one(count)
p count
