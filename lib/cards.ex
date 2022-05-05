defmodule Cards do
    def create_deck do
      values = ["Ace", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Jack", "Queen", "King"]
      suits = ["Clubs", "Diamonds", "Hearts", "Spades"]

      for  suit <- suits, value <- values do
          "#{value} of #{suit}"
      end

      List.flatten(cards)
    end
    def shuffle(deck) do
      Enum.shuffle(deck)
    end
    def contains(deck, card) do
      Enum.member?(deck,card)
    end
end
