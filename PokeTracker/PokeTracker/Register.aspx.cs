using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PokeTracker
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                //Disable the first option of the dropdown menu
                 DDLTeam.Items[0].Attributes["disabled"] = "disabled";
            }
        }

        protected void SubmitRegistration(object sender, EventArgs e)
        {
           // TBName.
        }
    }

    
}