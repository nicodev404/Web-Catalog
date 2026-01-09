<%@ Page Title="Detalle del artículo" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="DetalleArticulo.aspx.cs" Inherits="AppFinal.DetalleArticulo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Styles/FormularioStyle.css" rel="stylesheet" />
    <link href="Styles/Botones.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="formulario">
        <div class="formulario-articulo">

            <div class="mb-3">
                <label for="txtCodigo" class="form-label">Código</label>
                <asp:TextBox runat="server" ID="txtCodigo" CssClass="form-control" />
            </div>
            <div class="mb-3">
                <label for="txtNombre" class="form-label">Nombre</label>
                <asp:TextBox runat="server" ID="txtNombre" CssClass="form-control" />
            </div>
            <div class="mb-3">
                <label for="ddlMarca" class="form-label">Marca</label>
                <asp:DropDownList ID="ddlMarca" CssClass="form-select" BackColor="#333333" ForeColor="White" Font-Bold="true" runat="server"></asp:DropDownList>
            </div>
            <div class="mb-3">
                <label for="ddlCategoria" class="form-label">Categoría</label>
                <asp:DropDownList ID="ddlCategoria" CssClass="form-select" BackColor="#333333" ForeColor="White" Font-Bold="true" runat="server"></asp:DropDownList>
            </div>
            <div class="mb-3">
                <label for="txtPrecio" class="form-label">Precio</label>
                <asp:TextBox runat="server" ID="txtPrecio" CssClass="form-control" />
            </div>
            <div class="formulario-accion">
                <div class="botones-accion">
                    <asp:Button ID="btnFav" CssClass="btn btn-outline-info" runat="server" Text="❤️" />
                </div>
            </div>
        </div>
        <div class="formulario-columna derecha">
            <div class="mb-3">
                <label for="txtDescripcion" class="form-label">Descripción</label>
                <asp:TextBox runat="server" TextMode="MultiLine" Rows="2" ID="txtDescripcion" CssClass="form-control" />
            </div>
            <div class="mb-3">
                <label for="txtURLImagen" class="form-label">Imágen</label>
            </div>
            <asp:Image ImageUrl="https://www.afim.com.eg/public/images/no-photo.png" runat="server" ID="imgArticulo"
                Width="400px" Long="200px" />
        </div>
    </div>
</asp:Content>
