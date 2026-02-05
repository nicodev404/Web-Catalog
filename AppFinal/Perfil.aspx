<%@ Page Title="Perfil" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Perfil.aspx.cs" Inherits="AppFinal.Perfil" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script>
        function Validar() {
            const txtNombre = document.getElementById("txtNombre");
            const txtApellido = document.getElementById("txtApellido");
            if (txtNombre.value == "") {
                txtNombre.classList.add("is-invalid");
                return false;
            }
            txtNombre.classList.remove("is-invalid");
            txtNombre.classList.add("is-valid");
            if (txtApellido.value == "") {
                txtApellido.classList.add("is-invalid");
                return false;
            }
            txtApellido.classList.remove("is-invalid");
            txtApellido.classList.add("is-valid");
            return true;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="perfil-horizontal">
        <div class="perfil-info">
            <h3 class="text-center">Mi perfil</h3>
            <div class="form-group">
                <asp:Label ID="lblEmail" CssClass="form-group-label" Font-Size="Medium" runat="server" Text="Email"></asp:Label>
                <asp:TextBox ID="txtEmail" CssClass="form-control" BorderColor="#212529" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="lblNombre" CssClass="form-group-label" Font-Size="Medium" runat="server" Text="Nombre"></asp:Label>
                <asp:TextBox ID="txtNombre" ClientIDMode="Static" CssClass="form-control" BorderColor="#212529" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="lblApellido" CssClass="form-group-label" Font-Size="Medium" runat="server" Text="Apellido"></asp:Label>
                <asp:TextBox ID="txtApellido" ClientIDMode="Static" CssClass="form-control" BorderColor="#212529" runat="server"></asp:TextBox>
            </div>
            <div class="perfil-btn">
                <asp:Button ID="btnGuardar" CssClass="btn btn-outline-dark" runat="server" Text="Guardar" OnClientClick="return Validar()" OnClick="btnGuardar_Click" />
                <a href="Default.aspx" class="btn btn-outline-dark">Volver al catálogo</a>
            </div>
        </div>
        <div class="perfil-foto-seccion">
            <asp:Label ID="lblImagen" CssClass="form-group-label" runat="server" Text="Imágen de perfil"></asp:Label>
            <input type="file" id="txtImagen" class="form-control mb-2" runat="server" />
            <asp:Image ID="imgNuevoPerfil" CssClass="img-circle-perfil" ImageUrl="https://www.afim.com.eg/public/images/no-photo.png" runat="server" />
        </div>
    </div>
</asp:Content>
