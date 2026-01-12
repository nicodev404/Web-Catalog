<%@ Page Title="Marcas y categorías" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="MarcasCategorias.aspx.cs" Inherits="AppFinal.MarcasCategorias" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        function ValidarMarca() {
            const txtAgregarMarca = document.getElementById("txtAgregarMarca");
            if (txtAgregarMarca.value == "") {
                txtAgregarMarca.classList.add("is-invalid");
                return false;
            }
            txtAgregarMarca.classList.remove("is-invalid");
            txtAgregarMarca.classList.add("is-valid");
            return true;
        }
        function ValidarCategoria() {
            const txtAgregarCategoria = document.getElementById("txtAgregarCategoria");
            if (txtAgregarCategoria.value == "") {
                txtAgregarCategoria.classList.add("is-invalid");
                return false;
            }
            txtAgregarCategoria.classList.remove("is-invalid");
            txtAgregarCategoria.classList.add("is-valid");
            return true;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:ScriptManager ID="ScriptManager1" runat="server" />

    <div class="row">
        <div class="col-6">
            <div class="mb-3">
                <asp:Label runat="server" Text="Agrega una Marca:" Font-Size="Medium" CssClass="form-label" Width="300px"></asp:Label>
                <asp:TextBox ID="txtAgregarMarca" ClientIDMode="Static" runat="server" CssClass="form-control" BorderColor="#0dcaf0"></asp:TextBox>
            </div>
            <div class="mb-3">
                <asp:Button ID="btnAgregarMarca" CssClass="btn-2 focus-ring focus-ring-success" BackColor="#198754" ForeColor="White" runat="server" Text="Agregar" OnClientClick="return ValidarMarca()" OnClick="btnAgregarMarca_Click" />
            </div>
            <div class="mb-3">
                <asp:Label runat="server" Text="Agrega una Categoría:" Font-Size="Medium" CssClass="form-label" Width="300px"></asp:Label>
                <asp:TextBox ID="txtAgregarCategoria" ClientIDMode="Static" runat="server" CssClass="form-control" BorderColor="#0dcaf0"></asp:TextBox>
            </div>
            <div class="mb-3">
                <asp:Button ID="btnAgregarCategoria" CssClass="btn-2 focus-ring focus-ring-success" BackColor="#198754" ForeColor="White" runat="server" Text="Agregar" OnClientClick="return ValidarCategoria()" OnClick="btnAgregarCategoria_Click" />
            </div>
        </div>
        <div class="col-6">
            <div class="mb-3">
                <asp:Label runat="server" Text="Elimina una Marca:" Font-Size="Medium" CssClass="form-label" Width="300px"></asp:Label>
                <asp:DropDownList ID="ddlMarca" CssClass="form-select" BackColor="#666666" ForeColor="White" Font-Bold="true" runat="server"></asp:DropDownList>
            </div>
            <div class="mb-3">
                <asp:Button ID="btnEliminarMarca" CssClass="btn-2 focus-ring focus-ring-warning" ForeColor="Black" BackColor="#ffc107" runat="server" Text="Eliminar" OnClick="btnEliminarMarca_Click" />
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <%if (confirmaElimMarca)
                            {%>
                        <asp:CheckBox ID="chkConfirmaEliminarMarca" Text="Confirmar eliminación" runat="server" />
                        <asp:Button ID="btnConfirmaEliminarMarca" CssClass="btn-2 focus-ring focus-ring-danger" ForeColor="Black" BackColor="#dc3545" runat="server" Text="Eliminar" OnClick="btnConfirmaEliminarMarca_Click" />
                        <%} %>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
            <div class="mb-3">
                <asp:Label runat="server" Text="Elimina una Categoria:" Font-Size="Medium" CssClass="form-label" Width="300px"></asp:Label>
                <asp:DropDownList ID="ddlCategoria" CssClass="form-select" BackColor="#666666" ForeColor="White" Font-Bold="true" runat="server"></asp:DropDownList>
            </div>
            <div class="mb-3">
                <asp:Button ID="btnEliminarCategoria" CssClass="btn-2 focus-ring focus-ring-warning" ForeColor="Black" BackColor="#ffc107" runat="server" Text="Eliminar" OnClick="btnEliminarCategoria_Click" />
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <%if (confirmaElimCat)
                            { %>
                        <asp:CheckBox ID="chkConfirmaEliminarCat" Text="Confirmar eliminación" runat="server" />
                        <asp:Button ID="btnConfirmaEliminarCat" CssClass="btn-2 focus-ring focus-ring-danger" ForeColor="black" BackColor="#dc3545" runat="server" Text="Eliminar" OnClick="btnConfirmaEliminarCat_Click" />
                        <%} %>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>
</asp:Content>
