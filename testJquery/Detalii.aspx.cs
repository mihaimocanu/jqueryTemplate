using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace testJquery
{
    public partial class Detalii : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["usrid"] != null && Request.QueryString["rolename"] != null)
            {
                LabelFunctieVal.Text = Request.QueryString["rolename"].ToString();
            }
            else
            {
                Response.Redirect("Default.aspx");
            }
        }
    }
}