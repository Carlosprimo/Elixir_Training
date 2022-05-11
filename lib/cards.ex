defmodule Cards do
  @moduledoc """
    Provides methods for creating and handling a deck of cards.
  """

  @doc """
    Returns a list of string representing a deck of playing cards.
  """
  def create_deck do
    values = [
      "Ace",
      "Two",
      "Three",
      "Four",
      "Five",
      "Six",
      "Seven",
      "Eight",
      "Nine",
      "Ten",
      "Jack",
      "Queen",
      "King"
    ]

    suits = ["Clubs", "Diamonds", "Hearts", "Spades"]

    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
    Determines wheter a deck contains a given card.
  
    ## Examples
  
      iex> deck = Cards.create_deck
      iex> Cards.contains?(deck, "Ace of Spades")
      true
  
  """
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  @doc """
  Divedes a deck into a hand and the remainder of the deck.
  The`hand_size` argument indicates  how many cards should be in the hand.
  
  ## Examples
  
      iex> deck = Cards.create_deck
      iex> {hand, _} = Cards.deal(deck, 5)
      iex> hand
      ["Ace of Clubs", "Two of Clubs", "Three of Clubs", "Four of Clubs","Five of Clubs"]
  
  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  def save(deck, filename) do
    {:ok, file} = File.open(filename, [:write])
    IO.binwrite(file, deck)
    IO.binwrite(file, "\n")
    File.close(file)
  end

  def load(filename) do
    case File.read(filename) do
      {:ok, deck} -> deck
      {:error, _reason} -> "That file does not exist"
    end
  end

  def create_hand(hand_size) do
    Cards.create_deck()
    |> Cards.shuffle()
    |> Cards.deal(hand_size)
  end
end
