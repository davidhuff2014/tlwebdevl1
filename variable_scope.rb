# encoding: UTF-8
count = 0

def over_under(count) # increments does not change
  p count + 1
  p count - 1
end

[1, 2, 3].each { |e|  count = e } # mutates the count

def add_one(count) # increments but does not change unless set
  count + 1
end
over_under(count)
p count
count = add_one(count) # sets the incremented variable
# p add_one(count) # does not mutate
p count
