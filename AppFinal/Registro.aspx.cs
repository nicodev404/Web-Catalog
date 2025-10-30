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
    public partial class Registro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            UsuarioNegocio negocio = new UsuarioNegocio();
            EmailService service = new EmailService();

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
                Usuario usuario = new Usuario(txtEmail.Text, txtPass.Text, false);
                usuario.Id = negocio.insertarNuevo(usuario);
                Session.Add("usuario", usuario);

                service.armarCorreo(usuario.Email, "Bienvenido/a", "Te damos la bienvenida a Nicocza Store");
                service.enviarEmail();

                Response.Redirect("Perfil.aspx");
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