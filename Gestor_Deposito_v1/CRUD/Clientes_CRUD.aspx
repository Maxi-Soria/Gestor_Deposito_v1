<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Clientes_CRUD.aspx.cs" Inherits="Gestor_Deposito_v1.CRUD.Clientes_CRUD" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <form runat="server">
        <br />
        <div class="mx-auto" style="width:300px">
            <h2>Listado de registros</h2>
        </div>
        <br />
        <div class="container">
            <div class="row">
                <div class="col align-self-end">
                    <asp:Button runat="server" ID="BtnCreate" CssClas="btn btn-sucess form-control" text="Crear"/>
                </div>
            </div>
        </div>
        <br />
        <div class="container row">
            <div class="table small">
                <asp:GridView runat="server" ID="gvusuarios" CssClass="table table-borderless table-hover">
                    <Columns>
                        <asp:TemplateField HeaderText="">
                            <asp:ItemTemplate>
                                <asp:Button runat="server" Text="Ver" class="btn form-control btn-info" ID="BtnRead" />
                                <asp:Button runat="server" Text="Modificar" class="btn form-control btn-info" ID="BtnUpdate" />
                                <asp:Button runat="server" Text="Eliminar" class="btn form-control btn-info" ID="BtnDelete"/>
                            </asp:ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </form>
</asp:Content>
