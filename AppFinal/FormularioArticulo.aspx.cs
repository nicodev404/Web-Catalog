using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.EnterpriseServices;
using System.Web.Services.Discovery;
using System.Globalization;
using Control;
using Model;
using System.Security.Policy;

namespace AppFinal
{
    public partial class FormularioArticulo : System.Web.UI.Page
    {
        public bool ConfirmaElimincaion { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            txtId.Enabled = false;
            ConfirmaElimincaion = false;

            try
            {
                if (!IsPostBack)
                {
                    cargarListasDDL();

                    string id = Request.QueryString["id"] != null ? Request.QueryString["id"].ToString() : "";
                    if (id != "")
                    {
                        ArticuloNegocio negocio = new ArticuloNegocio();
                        Articulo seleccionado = (negocio.listar(id))[0];

                        txtId.Text = id;
                        txtCodigo.Text = seleccionado.Codigo;
                        txtNombre.Text = seleccionado.Nombre;
                        ddlMarca.SelectedValue = seleccionado.Marca.Id.ToString();
                        ddlCategoria.SelectedValue = seleccionado.Categoria.Id.ToString();
                        txtDescripcion.Text = seleccionado.Descripcion;
                        txtURLImagen.Text = seleccionado.UrlImagen;
                        if (!string.IsNullOrEmpty(seleccionado.UrlImagen))
                            imgArticulo.ImageUrl = seleccionado.UrlImagen;
                        txtPrecio.Text = seleccionado.Precio.ToString("N2", CultureInfo.GetCultureInfo("es-AR"));
                    }

                }
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }
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

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            try
            {
                Page.Validate();
                if (!Page.IsValid)
                    return;
                if (Validacion.validaTextoVacio(txtCodigo) || Validacion.validaTextoVacio(txtNombre) || Validacion.validaTextoVacio(txtPrecio))
                {
                    Session.Add("error", "Campos incompletos");
                    Response.Redirect("Error.aspx", false);
                }
                Articulo nuevo = new Articulo();
                ArticuloNegocio negocio = new ArticuloNegocio();
                nuevo.Codigo = txtCodigo.Text;
                nuevo.Nombre = txtNombre.Text;
                nuevo.Marca = new Marca();
                nuevo.Marca.Id = int.Parse(ddlMarca.SelectedValue);
                nuevo.Categoria = new Categoria();
                nuevo.Categoria.Id = int.Parse(ddlCategoria.SelectedValue);
                nuevo.Descripcion = txtDescripcion.Text;
                nuevo.UrlImagen = txtURLImagen.Text;
                nuevo.Precio = decimal.Parse(txtPrecio.Text.ToString());

                if (Request.QueryString["id"] != null)
                {
                    nuevo.Id = int.Parse(Request.QueryString["id"].ToString());
                    negocio.modificarSP(nuevo);
                }
                else
                    negocio.agregarSP(nuevo);

                Response.Redirect("Gestion.aspx", false);
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void txtURLImagen_TextChanged(object sender, EventArgs e)
        {
            imgArticulo.ImageUrl = txtURLImagen.Text;
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            ConfirmaElimincaion = true;
        }

        protected void btnConfirmarEliminacion_Click(object sender, EventArgs e)
        {
            try
            {
                if (chkConfirmarEliminacion.Checked)
                {
                    ArticuloNegocio negocio = new ArticuloNegocio();
                    negocio.eliminarSP(int.Parse(txtId.Text));
                    Response.Redirect("Gestion.aspx");
                }
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }
        }
    }
}