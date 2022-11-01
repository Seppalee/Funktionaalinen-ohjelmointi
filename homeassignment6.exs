defmodule Employee do
  @jobs {:none, :coder, :designer, :manager, :ceo}
  defstruct [:firstname, :lastname, :id, :salary, job: :none]

  def create_new(firstname, lastname) do
    %Employee{firstname: firstname, lastname: lastname, salary: 0, id: System.unique_integer([:monotonic, :positive])}
  end

  def promote(employee) do
    current = Enum.find_index(Tuple.to_list(@jobs), fn x -> x == employee.job end)
    if current < tuple_size(@jobs) - 1 do
      %Employee{employee | job: elem(@jobs, current + 1), salary: employee.salary + 2000}
    else
      IO.puts("Can't promote CEO")
      employee
    end
  end

  def demote(employee) do
    current = Enum.find_index(Tuple.to_list(@jobs), fn x -> x == employee.job end)
    if current > 0 do
      %Employee{employee | job: elem(@jobs, current - 1), salary: employee.salary - 2000}
    else
      IO.puts("Already lost the job")
      employee
    end
  end

end

defmodule Main do
  def main do
    jari = Employee.create_new("Jari", "Ruusuvuori")
    anna = Employee.create_new("Anna", "Pukki")
    teemu = Employee.create_new("Teemu", "Laitinen")
    erik = Employee.create_new("Erik", "Pöntinen")

    IO.inspect(jari)
    IO.inspect(anna)
    IO.inspect(teemu)
    IO.inspect(erik)

    jari = Employee.promote(jari)
    jari = Employee.promote(jari)
    jari = Employee.promote(jari)
    jari = Employee.promote(jari)
    jari = Employee.promote(jari)
    jari = Employee.promote(jari)

    IO.inspect(jari)

    jari = Employee.demote(jari)
    jari = Employee.demote(jari)

    IO.inspect(jari)
  end
end

Main.main
