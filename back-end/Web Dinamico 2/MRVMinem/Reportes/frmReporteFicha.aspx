<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmReporteFicha.aspx.cs" Inherits="MRVMinem.Reportes.frmReporteFicha" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="text-align: center; border: 5px outset #cccccc; background-color: #cccccc; font-size: 20px;"></div>
        <div>

            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <br />
            <br />


            <label><strong>Periodo (Año): </strong></label>
            <asp:DropDownList ID="ddlAnio" runat="server">
            </asp:DropDownList>
            &nbsp;
        &nbsp;
        &nbsp;
        <label><strong>Medida de Mitigación : </strong></label>
            <asp:DropDownList ID="ddlMedMit" runat="server" Height="20px" Width="250px">
            </asp:DropDownList>
            &nbsp;
        &nbsp;
        &nbsp;
        <asp:Button ID="btnReporte" runat="server" OnClick="btnReporte_Click" Text="Mostrar Reporte" BorderStyle="Ridge" />
            <br />
            <br />
            <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt" InteractiveDeviceInfos="(Colección)" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="98%" Height="7.1in" BackColor="#ECE9E8" DocumentMapWidth="50%" Visible="False">
                <LocalReport ReportPath="Reportes\rptFichaMinam.rdlc">
                </LocalReport>
            </rsweb:ReportViewer>

        </div>
    </form>
</body>
</html>
