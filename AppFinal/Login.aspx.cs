using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Model;
using Control;
using System.Diagnostics.Eventing.Reader;

namespace AppFinal
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            Usuario usuario;
            UsuarioNegocio negocio = new UsuarioNegocio();

            try
            {
                Page.Validate();
                if (!Page.IsValid)
                    return;
                if (Validacion.validaTextoVacio(txtEmail) || Validacion.validaTextoVacio(txtPass))
                {
                    Session.Add("error", "Debes completar ambos campos correctamente");
                    Response.Redirect("Error.aspx", true);
                }
                usuario = new Usuario(txtEmail.Text, txtPass.Text, false);
                if (negocio.Loguear(usuario))
                {
                    Session.Add("usuario", usuario);
                    Response.Redirect("Perfil.aspx");
                }
                else
                {
                    Session.Add("error", "Email o contraseña incorrectos");
                    Response.Redirect("Error.aspx");
                }
            }
            catch (System.Threading.ThreadAbortException ex) { }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }
        }
    }
}