using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Model;
using Control;

namespace AppFinal
{
    public partial class Default : System.Web.UI.Page
    {
        public List<Articulo> ListaArticulo { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            ArticuloNegocio negocio = new ArticuloNegocio();
            ListaArticulo = negocio.listarSP();

            if (!IsPostBack)
            {
                Session["ListaArticulos"] = ListaArticulo;
                Repetidor.DataSource = ListaArticulo;
                Repetidor.DataBind();
            }
        }

        protected void btnVerDetalle_Click(object sender, EventArgs e)
        {
            string id = ((Button)sender).CommandArgument;
            Response.Redirect($"DetalleArticulo.aspx?Id={id}");
        }
    }
}