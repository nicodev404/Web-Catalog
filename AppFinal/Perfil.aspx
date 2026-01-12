<%@ Page Title="Perfil" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Perfil.aspx.cs" Inherits="AppFinal.Perfil" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Styles/fotoPerfil.css" rel="stylesheet" />
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

    <div class="container mt-2">
        <div class="row justify-content-center">
            <div class="card shadow-sm p-9">
                <h3 class="mb-3 text-center">Perfil</h3>
                <div class="row mb-3">
                    <div class="col-12 text-center">
                        <asp:Label ID="lblImagen" runat="server" Text="Imágen de perfil"></asp:Label>
                        <input type="file" id="txtImagen" class="form-control mb-2" runat="server" />
                        <asp:Image ID="imgNuevoPerfil" CssClass="img-fluid mb-3 imgPerfil rounded-circle" Width="200px" Height="200px" ImageUrl="https://www.afim.com.eg/public/images/no-photo.png" runat="server" />
                    </div>
                    <div class="col">
                        <div class="mb-3">
                            <asp:Label ID="lblEmail" CssClass="form-label" Font-Size="Medium" runat="server" Text="Email"></asp:Label>
                            <asp:TextBox ID="txtEmail" CssClass="form-control" BorderColor="#0dcaf0" runat="server"></asp:TextBox>
                        </div>
                        <div class="mb-3">
                            <asp:Label ID="lblNombre" CssClass="form-label" Font-Size="Medium" runat="server" Text="Nombre"></asp:Label>
                            <asp:TextBox ID="txtNombre" ClientIDMode="Static" CssClass="form-control" BorderColor="#0dcaf0" runat="server"></asp:TextBox>
                        </div>
                        <div class="mb-3">
                            <asp:Label ID="lblApellido" CssClass="form-label" Font-Size="Medium" runat="server" Text="Apellido"></asp:Label>
                            <asp:TextBox ID="txtApellido" ClientIDMode="Static" CssClass="form-control" BorderColor="#0dcaf0" runat="server"></asp:TextBox>
                        </div>
                        <asp:Button ID="btnGuardar" CssClass="btn-2 focus-ring focus-ring-info" ForeColor="#0dcaf0" runat="server" Text="Guardar" OnClientClick="return Validar()" OnClick="btnGuardar_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
