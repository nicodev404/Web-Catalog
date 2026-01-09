<%@ Page Title="NicoDev Web" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="AppFinal.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row row-cols-1 row-cols-md-3 g-4">
        <asp:Repeater runat="server" ID="Repetidor">
            <ItemTemplate>
                <div class="col">
                    <div class="card">
                        <img src="<%#Eval("UrlImagen")%>" alt="<%#Eval("Nombre")%>" onerror="this.onerror=null;this.src='https://www.afim.com.eg/public/images/no-photo.png';" width="400" height="400" />
                        <div class="card-body">
                            <h4 class="card-title"><%#Eval("Nombre")%></h4>
                            <p class="card-text"><%#Eval("Descripcion")%></p>
                            <div class="d-flex justify-content-between mb-3">
                                <span class="badge rounded-pill text-bg-info"><%#Eval("Marca")%></span>
                                <span class="badge rounded-pill text-bg-info"><%#Eval("Categoria")%></span>
                            </div>
                            <div class="d-flex align-items-center justify-content-between">
                                <h4><%#string.Format(new System.Globalization.CultureInfo("es-AR"), "{0:N2}", Eval("Precio")) %></h4>
                                <asp:Button Text="Ver Detalle" CssClass="btn-1 focus-ring focus-ring-info" runat="server" ID="btnVerDetalle" CommandArgument='<%#Eval("Id")%>' CommandName="ArticuloID" OnClick="btnVerDetalle_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
