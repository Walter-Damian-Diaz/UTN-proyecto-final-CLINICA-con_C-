﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="verTurnos.aspx.cs" Inherits="ProjectWEB.verTurnos1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>



            <div>
                <h1 class="text-center mt-3 titulo2">Listado de turnos</h1>
            </div>
            
            <div class="row">
                <div class="col-sm-3 col-2">
                </div>

                <div class="col-sm-6 col-8 d-flex justify-content-center align-items-center flex-column">
                    <div class="input-group mt-3">
                        <span class="input-group-text" id="basic-addon1"> DNI: </span>
                        <asp:TextBox CssClass="form-control" ID="TextBoxDni" runat="server"></asp:TextBox>
                    </div>
                    <div class="input-group mt-3">
                        <span class="input-group-text" id="basic-addon1"> Fecha: </span>
                        <asp:TextBox CssClass="form-control" ID="TextBoxFecha" runat="server" TextMode="Date"></asp:TextBox>
                    </div>
                    <asp:Button class="btn btn-success mt-3" ID="ButtonBuscar" runat="server" Text="Buscar" OnClick="ButtonBuscar_Click" />
                </div>

                <div class="col-sm-3 col-2">
                </div>
            </div>
            

            <asp:GridView ID="GridViewTurnos" runat="server"
                OnRowDeleting="eliminar_turno" 
                OnRowEditing="GridViewTurnos_RowEditing"
                OnRowCommand="GridViewTurnos_RowCommand"
                OnRowDataBound="GridViewTurnos_RowDataBound"
                OnPageIndexChanging="GridViewTurnos_PageIndexChanging" 
                AllowPaging="true" 
                PageSize="10" 
                DataKeyNames="id" 
                AutoGenerateColumns="false"
                GridLines="None"
                AlternatingRowStyle-CssClass="alternadas"
                CssClass="gv" 
                PagerStyle-CssClass="pgr"
                ShowHeaderWhenEmpty="true">
                    
                    <Columns>

                        <asp:BoundField HeaderText="ID" DataField="id"/>
                        <asp:BoundField HeaderText="Nombre" DataField="paciente.nombre"/>
                        <asp:BoundField HeaderText="Apellido" DataField="paciente.apellido"/>
                        <asp:BoundField HeaderText="DNI" DataField="paciente.dni"/>
                        <asp:BoundField HeaderText="Estado" DataField="estado.nombre"/>
                        <asp:BoundField HeaderText="Fecha" DataField="fecha" DataFormatString="{0:d}"/>


                        <asp:TemplateField HeaderText="Acciones">

                            <ItemTemplate>
                                <div class="d-flex justify-content-center align-items-center justify-content-center flex-row">

                                    <asp:LinkButton CommandName="Delete" OnClientClick="return eliminar_confirmacion(this);" CssClass="eliminarTurno d-none bg-transparent " ID="buttonEliminar" ClientIDMode="Static" runat="server">
                                        <i class="far fa-trash-alt text-light rounded-circle bg-danger p-2" style="font-size:15px;"></i>
                                    </asp:LinkButton>
                                    
                                    <asp:LinkButton CommandName="Edit" ID="buttonEditar" runat="server" CssClass="editarTurno d-none">
                                        <i class="fas fa-user-edit text-light rounded-circle bg-success p-2" style="font-size: 15px;"></i>
                                    </asp:LinkButton>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                    <asp:LinkButton ID="buttonVer" runat="server" CommandName="ver" CommandArgument='<%# Eval("id") %>' >
                                        <i class="far fa-eye text-light rounded-circle bg-primary p-2" style="font-size: 15px;"></i>
                                    </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>

                                
                    <emptydatatemplate>
                        <asp:Label ID="LabelVacio" runat="server" Text="No hay datos" ForeColor="Black"></asp:Label>
                    </emptydatatemplate> 
                    
                
            </asp:GridView>
    
</asp:Content>
