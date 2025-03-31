defmodule Hello do
  use Application

  @moduledoc """
  Documentation for `Hello`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Hello.hello()
      :world

  """
  def start(_type, _args) do
    Hello.main()
    Supervisor.start_link([], strategy: :one_for_one)
  end

  def main do
    # x = 10
    # IO.puts("hwllop")
    # name = "Eugene"
    # status = Enum.random([:gold, :silver, :bronze])

    # if status === :gold do
    #   IO.puts("Welcome to the fancy lounge, #{name}")
    # else
    #   IO.puts("Get lost")
    # end

  # a = 10
  # b = 2.3
  # IO.puts(a+b)

  # time  = Time.new(16,30,0,0)
  # date = Date.new(2025,1,1)
  # IO.inspect(date)

  # evens = for x <- 1..10, rem(x, 2) == 0, do: x
  # IO.inspect(evens)  # [2, 4, 6, 8, 10]

  


  end
end
