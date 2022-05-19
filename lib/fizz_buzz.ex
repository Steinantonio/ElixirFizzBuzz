defmodule FizzBuzz do

 # OBS : defP = private


# \/ case syntax \/

  #def listBuilder(file_name) do
    # case file_name do
    #   {:ok, file_name} -> file_name
    #   {:error, reason} -> reason
  # end

# finish case syntax  /\

# \/ syntax using callback and pattern matching on passing parameters \/

  #def listBuilder(file_name) do
    # file = File.read(file_name)
    # handle_file_read(file)

  # end

    # def handle_file_read({:ok, result}), do: result
    # def handle_file_read({:error, reason}), do: reason

# /\ finish syntax using callback /\

# \/ using pipe operator \/

 def listBuilder(file_name) do
    file_name
    |> File.read()
    |> handle_file_read()
  end

  defp handle_file_read({:ok, result}) do
    #normal of doing the operations in the commented section below
    results =
    result
    |> String.split(",")
    |> Enum.map(&changeToFizzAndBuzz/1)

     # |> Enum.map(&String.to_integer/1)  & represents a simpler anonymous function

     # first to make split in the string list and change it to number
        #----list = String.split(result, ",");
        #----Enum.map(list, fn element -> String.to_integer(element) end)
      # end of the first way
    {:ok, results}
  end

  defp handle_file_read({:error, reason}), do: {:error, "File does not exist #{reason}"}

# /\ finish using pipe operator /\

  defp changeToFizzAndBuzz(listToChange)do
    listToChange
    |>String.to_integer()
    |>thisTimeItsGonnaChange()
  end

  #rem = % ou remnant (resto)
  defp thisTimeItsGonnaChange(number) when rem(number, 5) == 0 and rem(number,3) == 0, do: :FizzBuzz
  defp thisTimeItsGonnaChange(number) when rem(number, 3) == 0, do: :Fizz
  defp thisTimeItsGonnaChange(number) when rem(number, 5) == 0, do: :Buzz
  defp thisTimeItsGonnaChange(number), do: number # incredibly you have to return the number when none of the conditons match....

  #return usually have the : before the return

end
