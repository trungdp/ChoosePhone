using Core;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess;

namespace ChoosePhone
{
	public partial class Cart : System.Web.UI.Page
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
            //DataAccess.DTO.Cart sample = new DataAccess.DTO.Cart();
            //sample.ProductID = 1;
        }
	}
}