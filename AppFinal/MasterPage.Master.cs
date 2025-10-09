using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Control;
using Model;

namespace AppFinal
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            imgPerfil.ImageUrl = "https://openclipart.org/image/2000px/247319";
            if (!(Page is Login || Page is Default || Page is Registro || Page is Contacto || Page is Error || Page is DetalleArticulo))
            {
                if (!Seguridad.SesionActiva(Session["usuario"]))
                    Response.Redirect("Login.aspx");
                else
                {
                    Usuario usuario = (Usuario)Session["usuario"];
                    if (!string.IsNullOrEmpty(usuario.URLImagenPerfil))
                        imgPerfil.ImageUrl = "~/Images/" + usuario.URLImagenPerfil;
                }
            }
        }

        protected void btnRegistrarse_Click(object sender, EventArgs e)
        {
            Response.Redirect("Registro.aspx");
        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void btnSalir_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Login.aspx");
        }
    }
}