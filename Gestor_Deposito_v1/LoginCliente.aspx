<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="LoginCliente.aspx.cs" Inherits="Gestor_Deposito_v1.LoginCliente" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <form>
  <div class="form-group">
    <label for="InputUsuario">Usuario</label>
    <asp:TextBox ID="txtUsuario" runat="server" CssClass="form-control" aria-describedby="usuarioHelp"></asp:TextBox>
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Contraseña</label>
<asp:TextBox ID="txtContraseña" runat="server" CssClass="form-control" aria-describedby="contraseñaHelp" TextMode="Password"></asp:TextBox>
  </div>
  <div class="form-check">
  </div>
<asp:Button ID="btnIngresar" runat="server" Text="Ingresar" CssClass="btn btn-primary" OnClick="btnIngresar_Click" />
  <button type="submit" class="btn btn-primary">Olvide mi contraseña</button>
</form>

</asp:Content>
