<%@ Page Title="Contacto" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Contacto.aspx.cs" Inherits="AppFinal.Contacto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Styles/Contacto.css" rel="stylesheet" />
    <script>
        function Validar() {
            const txtEmail = document.getElementById("txtEmail");
            const txtAsunto = document.getElementById("txtAsunto");
            const txtMensaje = document.getElementById("txtMensaje");
            if (txtEmail.value == "") {
                txtEmail.classList.add("is-invalid");
                return false;
            }
            txtEmail.classList.remove("is-invalid");
            txtEmail.classList.add("is-valid");
            if (txtAsunto.value == "") {
                txtAsunto.classList.add("is-invalid");
                return false;
            }
            txtAsunto.classList.remove("is-invalid");
            txtAsunto.classList.add("is-valid");
            if (txtMensaje.value == "") {
                txtMensaje.classList.add("is-invalid");
                return false;
            }
            txtMensaje.classList.remove("is-invalid");
            txtMensaje.classList.ad("is-valid");
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

    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-12 col-md-4">
                <div class="card shadow-sm p-4">
                    <h3 class="mb-3">Contáctanos</h3>
                    <div class="mb-3">
                        <asp:Label ID="lblEmail" Font-Size="Medium" CssClass="form-label" runat="server" Text="Email"></asp:Label>
                        <asp:TextBox ID="txtEmail" ClientIDMode="Static" CssClass="form-control" BorderColor="#0dcaf0" runat="server" Placeholder="email@gmail.com"></asp:TextBox>
                        <asp:RegularExpressionValidator CssClass="Validacion" ErrorMessage="Formato email requerido" ControlToValidate="txtEmail" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$" runat="server" />
                    </div>
                    <div class="mb-3">
                        <asp:Label ID="lblAsunto"  Font-Size="Medium" CssClass="form-label" runat="server" Text="Asunto"></asp:Label>
                        <asp:TextBox ID="txtAsunto" ClientIDMode="Static" CssClass="form-control" BorderColor="#0dcaf0" runat="server"></asp:TextBox>
                    </div>
                    <div class="mb-3">
                        <asp:Label ID="lblMensaje" Font-Size="Medium" CssClass="form-label" runat="server" Text="Mensaje"></asp:Label>
                        <asp:TextBox ID="txtMensaje" ClientIDMode="Static" TextMode="MultiLine" CssClass="form-control" BorderColor="#0dcaf0" runat="server"></asp:TextBox>
                    </div>
                    <div class="mb-3">
                        <asp:Button ID="btnEnviar" CssClass="btn-2 focus-ring focus-ring-info" runat="server" Text="Enviar" OnClientClick="return Validar()" OnClick="btnEnviar_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
