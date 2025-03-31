defmodule Guessgame do
  @moduledoc """
  Documentation for `Guessgame`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Guessgame.hello()
      :world

  """

  def start(_type, _args) do
    Guessgame.main()
    Supervisor.start_link([], strategy: :one_for_one)
  end

  def main do
    correct = :rand.uniform(11) - 1
    guess = IO.gets("Guess numbver between 0 and 10: ") |> String.trim() |> Integer.parse()

    case guess do
      {result, ""} ->
        IO.puts("Parse success full #{result}")

        if result == correct do
          IO.puts("YOU WIN!!")
        else
          # {guess, ""} = guess
          IO.puts("YOU LOSE!! the correct answer was #{correct}")
        end

      :error ->
        IO.puts("Something went wrong ")
    end
  end
end
