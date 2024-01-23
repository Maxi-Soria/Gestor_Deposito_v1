<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Ayuda.aspx.cs" Inherits="Gestor_Deposito_v1.Ayuda" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<label for="InputAyuda">Descripción del problema</label>
    <br />
<div class="form-group">
    <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
  </div>
    <br />
     <button type="submit" class="btn btn-primary">Crear ticket</button>
    <button type="submit" class="btn btn-primary">Cancelar</button>

</asp:Content>
