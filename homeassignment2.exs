# Part 1
test_string = "99 bottles of beer on the wall"
no_numbers = String.replace(test_string, ~r/\d/, "")

string_splitted = String.split(no_numbers)
words_amount = length(string_splitted)

IO.puts "#{words_amount} words in the string"

# Part 2
test_string2 = "Pattern Matching with Elixir. Remember that equals sign is a match operator, not an assignment"

defmodule PigLatin do
  @consonants_group ["ch", "qu", "squ", "thr", "th", "sch"]
  @spec translate(phrase :: String.t()) :: String.t()
  def translate(phrase) do
    phrase
    |> String.split()
    |> Enum.map(&do_translate(&1, String.starts_with?(&1, @consonants_group)))
    |> Enum.join(" ")
  end
  def do_translate(phrase, true) do
    [consonant, rest] =
     @consonants_group
      |> Enum.join("|")
      |> Regex.compile!()
      |> Regex.split(phrase, include_captures: true)
      |> Enum.reject(&(&1 == ""))
    rest <> consonant <> "ay"
  end
  def do_translate(phrase, false) do
    [consonants | rest] =
    Regex.split(~r/[aeiou]|x[^aeiou]|y[^aeiou]/, phrase, include_captures: true)
    Enum.join(rest, "") <> consonants <> "ay"
  end
end

IO.puts PigLatin.translate(test_string2)
