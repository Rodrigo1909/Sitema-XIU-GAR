﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectPaslum.Almacen
{
    public partial class AlertaAlerta : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "Alerta()", true);
        }
    }
}