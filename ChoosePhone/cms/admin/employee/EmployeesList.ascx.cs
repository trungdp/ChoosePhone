using DataAccess.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ChoosePhone.cms.admin.employee
{
    public partial class EmployeesList : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PopulateControls();
            }
        }
        private void PopulateControls()
        {
            //init sample data
            Employee sample = new Employee();
            sample.EmployeeID = 1;
            sample.Name = "Anh Vũ";
            List<Employee> sampleDatas = new List<Employee>();
            for (int i = 0; i < 5; i++)
                sampleDatas.Add(sample);

            repEmployeesList.DataSource = sampleDatas;
            repEmployeesList.DataBind();
        }
    }
}