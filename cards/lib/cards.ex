defmodule Cards do

  @moduledoc """
  Provides methods for creating and handling a dec of cards
  """


  @doc """
  Returns a list of thrings representing  a deck of playing cards
  """  # function that creates a list of cards
  def create_deck do
    values = ["Ace", "King", "Queen", "Jack", "One", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    for value <- values, suit <- suits do
      "#{value} of #{suit}"
    end
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def load(filename) do
    {status, binary} = File.read(filename)

    case status do
      :ok ->
        :erlang.binary_to_term(binary)

      _ ->
        "This file is not a binary"
    end
  end

  def create_hand(hand_size) do
    # deck = Cards.create_deck()
    # deck = Cards.shuffle(deck)
    # hand = Cards.deal(deck, hand_size)

    Cards.create_deck()
    |> Cards.shuffle()
    |> Cards.deal(hand_size)
  end
end

# pattern matching rhs = lhs

# documentation - function documentation and module documentation
