<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="clientes_crud.aspx.cs" Inherits="Gestor_Deposito_v1.VistasCrud.clientes_crud" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-3">
        <h2>Listado de Clientes y prueba de rama crud_clientes</h2>
        <hr />


        <div class="mb-3">
            <asp:Button runat="server" ID="Button1" CssClass="btn btn-primary" Text="Nuevo Cliente" OnClick="Button1_Click" />
        </div>


        <asp:GridView runat="server" ID="gvClientes" CssClass="table table-bordered table-hover table-striped table-dark" AutoGenerateColumns="false" >
            <Columns>

                <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" />
                <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                <asp:BoundField DataField="Apellido" HeaderText="Apellido" SortExpression="Apellido" />
                <asp:BoundField DataField="NombreFantasia" HeaderText="Nombre Fantasía" SortExpression="NombreFantasia" />
                <asp:BoundField DataField="Cuit" HeaderText="Cuit" SortExpression="Cuit" />
                <asp:BoundField DataField="DatosFacturacion" HeaderText="Datos Facturación" SortExpression="DatosFacturacion" />
                <asp:BoundField DataField="Direccion" HeaderText="Dirección" SortExpression="Direccion" />
                <asp:BoundField DataField="Id_TipoCliente" HeaderText="ID Tipo Cliente" SortExpression="Id_TipoCliente" />
                <asp:BoundField DataField="Aclaracion" HeaderText="Aclaración" SortExpression="Aclaracion" />
                <asp:BoundField DataField="Estado" HeaderText="Estado" SortExpression="Estado" />


                <asp:TemplateField HeaderText="Acciones">
                    <ItemTemplate>
                        <div class="btn-group btn-group-sm">

                            
                            
                            <asp:LinkButton ID="LinkButton1" runat="server"><i class="bi bi-eye btn btn-success"></i></asp:LinkButton>
                            <asp:LinkButton ID="LinkButton2" runat="server"><i class="bi bi-pen btn btn-warning ms-1 me-1"></i></asp:LinkButton>
                            <asp:LinkButton ID="LinkButton3" runat="server"><i class="bi bi-trash3 btn btn-danger "></i></asp:LinkButton>


                        </div>
                    </ItemTemplate>
                </asp:TemplateField>

            </Columns>
        </asp:GridView>

    </div>
</asp:Content>

