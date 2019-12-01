defmodule AdventOfCode do
  @moduledoc """
  Documentation for AdventOfCode.
  """

  @doc """
  Day 1 The Tyranny of the Rocket Equation

  """
  @spec round_num(float) :: integer
  def round_num(num) when is_float(num) do
    round(Float.floor(num))
  end

  @spec round_num(integer) :: integer
  def round_num(num) when is_integer(num) do
    num
  end

  @spec fuel_use(integer) :: integer
  def fuel_use(mass) do
    round_num(mass / 3) - 2
  end

  def fuel_aggr([ head | tail ]) do
    fuel_use(head) + fuel_aggr(tail)
  end

  def fuel_aggr([]) do
    0
  end

  def fuel_of_fuel_mass(mass, aggr) when mass <= 0 do
    aggr
  end

  def fuel_of_fuel_mass(mass, aggr) do
    fuel_of_fuel_mass(fuel_use(mass), mass + aggr)
  end

  def fuel_of_fuel_mass(mass) do
    fuel_of_fuel_mass(fuel_use(mass), 0)
  end

  def fuel_mass_fuel_aggr([val|tail]) do
    fuel_of_fuel_mass(val) + fuel_mass_fuel_aggr(tail)
  end

  def fuel_mass_fuel_aggr([]) do
    0
  end
end
