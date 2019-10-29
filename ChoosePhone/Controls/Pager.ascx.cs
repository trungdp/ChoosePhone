﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ChoosePhone.Controls
{

    public class PageUrl
    {
        private string page;
        private string url;
        private string pageUrl;

        public string Page { get { return page; } }
        public string Url { get { return url; } }
        public PageUrl(string page, string url)
        {
            this.page = page;
            this.url = url;
        }
    }

    public partial class Pager : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public void Show(int currentPage, int howManyPages, string firstPageUrl, string pageUrlFormat, bool showPages)
        {
            if (howManyPages > 1)
            {
                this.Visible = true;
                lbCurrentPage.Text = currentPage.ToString();
                lbHowManyPages.Text = howManyPages.ToString();

                if (currentPage == 1)
                {
                    lnkPrevious.Enabled = true;
                    lnkNext.CssClass = "disable";
                }
                else
                {
                    lnkPrevious.NavigateUrl = currentPage == 2 ? firstPageUrl : string.Format(pageUrlFormat, currentPage - 1);
                }
                if (currentPage == howManyPages)
                {
                    lnkNext.NavigateUrl = String.Format(pageUrlFormat, currentPage + 1);
                }
                if (showPages)
                {
                    PageUrl[] pages = new PageUrl[howManyPages];
                    pages[0] = new PageUrl("1", firstPageUrl);
                    for (int i = 2; i < howManyPages; i++)
                    {
                        pages[i - 1] = new PageUrl(i.ToString(), string.Format(pageUrlFormat, i));
                    }
                    if (currentPage >= 0 && currentPage < howManyPages)
                        pages[currentPage - 1] = new PageUrl(currentPage.ToString(), "");
                    repPager.DataSource = pages;
                    repPager.DataBind();
                }
            }
            else
            {
                this.Visible = false;
            }

        }

    }
}