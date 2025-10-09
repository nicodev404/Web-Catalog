using Control;
using Model;
using System;
using System.Collections.Generic;
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
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    cargarListasDDL();
                    if (Request.QueryString["Id"] != null)
                    {
                        int idArticulo = int.Parse(Request.QueryString["Id"]);
                        cargarArticulo(idArticulo);
                    }
                }
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }
        }

        private void cargarArticulo(int id)
        {
            Articulo seleccionado = new Articulo();

            if (Session["ListaArticulos"] != null)
            {
                List<Articulo> lista = (List<Articulo>)Session["ListaArticulos"];
                seleccionado = lista.Find(x => x.Id == id);
            }
            if (seleccionado != null)
            {
                txtCodigo.Text = seleccionado.Codigo;
                txtNombre.Text = seleccionado.Nombre;
                ddlMarca.SelectedValue = seleccionado.Marca.Id.ToString();
                ddlCategoria.SelectedValue = seleccionado.Categoria.Id.ToString();
                txtPrecio.Text = seleccionado.Precio.ToString("N2", CultureInfo.GetCultureInfo("es-AR"));
                txtDescripcion.Text = seleccionado.Descripcion;
                string imagen = string.IsNullOrEmpty(seleccionado.UrlImagen) ? "https://www.afim.com.eg/public/images/no-photo.png" :
                    seleccionado.UrlImagen;
                imgArticulo.ImageUrl = imagen;
                inhabilitarControl();
            }
            else
                Response.Redirect("Default.aspx");
        }

        private void cargarListasDDL()
        {
            MarcaCategoria marcaNegocio = new MarcaCategoria();
            ddlMarca.DataSource = marcaNegocio.obtenerMarcas();
            ddlMarca.DataTextField = "Descripcion";
            ddlMarca.DataValueField = "Id";
            ddlMarca.DataBind();

            MarcaCategoria categoriaNegocio = new MarcaCategoria();
            ddlCategoria.DataSource = categoriaNegocio.obtenerCategorias();
            ddlCategoria.DataTextField = "Descripcion";
            ddlCategoria.DataValueField = "Id";
            ddlCategoria.DataBind();
        }

        private void inhabilitarControl()
        {
            txtCodigo.Enabled = false;
            txtNombre.Enabled = false;
            ddlMarca.Enabled = false;
            ddlCategoria.Enabled = false;
            txtDescripcion.Enabled = false;
            txtPrecio.Enabled = false;
        }

        protected void btnFavorito_Click(object sender, EventArgs e)
        {
            if (!Seguridad.SesionActiva(Session["usuario"]))
                Response.Redirect("Login.aspx");

        }
    }
}