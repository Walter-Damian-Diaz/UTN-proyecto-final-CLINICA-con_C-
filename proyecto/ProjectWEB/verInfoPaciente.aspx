﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="verInfoPaciente.aspx.cs" Inherits="ProjectWEB.verInfoCliente" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <h1 class="text-center mt-3 titulo2 my-5">Info de paciente</h1>
    </div>
    <div class="tabla-container">
        <table class="tabla">
            <thead>
                <tr>
                    <th colspan="2" class="cabeza-tabla">Paciente</th>
                </tr>
            </thead>
            <tbody>
                <tr><td><strong>Nombre: </strong></td><td> <%: paciente.nombre %> </td></tr>
                <tr><td><strong>Apellido: </strong></td><td> <%: paciente.apellido %></td></tr>
                <tr><td><strong>DNI: </strong></td><td><%: paciente.dni %> </td></tr>
                <tr><td><strong>Email: </strong></td><td><%: paciente.email %> </td></tr>
                <tr><td><strong>Telefono: </strong></td><td> <%: paciente.telefono %> </td></tr>
                <tr><td><strong>Fecha de nacimiento: </strong></td><td> <%: paciente.fechaNacimiento.ToString("dd-MM-yyyy") %> </td></tr>
                </tbody>
        </table>
    </div>        
</asp:Content>
