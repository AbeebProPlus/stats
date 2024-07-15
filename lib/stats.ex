defmodule Stats do
  alias Stats.CentralTendency.Mean
  alias Stats.CentralTendency.Median
  alias Stats.CentralTendency.Mode

  # def population_mean(nums), do: Mean.population_mean(nums)
  defdelegate population_mean(nums), to: Mean
  defdelegate median(nums), to: Median
  defdelegate mode(nums), to: Mode
end
