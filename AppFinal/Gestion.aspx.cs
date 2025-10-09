using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Control;
using Model;
using static System.Net.Mime.MediaTypeNames;

namespace AppFinal
{
    public partial class Gestion : System.Web.UI.Page
    {
        public bool FiltroAvanzado { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Seguridad.esAdmin(Session["usuario"]))
            {
                Session.Add("error", "No tienes acceso, solo administradores.");
                Response.Redirect("Error.aspx", false);
            }
            if (!IsPostBack)
            {
                FiltroAvanzado = false;
                ArticuloNegocio negocio = new ArticuloNegocio();
                Session.Add("ListaArticulos", negocio.listarSP());
                dgvArticulos.DataSource = Session["ListaArticulos"];
                dgvArticulos.DataBind();
            }
        }

        protected void dgvArticulos_SelectedIndexChanged(object sender, EventArgs e)
        {
            string id = dgvArticulos.SelectedDataKey.Value.ToString();
            Response.Redirect("FormularioArticulo.aspx?id=" + id);
        }

        protected void dgvArticulos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dgvArticulos.PageIndex = e.NewPageIndex;
            dgvArticulos.DataSource = Session["ListaArticulos"];
            dgvArticulos.DataBind();
        }

        protected void btnIrAFormulario_Click(object sender, EventArgs e)
        {
            Response.Redirect("FormularioArticulo.aspx");
        }

        protected void txtFiltro_TextChanged(object sender, EventArgs e)
        {
            List<Articulo> lista = (List<Articulo>)Session["ListaArticulos"];
            List<Articulo> listaFiltrada = lista.FindAll(x => x.Nombre.ToUpper().Contains(txtFiltro.Text.ToUpper()) || x.Codigo.ToUpper().Contains(txtFiltro.Text.ToUpper()));
            dgvArticulos.DataSource = listaFiltrada;
            dgvArticulos.DataBind();
        }

        protected void chkFiltroAvanzado_CheckedChanged(object sender, EventArgs e)
        {
            FiltroAvanzado = chkFiltroAvanzado.Checked;
            txtFiltro.Enabled = !FiltroAvanzado;
        }

        protected void ddlCampos_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlCriterio.Items.Clear();
            if (ddlCampos.SelectedItem.ToString() == "Precio")
            {
                ddlCriterio.Items.Add("Mayor a");
                ddlCriterio.Items.Add("Menor a");
            }
            else
            {
                ddlCriterio.Items.Add("Comienza con");
                ddlCriterio.Items.Add("Contiene");
                ddlCriterio.Items.Add("Termina con");
            }
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            try
            {
                ArticuloNegocio negocio = new ArticuloNegocio();
                dgvArticulos.DataSource = negocio.filtrar(ddlCampos.SelectedItem.ToString(),
                ddlCriterio.SelectedItem.ToString(), txtFiltroAvanzado.Text);
                dgvArticulos.DataBind();
            }
            catch (Exception ex)
            {
                Session.Add("Error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void btnLimpiarFiltro_Click(object sender, EventArgs e)
        {
            ArticuloNegocio negocio = new ArticuloNegocio();
            dgvArticulos.DataSource = negocio.listarSP();
            dgvArticulos.DataBind();
        }

        protected void btnIrAgregarMyC_Click(object sender, EventArgs e)
        {
            Response.Redirect("MarcasCategorias.aspx");
        }
    }
}