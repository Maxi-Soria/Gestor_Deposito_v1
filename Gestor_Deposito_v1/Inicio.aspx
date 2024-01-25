<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="Gestor_Deposito_v1.Inicio" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script>
        function navegar(pagina){
            window.location.href = pagina;
        }
    </script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<label for="TipoUsuario" style="display: block; text-align: center; font-size: 20px; margin-bottom: 10px;">Seleccione su tipo de usuario</label>


<div class="container text-center">
  <div class="row justify-content-center">
    <div class="col-md-4">
      <div class="card" style="width: 18rem;">
        <img class="card-img-top" src="https://i.pinimg.com/originals/1f/94/25/1f9425a83e280ef205989a8ff7f471ef.jpg" alt="Card image cap">
        <div class="card-body">
          <h5 class="card-title">Interno</h5>
          <p class="card-text">RMG Empresarial</p>
          <button type="button" class="btn btn-primary" onclick="navegar('Login.aspx')">Interno</button>
        </div>
      </div>
    </div>

   <div class="col-md-4">
  <div class="card" style="width: 18rem;">
    <img class="card-img-top" src="https://cdn1.vectorstock.com/i/1000x1000/86/45/client-word-text-with-handwritten-rainbow-vibrant-vector-23928645.jpg" alt="Card image cap" style="width: 285px; height: 285px; object-fit: cover;">
    <div class="card-body">
      <h5 class="card-title">Cliente</h5>
      <p class="card-text">Servicio exclusivo para clientes</p>
      <button type="button" class="btn btn-primary" onclick="navegar('Login.aspx')">Externo</button>
    </div>
  </div>
</div>



</asp:Content>

