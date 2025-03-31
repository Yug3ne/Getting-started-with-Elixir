defmodule GuessgameTest do
  use ExUnit.Case
  doctest Guessgame

  test "greets the world" do
    assert Guessgame.hello() == :world
  end
end
