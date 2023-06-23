defmodule HrSystem.HumanResources.Employee do
  use Ecto.Schema
  import Ecto.Changeset

  schema "employees" do
    field :department, :string
    field :employee_id, :string
    field :first_name, :string
    field :hire_date, :date
    field :last_name, :string

    timestamps()
  end

  @doc false
  def changeset(employee, attrs) do
    employee
    |> cast(attrs, [:employee_id, :last_name, :first_name, :hire_date, :department])
    |> validate_required([:employee_id, :last_name, :first_name, :hire_date, :department])
  end
end
