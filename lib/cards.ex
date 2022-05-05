defmodule Cards do

    def create_deck do
      values = ["Ace", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Jack", "Queen", "King"]
      suits = ["Clubs", "Diamonds", "Hearts", "Spades"]

      for  suit <- suits, value <- values do
          "#{value} of #{suit}"
      end
    end

    def shuffle(deck) do
      Enum.shuffle(deck)
    end

    def contains(deck, card) do
      Enum.member?(deck, card)
    end

    def deal(deck, hand_size) do
      Enum.split(deck, hand_size)
    end

    def save(deck,filename) do
      {:ok, file} = File.open(filename, [:write])
      IO.binwrite(file, deck)
      File.close(file)
    end

    def load(filename) do
      case File.read(filename) do
        {:ok, deck} -> deck
        {:error, _reason} -> "That file does not exist"
      end
    end

    def create_hand(hand_size) do
      Cards.create_deck
      |> Cards.shuffle
      |> Cards.deal(hand_size)

    end
end
