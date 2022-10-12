defmodule GetInputs do
  def get_input() do
    arg = IO.gets("Type the calculation you want to perform (Format x*y): ") |> String.trim()
    call_calculator(arg)
  end
  def call_calculator(arg) do
    Calculator.calc(arg)
    get_input()
  end
end

GetInputs.get_input()
