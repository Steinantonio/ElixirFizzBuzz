defmodule FizzBuzzTest do
  use ExUnit.Case

describe "build(param)" do

  test "When a valid file is provided, returns fizzbuzz list" do
      expectedResponse = {:ok, [1,2, :fizz, 4, :buzz, :buzz, :fizzbuzz, :buzz]}
      assert FizzBuzz.listBuilder("numbers.txt") == expectedResponse
  end

  test "When an invalid file is provided, returns error" do
    expectedResponse = {:error, "File does not exist enoent"}
    assert FizzBuzz.listBuilder("invalid.txt") == expectedResponse
  end

 end

end
