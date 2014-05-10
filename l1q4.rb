arr = [1, 2, 3, 4]
p arr.select { |v| v > 2.5 }
# returns data based upon criteria in the block
p arr.map { |v| v * 5}
# invokes the block as it iterates over every element