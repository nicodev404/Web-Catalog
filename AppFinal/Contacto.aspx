<%@ Page Title="Contacto" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Contacto.aspx.cs" Inherits="AppFinal.Contacto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Styles/Contacto.css" rel="stylesheet" />
    <script>
        function Validar() {
            const txtEmail = document.getElementById("txtEmail");
            const txtAsunto = document.getElementById("txtAsunto");
            const txtMensaje = document.getElementById("txtMensaje");
            if (txtEmail.value == "") {
                txtEmail.classList.add("is-invalid");
                return false;
            }
            txtEmail.classList.remove("is-invalid");
            txtEmail.classList.add("is-valid");
            if (txtAsunto.value == "") {
                txtAsunto.classList.add("is-invalid");
                return false;
            }
            txtAsunto.classList.remove("is-invalid");
            txtAsunto.classList.add("is-valid");
            if (txtMensaje.value == "") {
                txtMensaje.classList.add("is-invalid");
                return false;
            }
            txtMensaje.classList.remove("is-invalid");
            txtMensaje.classList.ad("is-valid");
            return true;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="contact-form">
        <div class="form-group">
            <asp:Label ID="lblEmail" Font-Bold="true" Font-Size="X-Large" CssClass="form-label" runat="server" Text="Email"></asp:Label>
            <asp:TextBox ID="txtEmail" ClientIDMode="Static" CssClass="form-control" BackColor="#333333" BorderColor="#0dcaf0" ForeColor="White" runat="server"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:Label ID="lblAsunto" Font-Bold="true" Font-Size="X-Large" CssClass="form-label" runat="server" Text="Asunto"></asp:Label>
            <asp:TextBox ID="txtAsunto" ClientIDMode="Static" CssClass="form-control" BackColor="#333333" BorderColor="#0dcaf0" ForeColor="White" runat="server"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:Label ID="lblMensaje" Font-Bold="true" Font-Size="X-Large" CssClass="form-label" runat="server" Text="Mensaje"></asp:Label>
            <asp:TextBox ID="txtMensaje" ClientIDMode="Static" TextMode="MultiLine" CssClass="form-control" BackColor="#333333" BorderColor="#0dcaf0" ForeColor="White" runat="server"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:Button ID="btnEnviar" CssClass="btn-2 focus-ring focus-ring-info" runat="server" Text="Enviar" OnClientClick="return Validar()" OnClick="btnEnviar_Click" />
        </div>
    </div>
</asp:Content>
