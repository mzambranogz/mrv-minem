﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmEscenario.aspx.cs" Inherits="MRVMinem.Reportes.frmEscenario" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div style ="text-align:center; border: 5px outset #cccccc; background-color: #cccccc; font-size: 20px;"> </div>
    <div>
    
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <br />
         <br />

        <label><strong>Periodo (Año) : </strong></label>
        <asp:DropDownList ID="ddlAnio" runat="server">
        </asp:DropDownList>
         &nbsp;
        &nbsp;
        &nbsp;
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Mostrar Reporte" BorderStyle="Ridge" />
        <br /><br />
        <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt" InteractiveDeviceInfos="(Colección)" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="98%" Height="7.1in" BackColor="#ECE9E8" DocumentMapWidth="50%">
        </rsweb:ReportViewer>
    
    </div>
    </form>
</body>
</html>
