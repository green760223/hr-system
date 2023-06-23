defmodule HrSystem.HumanResourcesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `HrSystem.HumanResources` context.
  """

  @doc """
  Generate a employee.
  """
  def employee_fixture(attrs \\ %{}) do
    {:ok, employee} =
      attrs
      |> Enum.into(%{
        department: "some department",
        employee_id: "some employee_id",
        first_name: "some first_name",
        hire_date: ~D[2023-05-03],
        last_name: "some last_name"
      })
      |> HrSystem.HumanResources.create_employee()

    employee
  end
end
