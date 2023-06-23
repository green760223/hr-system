defmodule HrSystemWeb.EmployeeApiController do
  use HrSystemWeb, :controller

  alias HrSystem.HumanResources

  def index(conn, _params) do
    employees = HumanResources.list_employees()
    render(conn, :index, employees: employees)
  end

end
