<%@ Page Title="Detalle del artículo" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="DetalleArticulo.aspx.cs" Inherits="AppFinal.DetalleArticulo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Styles/DetalleArticulo.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="articulo-detalles-container">
        <div class="articulo-card">
            <div class="articulo-imagen-seccion">
                <asp:Image ID="imgArticulo" runat="server" CssClass="img-fluid main-product-img" />
            </div>
            <div class="articulo-info-seccion">
                <span class="articulo-categoria"><%: articulo.Categoria.Descripcion %></span>
                <h1 class="articulo-title"><%: articulo.Nombre %></h1>
                <p class="product-brand">Marca: <strong><%: articulo.Marca.Descripcion %></strong></p>
                <div class="articulo-precio">
                    <span class="currency">$</span>
                    <span class="amount"><%: articulo.Precio.ToString("N2") %></span>
                </div>
                <div class="articulo-descripcion">
                    <h5>Descripción</h5>
                    <p><%: articulo.Descripcion %></p>
                </div>
                <div class="product-meta">
                    <small class="text-muted">Código de producto: <%: articulo.Codigo %></small>
                </div>
                <div class="articulo-accion">
                    <a href="Default.aspx" class="btn btn-outline-dark">Volver al catálogo</a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
