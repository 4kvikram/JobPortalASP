<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="SecurityQuestionPage.aspx.cs" Inherits="JobPortal.SecurityQuestionPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
function checkvalidation()
{
    var a = getelementbyid();
}
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1><u>Add Security Question</u></h1>
    <table>


        <tr>
            <td>
                <asp:Label ID="lblSecQ" runat="server" Text="Enter Security Question "></asp:Label></td>
            <td>
                <asp:TextBox ID="txtSecQ" runat="server"></asp:TextBox></td>
        </tr>

        <tr>
            <td></td>
            <td>
                <asp:Button ID="btnSave" runat="server" Text="ADD" OnClick="btnSave_Click" OnClientClick="return checkvalidation()" /></td>
        </tr>

        <tr>
            <td colspan="2">
                <asp:GridView ID="gd" runat="server" OnRowCommand="gd_RowCommand" AutoGenerateColumns="False">
                    <Columns>
                        <asp:TemplateField HeaderText="Security Question">
                            <ItemTemplate>

                                <%#Eval("secQue") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>

                                <asp:LinkButton runat="server" ID="btndelete" Text="Delete" CommandArgument='<%#Eval("id")%>' CommandName="btnDelete"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>


                    </Columns>
                </asp:GridView>
            </td>

        </tr>
        <tr>
            <td colspan="2">
                <asp:LinkButton ID="linDtnShowDeleted" runat="server" Text="Show Deleted " OnClick="linDtnShowDeleted_Click"></asp:LinkButton>
            </td>
        </tr>

        <tr>
            <td colspan="2">
                <asp:GridView runat="server" ID="grdShowDeleted" AutoGenerateColumns="false" OnRowCommand="grdShowDeleted_RowCommand">
                    <Columns>
                        <asp:TemplateField HeaderText="Country Name">
                            <ItemTemplate>

                                <%#Eval("secQue") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>

                                <asp:LinkButton runat="server" ID="btnRecover" Text="Recover" CommandArgument='<%#Eval("id")%>' CommandName="btnRecover"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>


                    </Columns>
                </asp:GridView>

            </td>
        </tr>
    </table>
</asp:Content>
