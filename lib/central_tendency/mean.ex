defmodule Stats.CentralTendency.Mean do
  alias Stats.{Validators, Errors}

  @spec population_mean([]) :: {atom(), String.t()}
  def population_mean([]), do: Errors.invalid_data_type()

  @spec population_mean([number()]) :: number()
  def population_mean(nums) when is_list(nums) do
    nums
    |> Validators.validate_num_list()
    |> calc_population_mean()
  end

  @spec population_mean(any()) :: {atom(), String.t()}
  def population_mean(_), do: Errors.invalid_data_type()

  @spec calc_population_mean({false, any()} | {true, any()}) :: float() | {:error, <<_::136>>}
  defp calc_population_mean({false, _}), do: {:error, "Invalid data type"}

  @spec calc_population_mean({atom(), [number()]}) :: number()
  defp calc_population_mean({true, nums}) do
    nums
    |> Enum.sum()
    |> mean(Enum.count(nums))
  end

  @spec mean(number(), number()) :: float()
  defp mean(sigma, count), do: sigma / count
end
