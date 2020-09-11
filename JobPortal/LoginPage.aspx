<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="JobPortal.LoginPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style2 {
            width: 44px;
        }
        .auto-style4 {
            height: 25px;
        }
        .auto-style6 {
            width: 73px;
        }
        .auto-style7 {
            height: 25px;
            width: 203px;
        }
        .auto-style8 {
            width: 203px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Login Page</h1>
    <table>
        <tr>
            <td class="auto-style2" rowspan="4">
                <asp:Image ID="Image2" runat="server" Height="130px" ImageUrl="~/imgHeader/jobportal44.jpg" Width="273px" />
            </td>
            <td class="auto-style4">
                <asp:Label ID="lblEmail" runat="server" Text="Email" ></asp:Label>
            </td>
            <td class="auto-style7"><asp:TextBox ID="txtEmail" runat="server"></asp:TextBox></td>
            <td class="auto-style6" rowspan="4">
                <asp:Image ID="Image1" runat="server" Height="116px" ImageUrl="~/imgHeader/jobportal22.jpg" Width="306px" />
            </td>
        </tr>
        <tr>
            <td><asp:Label ID="lblPass" runat="server" Text="Password"></asp:Label> </td>
            <td class="auto-style8"><asp:TextBox ID="txtPass" runat="server" TextMode="Password"></asp:TextBox></td>
        </tr>
        <tr>
           <td></td>
            <td class="auto-style8"><asp:LinkButton ID="btnLogin" Text="Login" runat="server" OnClick="btnLogin_Click"></asp:LinkButton></td>
        </tr>
        <tr>
            <td></td>
            <td class="auto-style8"><asp:Label ID="lblmessg" runat="server" ></asp:Label></td>
        </tr>
    </table>
</asp:Content>
