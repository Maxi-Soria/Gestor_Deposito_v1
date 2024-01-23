<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Gestor_Deposito_v1.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <form>
  <div class="form-group">
    <label for="InputUsuario">Usuario</label>
    <input type="user" class="form-control" id="exampleInputUsuario" aria-describedby="usuarioHelp">
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Contraseña</label>
    <input type="password" class="form-control" id="exampleInputContraseña">
  </div>
  <div class="form-check">
  </div>
  <button type="submit" class="btn btn-primary">Ingresar</button>
  <button type="submit" class="btn btn-primary">Olvide mi contraseña</button>
</form>

</asp:Content>
