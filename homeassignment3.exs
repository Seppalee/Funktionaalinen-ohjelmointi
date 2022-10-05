# Part 1
defmodule Division do
  def division_test do
    value = IO.gets("Type input: ")
    |> String.trim()
    |> String.to_integer()
    do_division(value)
  end
  def do_division(value) do
    case {rem(value,3), rem(value,5), rem(value,7)} do
      {0,_,_} -> IO.puts("Divisible by 3")
      {_,0,_} -> IO.puts("Divisible by 5")
      {_,_,0} -> IO.puts("Divisible by 7")
      {_,_,_} -> IO.puts(try_divison_by_two(value))
    end
  end
  def try_divison_by_two(value) do
    case rem(value,2) do
      0 -> "Divisible by 2"
      _ -> find_prime(value)
    end
  end
  def find_prime(value) do
    value_to_sqrt = value * value
    Enum.each(3..value_to_sqrt, fn(x) ->
      if (rem(value, x) == 0) do
        IO.puts("Divisible by #{x}")
      end
    end)
  end
end

Division.division_test()

# Part 2
add_two = fn
  a, b when is_binary(a) and is_binary(b) -> IO.puts(a <> b)
  a, b -> IO.puts(a + b)
end

add_two.("Hello", "World")
add_two.(6, 9)
