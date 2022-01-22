require_relative 'my_enumerables'

arr = [1, 2, 3, 4, 5, 6, 7, 8]
def test_all(arr)
    puts "Each Vs my_each"
    arr.each { |i| puts i}
    arr.my_each { |i| puts i}

    puts "\neach_with_index VS my_each_with_index"
    arr.each_with_index { |i, y| puts "item #{i}, index #{y}"}
    arr.my_each_with_index { |i, y| puts "item #{i}, index #{y}"}

    puts "\nselect VS my_select"
    arr.select { |i| i.even?}
    arr.my_select { |i| i.even?}

    puts "\nAll? VS my_all?"
    arr.all? { |i| i.even?}
    arr.my_all? { |i| i.even?}

    puts "\nAny? VS my_any?"
    arr.any? { |i| i.odd?}
    arr.my_any? { |i| i.odd?}

    puts "\nnone? VS my_none?"
    arr.none? { |i| i > 10}
    arr.my_none? { |i| i > 10}

    puts "\ncount VS my_count"
    arr.count { |i| i > 6}
    arr.my_count { |i| i > 6}

    puts "\nmap VS my_map"
    arr.map { |i| i * 3}
    arr.my_map { |i| i * 3}

    puts "\ninject VS my_inject"
    arr.inject { |i, n| i * n}
    arr.my_inject { |i, n| i * n}
end

def multiply_els(a)
    a.my_inject { |i, n| i * n}
end

test_all(arr)

multiply_els([2, 4, 5])