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
    guess_loop(correct,3)
  end
    # guess = IO.gets("Guess numbver between 0 and 10: ") |> String.trim() |> Integer.parse()

    # case guess do
    #   {result, ""} ->
    #     IO.puts("Parse success full #{result}")

    #     if result == correct do
    #       IO.puts("YOU WIN!!")
    #     else
    #       # {guess, ""} = guess
    #       IO.puts("YOU LOSE!! the correct answer was #{correct}")
    #     end

    #   :error ->
    #     IO.puts("Something went wrong ")
    # end

    # using recursive programming
      # this is the base case
    defp guess_loop(correct,0) do
      IO.puts("YOU LOSE!! The correct number was #{correct}.")

    end

    defp guess_loop(correct, attempt) do
      guess = IO.gets("Guess number between 0 and 10: ") |> String.trim() |> Integer.parse()
      IO.inspect(guess)

      case guess do
        {result, ""} when result == correct ->
          IO.puts("YOU WIN!!")

        {result, _} ->
          IO.puts("Wrong guess. Tries left: #{attempt - 1}")
          guess_loop(correct, attempt - 1)

        :error ->
          IO.puts("Invalid input. Please enter a number.")
          guess_loop(correct, attempt)
      end
    end
end
