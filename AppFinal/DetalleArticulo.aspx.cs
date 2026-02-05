using Control;
using Model;
using System;
using System.Collections.Generic;
using System.EnterpriseServices;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static System.Net.WebRequestMethods;

namespace AppFinal
{
    public partial class DetalleArticulo : System.Web.UI.Page
    {
        public Articulo articulo { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    if (Request.QueryString["id"] != null)
                    {
                        int idArticulo = int.Parse(Request.QueryString["id"]);
                        cargarArticulo(idArticulo);
                    }
                }
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Default.aspx", false);
            }
        }

        private void cargarArticulo(int id)
        {
            articulo = new Articulo();

            if (Session["ListaArticulos"] != null)
            {
                List<Articulo> lista = (List<Articulo>)Session["ListaArticulos"];
                articulo = lista.Find(x => x.Id == id);
            }

            if (articulo != null)
            {
                string imagen = string.IsNullOrEmpty(articulo.UrlImagen)
                    ? "https://www.afim.com.eg/public/images/no-image.png"
                    : articulo.UrlImagen;

                imgArticulo.ImageUrl = imagen;
            }
        }
    }
}

