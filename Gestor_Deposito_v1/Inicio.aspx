<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="Gestor_Deposito_v1.Inicio" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script>
        function navegar(pagina){
            window.location.href = pagina;
        }
    </script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<label for="TipoUsuario">Seleccione su tipo de usuario</label>

<button type="button" class="btn btn-primary" onclick="navegar('Login.aspx')">Interno</button>

<button type="button" class="btn btn-primary" onclick="navegar('Login.aspx')">Externo</button>

</asp:Content>

