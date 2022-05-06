defmodule Identicon do
  def main(input) do
    input
    |> hash_input
    |> pick_color
    |> build_grid
    |> filter_odd_square
  end

  def build_grid(%Identicon.Image{hex: hex} = image) do
    grid =
    hex
    |> Enum.chunk_every(3)
    |> List.delete_at(5)
    |> Enum.map(&mirror_row/1)
    |> List.flatten
    |> Enum.with_index

    %Identicon.Image{image | grid: grid}
  end

  def filter_odd_square(%Identicon.Image{grid: grid} = image) do
    Enum.filter grid, fn({code, _index}) ->
      rem(code, 2) == 0
    end
  end

  def mirror_row([a, b, c]) do
    [a, b, c, b, a]
  end


  def pick_color(%Identicon.Image{hex: [r, g, b | _tail]} = image) do

    %Identicon.Image{image | color: {r, g, b}}

  end

  def hash_input(input) do
    hex = :crypto.hash(:md5,input)
    |> :binary.bin_to_list

    %Identicon.Image{hex: hex}
  end

end
