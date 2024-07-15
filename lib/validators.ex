defmodule Stats.Validators do
  alias Stats.Errors

  @spec validate_num_list([number()]) :: {boolean(), [number()]}
  def validate_num_list(nums) when is_list(nums) do
    {Enum.all?(nums, fn n -> is_number(n) end), nums}
  end

  @spec validate_num_list(any()) :: {:error, String.t()}
  def validate_num_list(_), do: Errors.invalid_data_type()
end
