﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectPaslum.Venta
{
    public partial class DetalleVenta : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] != null)
            {
                
            }
            else
            {
                Response.Redirect("../IndexPaslum.aspx", true);
            }
        }
    }
}