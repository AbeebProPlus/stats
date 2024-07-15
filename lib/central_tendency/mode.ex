defmodule Stats.CentralTendency.Mode do
  alias Stats.{Errors, Validators}

  @spec mode([]) :: {atom(), String.t()}
  def mode([]), do: Errors.invalid_data_type()

  def mode(nums) when is_list(nums) do
    nums
    |> Validators.validate_num_list()
    |> get_mode()
  end

  def mode(_), do: Errors.invalid_data_type()

  defp get_mode({true, nums}) do
    nums
    # Count each number's occurrences returns a map
    |> Enum.frequencies()
    # Find the number with the highest count
    |> Enum.max_by(fn {_key, value} -> value end)
    # Get the actual number (the key)
    |> elem(0)
  end
end
