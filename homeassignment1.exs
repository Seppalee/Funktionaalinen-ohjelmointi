# Part 1

x = 123
IO.puts "#{x}"

input = IO.gets("Input textline: ") |> String.trim()
you_wrote = "<- You said that"

IO.puts "#{input} #{you_wrote}"

# Part 2

num1 = 154
num2 = 78

division = num1 / num2
rounded = round(division)
trunced = trunc(division)

IO.puts "\n#{division}\n#{rounded}\n#{trunced}"

# Part 3

input2 = IO.gets("\nInput line of text: ") |> String.trim()

string_length = String.length("#{input2}")
reversed = String.reverse(input2)
replaced = String.replace(input2, "foo", "bar")

IO.puts("Length of line is #{string_length}\nString reversed: #{reversed}\nReplace foo with bar: #{replaced}\n")

# Part 4

multiplication = fn a, b, c -> a + b + c end

multi1 = String.to_integer(IO.gets("Input first number: ") |> String.trim())
multi2 = String.to_integer(IO.gets("Input second number: ") |> String.trim())
multi3 = String.to_integer(IO.gets("Input third number: ") |> String.trim())

result = multiplication.(multi1, multi2, multi3)
IO.puts("#{result}")

concat_lists = fn list1, list2 -> inspect(list1 ++ list2) end

list1 = ["jari", "ville", 4, true]
list2 = ["tuomo", "pekka"]
concat_example = concat_lists.(list1, list2)
IO.puts("#{concat_example}")

test_tuple = {:ok, :fail}
combined_tuple = Tuple.append(test_tuple, :canceled)

IO.inspect combined_tuple
