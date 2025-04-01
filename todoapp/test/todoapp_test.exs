defmodule TodoappTest do
  use ExUnit.Case
  doctest Todoapp

  test "greets the world" do
    assert Todoapp.hello() == :world
  end
end
