defmodule Calculator do
  def calc(param) do
    [x, y] = String.split(String.trim(param), ["*", "/", "-", "+"])
    x_int = String.to_integer(x)
    y_int = String.to_integer(y)

    [_, operator, _] = String.split(String.trim(param), [x, y])
    cond do
      String.equivalent?(operator, "*") ->
        Math.mul(x_int, y_int)
      String.equivalent?(operator, "/") ->
        Math.div(x_int, y_int)
      String.equivalent?(operator, "-") ->
        Math.sub(x_int, y_int)
      String.equivalent?(operator, "+") ->
        Math.add(x_int, y_int)
    end
  end
end
