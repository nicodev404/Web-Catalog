<%@ Page Title="Gestión de artículos" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Gestion.aspx.cs" Inherits="AppFinal.Gestion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:ScriptManager ID="ScriptManager1" runat="server" />

    <div class="mb-3">
        <asp:Label runat="server" Text="Filtrar" CssClass="form-label" Font-Size="X-Large"></asp:Label>
        <asp:TextBox ID="txtFiltro" AutoPostBack="true" OnTextChanged="txtFiltro_TextChanged" CssClass="form-control" Width="300px" BorderColor="#0dcaf0" runat="server" Placeholder="nombre, código..."/>
    </div>
    <div class="col-6" style="display: flex; flex-direction: column; justify-content: flex-end">
        <div class="mb-3">
            <asp:CheckBox ID="chkFiltroAvanzado" Text="Filtro Avanzado" runat="server" AutoPostBack="true" OnCheckedChanged="chkFiltroAvanzado_CheckedChanged" />
            <asp:Button ID="btnLimpiarFiltro" CssClass="btn-2 focus-ring focus-ring-info" ForeColor="#dcaf0" runat="server" Text="Recargar" OnClick="btnLimpiarFiltro_Click" />
        </div>
    </div>
    <%if (chkFiltroAvanzado.Checked)
        {%>
    <div class="row">
        <div class="col-3">
            <div class="mb-3">
                <asp:Label runat="server" Text="Campo" CssClass="form-label"></asp:Label>
                <asp:DropDownList ID="ddlCampos" CssClass="form-select" AutoPostBack="true" OnSelectedIndexChanged="ddlCampos_SelectedIndexChanged" runat="server">
                    <asp:ListItem Text="Marca" />
                    <asp:ListItem Text="Categoría" />
                    <asp:ListItem Text="Precio" />
                </asp:DropDownList>
            </div>
        </div>
        <div class="col-3">
            <div class="mb-3">
                <asp:Label runat="server" Text="Criterio" CssClass="form-label"></asp:Label>
                <asp:DropDownList ID="ddlCriterio" CssClass="form-control" runat="server"></asp:DropDownList>
            </div>
        </div>
        <div class="col-3">
            <div class="mb-3">
                <asp:Label runat="server" Text="Filtro"></asp:Label>
                <asp:TextBox ID="txtFiltroAvanzado" runat="server" CssClass="form-control" BorderColor="#0dcaf0"></asp:TextBox>
            </div>
        </div>
        <div class="row">
            <div class="col-3">
                <div class="mb-3">
                    <asp:Button ID="btnBuscar" CssClass="btn-2 focus-ring focus-ring-info" ForeColor="#0dcaf0" runat="server" Text="Buscar" OnClick="btnBuscar_Click" />
                </div>
            </div>
        </div>
    </div>
    <%}%>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:GridView runat="server" ID="dgvArticulos" DataKeyNames="Id" OnSelectedIndexChanged="dgvArticulos_SelectedIndexChanged" CssClass="table table-bordered"
                AutoGenerateColumns="false" OnPageIndexChanging="dgvArticulos_PageIndexChanging" AllowPaging="true" PageSize="8" HeaderStyle-HorizontalAlign="Center"
                RowStyle-HorizontalAlign="Center" HeaderStyle-BorderColor="#0dcaf0" HeaderStyle-Font-Bold="true" PagerStyle-BackColor="#0dcaf0">
                <Columns>
                    <asp:BoundField HeaderText="Código" DataField="Codigo" />
                    <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
                    <asp:BoundField HeaderText="Descripción" DataField="Descripcion" />
                    <asp:BoundField HeaderText="Marca" DataField="Marca" />
                    <asp:BoundField HeaderText="Categoría" DataField="Categoria" />
                    <asp:BoundField HeaderText="Precio" DataField="Precio" DataFormatString="{0:F2}" />
                    <asp:CommandField ShowSelectButton="true" SelectText="✏️" HeaderText="Acción" />
                </Columns>
            </asp:GridView>
        </ContentTemplate>
    </asp:UpdatePanel>

    <asp:Button ID="btnIrAFormulario" runat="server" Text="Agregar Artículo" CssClass="btn-2 focus-ring focus-ring-info" ForeColor="#0dcaf0" OnClick="btnIrAFormulario_Click" />
    <asp:Button ID="btnIrAgregarMyC" runat="server" Text="Gestionar Marcas/Categorías" CssClass="btn-2 focus-ring focus-ring-info" ForeColor="#0dcaf0" OnClick="btnIrAgregarMyC_Click" />
</asp:Content>
