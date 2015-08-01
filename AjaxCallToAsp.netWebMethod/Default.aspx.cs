using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AjaxCallToAsp.netWebMethod
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            btnSubmit.Text = "Form Submitted";
        }


        [WebMethod]
        public static string AjaxCall(string num)
        {
            if (num == "5")    //check ur logic here
            {
                return "true";
            }
            else
            {
                return "false";
            }

        }
    }
}