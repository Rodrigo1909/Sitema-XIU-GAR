﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Modelo;

namespace ProjectPaslum.Venta
{
    public partial class Venta : System.Web.UI.MasterPage
    {
        PaslumBaseDatoDataContext contexto = new PaslumBaseDatoDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            DateTime dt = DateTime.Now;
            DateTime wkStDt = DateTime.MinValue;
            wkStDt = dt.AddDays(1 - Convert.ToDouble(dt.DayOfWeek));
            DateTime fechadesdesemana = wkStDt.Date;

            DateTime DOMINGO = DateTime.MaxValue;
            DOMINGO = dt.AddDays(7 - Convert.ToDouble(dt.DayOfWeek));
            DateTime DomingoSemana = DOMINGO.Date;



            lbLunes.Text = fechadesdesemana.ToString("yyyy-MM-dd");
            lbDomingo.Text = DomingoSemana.ToString("yyyy-MM-dd");


        }
    }
}