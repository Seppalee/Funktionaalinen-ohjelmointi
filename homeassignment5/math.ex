defmodule Math do
  def add(a, b) do
    func = "add"
    info(func, a, b)
    IO.puts("#{a + b}")
  end
  def sub(a, b) do
    func = "sub"
    info(func, a, b)
    IO.puts("#{a - b}")
  end
  def mul(a, b) do
    func = "mul"
    info(func, a, b)
    IO.puts("#{a * b}")
  end
  def div(a, b) do
    func = "div"
    info(func, a, b)
    IO.puts("#{a / b}")
  end
  defp info(func, a, b) do
    cond do
      String.equivalent?(func, "add") ->
        IO.puts("Adding #{a} and #{b}")
      String.equivalent?(func, "sub") ->
        IO.puts("Substracting #{a} and #{b}")
      String.equivalent?(func, "mul") ->
        IO.puts("Multiplying #{a} and #{b}")
      String.equivalent?(func, "div") ->
        IO.puts("Dividing #{a} and #{b}")
    end
  end
end
