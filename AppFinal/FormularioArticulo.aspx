<%@ Page Title="Formulario del artículo" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="FormularioArticulo.aspx.cs" Inherits="AppFinal.FormularioArticulo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Styles/FormularioStyle.css" rel="stylesheet" />
    <link href="Styles/Botones.css" rel="stylesheet" />
    <script>
        function Validar() {
            const txtCodigo = document.getElementById("txtCodigo");
            const txtNombre = document.getElementById("txtNombre");
            const txtPrecio = document.getElementById("txtPrecio");
            if (txtCodigo.value == "") {
                txtCodigo.classList.add("is-invalid")
                return false;
            }
            txtCodigo.classList.remove("is-invalid")
            txtCodigo.classList.add("is-valid")
            if (txtNombre.value == "") {
                txtNombre.classList.add("is-invalid");
                return false
            }
            txtNombre.classList.remove("is-invalid");
            txtNombre.classList.add("is-valid");
            if (txtPrecio.value == "") {
                txtPrecio.classList.add("is-invalid");
                return false;
            }
            txtPrecio.classList.remove("is-invalid");
            txtPrecio.classList.add("is-valid");
            return true;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:ScriptManager ID="ScriptManager1" runat="server" />

    <div class="formulario">
        <div class="formulario-articulo">

            <div class="mb-3">
                <label for="txtId" class="form-label">Id</label>
                <asp:TextBox runat="server" ID="txtId" CssClass="form-control" />
            </div>
            <div class="mb-3">
                <label for="txtCodigo" class="form-label">Código</label>
                <asp:TextBox ClientIDMode="Static" runat="server" ID="txtCodigo" CssClass="form-control" />
            </div>
            <div class="mb-3">
                <label for="txtNombre" class="form-label">Nombre</label>
                <asp:TextBox ClientIDMode="Static" runat="server" ID="txtNombre" CssClass="form-control" />
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
                <asp:TextBox ClientIDMode="Static" runat="server" ID="txtPrecio" CssClass="form-control" />
            </div>
            <div class="formulario-accion">
                <div class="botones-accion">
                    <asp:Button ID="btnAceptar" runat="server" Text="Agregar" CssClass="btn-2 focus-ring focus-ring-success" BackColor="#198754" ForeColor="White" OnClientClick="return Validar()" OnClick="btnAceptar_Click" />

                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" CssClass="btn-2 focus-ring focus-ring-warning" BackColor="#ffc107" ForeColor="black" OnClick="btnEliminar_Click" />
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>

            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                    <%if (ConfirmaElimincaion)
                        { %>
                    <div class="mb-3">
                        <asp:CheckBox Text="Confirmar eliminación" Font-Bold="true" ID="chkConfirmarEliminacion" runat="server" />
                        <asp:Button ID="btnConfirmarEliminacion" runat="server" Text="Eliminar" CssClass="btn-2 focus-ring focus-ring-danger" BackColor="#dc3545" ForeColor="Black" OnClick="btnConfirmarEliminacion_Click" />
                    </div>
                    <%} %>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>

        <div class="formulario-columna derecha">
            <div class="mb-3">
                <label for="txtDescripcion" class="form-label">Descripción</label>
                <asp:TextBox runat="server" TextMode="MultiLine" Rows="2" ID="txtDescripcion" CssClass="form-control" />
            </div>
            <asp:UpdatePanel ID="updtpnlImagen" runat="server">
                <ContentTemplate>
                    <div class="mb-3">
                        <label for="txtURLImagen" class="form-label">URL Imágen</label>
                        <asp:TextBox runat="server" ID="txtURLImagen" CssClass="form-control"
                            AutoPostBack="true" OnTextChanged="txtURLImagen_TextChanged" />
                    </div>
                    <asp:Image ImageUrl="https://www.afim.com.eg/public/images/no-photo.png" runat="server" ID="imgArticulo"
                        Width="400px" Long="200px" />
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
</asp:Content>
