<%@ Page Title="Ingresar" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="AppFinal.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        function Validar() {
            const txtEmail = document.getElementById("txtEmail");
            const txtPass = document.getElementById("txtPass");
            if (txtEmail.value == "") {
                txtEmail.classList.add("is-invalid");
                return false;
            }
            txtEmail.classList.remove("is-invalid");
            txtEmail.classList.add("is-valid");
            if (txtPass.value == "") {
                txtPass.classList.add("is-invalid");
                return false;
            }
            txtPass.classList.remove("is-invalid");
            txtPass.classList.add("is-valid");
            return true;
        }
    </script>
    <style>
        .Validacion {
            color: red;
            font-size: 12px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="ContenedorContacto">
        <div class="contacto-container">
            <h3 class="text-center">Iniciar sesión</h3>
            <div class="form-group">
                <asp:Label ID="lblEmail" runat="server" CssClass="form-group-label" Text="Email" Font-Size="Medium"></asp:Label>
                <asp:TextBox ID="txtEmail" ClientIDMode="Static" runat="server" CssClass="form-control" BorderColor="#212529" Placeholder="email@email.com"></asp:TextBox>
                <asp:RegularExpressionValidator CssClass="Validacion" ErrorMessage="Formato email requerido" ControlToValidate="txtEmail" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$" runat="server" />
            </div>
            <div class="form-group">
                <asp:Label ID="lblPass" runat="server" CssClass="form-group-label" Text="Contraseña" Font-Size="Medium"></asp:Label>
                <asp:TextBox ID="txtPass" ClientIDMode="Static" runat="server" CssClass="form-control" BorderColor="#212529" TextMode="Password"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Button ID="btnIngresar" runat="server" Text="Ingresar" CssClass="btn btn-outline-dark" OnClientClick="return Validar()" OnClick="btnIngresar_Click" />
            </div>
        </div>
    </div>

</asp:Content>
