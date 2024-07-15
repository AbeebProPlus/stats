defmodule Stats.CentralTendency.Median do
  require Integer
  alias Stats.{Errors, Validators}

  @spec median([]) :: {atom(), String.t()}
  def median([]), do: Errors.invalid_data_type()

  @spec median([number()]) :: number()
  def median(nums) when is_list(nums) do
    nums
    |> Validators.validate_num_list()
    |> calculate_median()
  end

  @spec median(any()) :: {atom(), String.t()}
  def median(_), do: Errors.invalid_data_type()

  defp calculate_median({false, _}), do: Errors.invalid_data_type()

  defp calculate_median({true, nums}) do
    count = Enum.count(nums)

    nums
    |> Enum.sort()
    |> get_median(Integer.is_even(count), count)
  end

  @spec get_median([number()], boolean(), number()) :: number()
  defp get_median(nums, is_even, count) do
    div_mid = div(count, 2)

    if is_even do
      mid1 = Enum.at(nums, div_mid - 1)
      mid2 = Enum.at(nums, div_mid)
      (mid1 + mid2) / 2
    else
      index = div_mid
      Enum.at(nums, index)
    end
  end
end
