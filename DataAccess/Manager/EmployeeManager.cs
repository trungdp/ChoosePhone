using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Core;
using DataAccess.DTO;
using DataAccess.DAO;
namespace DataAccess.Manager
{
    class EmployeeManager
    {
        private EmployeeManager instance;
        public EmployeeManager Instance
        {
            get
            {
                if (instance == null)
                    instance = new EmployeeManager();
                return instance;
            }
        }

        private EmployeeManager() { }

        public List<Employee> GetAllEmployees()
        {
            return EmployeeDAO.All();
        }

        public List<Employee> SearchByKeyWord(string word, string page, out int pageCount)
        {
            return EmployeeDAO.Search(word, page, out pageCount);
        }

        public List<Employee> GetAllEmployeesWithPaging(string page, out int pageCount)
        {
            return EmployeeDAO.Paging(page, GlobalConfiguration.PageSize, out pageCount);
        }

        public List<Employee> GetAllEmployeesWithPaging(string page, int pageSize, out int pageCount)
        {
            return EmployeeDAO.Paging(page, pageSize, out pageCount);
        }

        public bool AddEmployee(Employee data)
        {
            return EmployeeDAO.Insert(data) > 0;
        }
        public bool Update(Employee data)
        {
            return EmployeeDAO.Update(data);
        }
        public bool DeleteEmployee(string EmployeeID)
        {
            return EmployeeDAO.Delete(EmployeeID);
        }
    }
}
