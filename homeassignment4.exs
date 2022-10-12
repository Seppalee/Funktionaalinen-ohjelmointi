# Task 1
html_colors = [{:Azure, "#F0FFFF"}, {:Beige, "#F5F5DC"}, {:CadetBlue, "#5F9EA0"}, {:Cornsilk, "#FFF9DC"}, {:Brown, "#A52A2A"},
{:Cyan, "#00FFFF"}, {:Black, "#000000"}, {:BlueViolet, "#8A2BE2"}, {:Crimson, "#DC142C"}, {:Aquamarine, "#7FFFD4"}]

defmodule ColorPicker do
  def find_color(colors) do
    input = IO.gets("Input a color name or hexcode: ") |> String.trim()
    filter(input, colors)
  end
  def filter(input, colors) do
    cond do
      Keyword.has_key?(colors, String.to_atom(input)) ->
        IO.puts Keyword.get(colors, String.to_atom(input))
        find_color(colors)
      String.contains?(input, "#") ->
        {color, _} = Enum.find(colors, fn x ->
          String.equivalent?(elem(x,1), input) == true
        end)
        IO.puts color
        find_color(colors)
      true ->
        IO.puts "Quitting"
    end
  end
end

ColorPicker.find_color(html_colors)

# Task 2
books = %{"978-0451190499" => "The Two Dead Girls", "978-0451190529" => "The Mouse on the Mile", "978-0451190543" => "Coffey's Hands",
"978-0451190550" => "The Bad Death of Eduard Delacroix", "978-0451190567" => "Night Journey"}

defmodule Library do
  def command(books) do
    user_input = IO.gets("Give a command to perform (list, search, add, remove, quit) ") |> String.trim()
    perform_task(user_input, books)
  end
  def perform_task(user_input, books) do
    cond do
      String.equivalent?(user_input, "list") ->
        list_books(books)
      String.equivalent?(user_input, "search") ->
        search_book(books)
      String.equivalent?(user_input, "add") ->
        add_book(books)
      String.equivalent?(user_input, "remove") ->
        remove_book(books)
      String.equivalent?(user_input, "quit") ->
        quit()
    end
  end
  def list_books(books) do
    Enum.each(books, fn({_, x}) ->
      IO.puts(x)
    end)
    command(books)
  end
  def search_book(books) do
    isbn_value = IO.gets("Type ISBN to find: ") |> String.trim()
    {_, book} = Enum.find(books, fn x ->
      String.equivalent?(elem(x,0), isbn_value) == true
    end)
    IO.puts book
    command(books)
  end
  def add_book(books) do
    isbn_value = IO.gets("Type ISBN of book to add: ") |> String.trim()
    book_name = IO.gets("Type book's name: ") |> String.trim()
    books = Map.put(books, isbn_value, book_name)
    command(books)
  end
  def remove_book(books) do
    isbn_value = IO.gets("Type ISBN of book to remove: ") |> String.trim()
    books = Map.delete(books, isbn_value)
    command(books)
  end
  def quit() do
    IO.puts("Quitting")
  end
end

Library.command(books)
