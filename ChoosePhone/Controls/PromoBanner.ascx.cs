using DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ChoosePhone.Controls
{
    public partial class PromoBanner : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lnkPromo.NavigateUrl = GlobalConfiguration.PromoUrl;
            imgPromoImage.Src = GlobalConfiguration.PromoImage;
        }
    }
}