using Control;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AppFinal
{
    public partial class Contacto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            try
            {
                Page.Validate();
                if (!Page.IsValid)
                    return;
                if (Validacion.validaTextoVacio(txtEmail) || Validacion.validaTextoVacio(txtAsunto) || Validacion.validaTextoVacio(txtMensaje))
                {
                    Session.Add("error", "Debe completar los campos vacíos");
                    Response.Redirect("Error.aspx", false);
                }
                EmailService service = new EmailService();
                service.armarCorreo(txtEmail.Text, txtAsunto.Text, txtMensaje.Text);
                service.enviarEmail();
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }
        }
    }
}