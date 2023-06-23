defmodule HrSystemWeb.EmployeeApiJSON do

  def index(%{employees: employees}) do
    %{data:
      for (employee <- employees) do
        %{
          id: employee.id,
          employee_id: employee.employee_id,
          first_name: employee.first_name,
          last_name: employee.last_name,
          hire_date: employee.hire_date,
          department: employee.department
        }
      end
    }
  end

end
