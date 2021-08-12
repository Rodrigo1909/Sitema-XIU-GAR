﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectPaslum.Venta
{
    public partial class AlertaErrorAbono : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] != null)
            {
                this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "alerta()", true);
            }
            else
            {
                Response.Redirect("../IndexPaslum.aspx", true);
            }            
        }
    }
}