<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AddStatePage.aspx.cs" Inherits="JobPortal.AddStatePage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
        <tr>
            <td>Select Country</td>
            <td><asp:DropDownList ID="ddlcountry" runat="server">

                </asp:DropDownList></td>
        </tr>
        <tr>
            <td>State Name</td>
            <td><asp:TextBox ID="txtstate" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td></td>
            <td><asp:Button ID="btnSubmit" Text="SAVE" runat="server" OnClick="btnSubmit_Click" /></td>
        </tr>
        <tr>
            <td></td>
            <td>
                <asp:DropDownList runat="server" ID="ddlShowcountry" OnSelectedIndexChanged="ddlShowcountry_SelectedIndexChanged" AutoPostBack="true">
                    
                    
                </asp:DropDownList></td>
        </tr>
         <tr>
            <td></td>
            <td><asp:GridView ID="grd" runat="server" AutoGenerateColumns="false" OnRowCommand="grd_RowCommand" >
                <Columns>
                    <asp:TemplateField HeaderText="State Name">
                        <ItemTemplate>
                            <%#Eval("sName")%>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField >
                        <ItemTemplate>
                            <asp:LinkButton ID="btnDelete" runat="server" Text="Delete" CommandArgument='<%#Eval("id") %>' CommandName="btnDelete"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                </asp:GridView></td>
        </tr>
        <tr>
            <td colspan="2">

                <asp:LinkButton ID="btnShowDeleted" runat="server" OnClick="btnShowDeleted_Click">Show Deleted State</asp:LinkButton>

            </td>
        </tr>

        <tr>
            <td></td>
            <td>
                <asp:DropDownList runat="server" ID="ddlshowDeleted" OnSelectedIndexChanged="ddlshowDeleted_SelectedIndexChanged" AutoPostBack="true">
                    
                    
                </asp:DropDownList></td>
        </tr>
         <tr>
            <td></td>
            <td><asp:GridView ID="grdShowDeleted" runat="server" AutoGenerateColumns="false" OnRowCommand="grdShowDeleted_RowCommand" >
                <Columns>
                    <asp:TemplateField HeaderText="State Name">
                        <ItemTemplate>
                            <%#Eval("sName")%>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField >
                        <ItemTemplate>
                            <asp:LinkButton ID="btnRecover" runat="server" Text="Recover" CommandArgument='<%#Eval("id") %>' CommandName="btnRecover"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                </asp:GridView></td>
        </tr>
    </table>
</asp:Content>
