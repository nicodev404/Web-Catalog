<%@ Page Title="Registrarse" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="AppFinal.Registro" %>

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
            <h3 class="text-center">Registrarse</h3>
            <div class="form-group">
                <asp:Label ID="lblEmail" Font-Size="Medium" CssClass="form-group-label" runat="server" Text="Email"></asp:Label>
                <asp:TextBox ID="txtEmail" ClientIDMode="Static" CssClass="form-control" BorderColor="#212529" runat="server" Placeholder="email@email.com"></asp:TextBox>
                <asp:RegularExpressionValidator CssClass="Validacion" ErrorMessage="Formato email requerido" ControlToValidate="txtEmail" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$" runat="server" />
            </div>
            <div class="form-group">
                <asp:Label ID="lblPass" Font-Size="Medium" CssClass="form-group-label" runat="server" Text="Contraseña"></asp:Label>
                <asp:TextBox ID="txtPass" ClientIDMode="Static" CssClass="form-control" BorderColor="#212529" TextMode="Password" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Button ID="btnRegistrar" CssClass="btn btn-outline-dark" runat="server" Text="Registrarse" OnClientClick="return Validar()" OnClick="btnRegistrar_Click" />
            </div>
        </div>
    </div>

</asp:Content>
