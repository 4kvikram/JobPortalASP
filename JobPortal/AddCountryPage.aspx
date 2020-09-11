<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AddCountryPage.aspx.cs" Inherits="JobPortal.AddCountryPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function CheckValidation() {

            var message = "";
            message += CheckCountry();
            
            if (message == "") {
                return true;
            }
            else {
                alert(message);
                return false;
            }

        }
        function CheckCountry() {
            var v = document.getElementById('<%=txtCuntryName.ClientID%>').value;
            if (v == 0) {
                return "Please Enter Country Name\n ";
            }
            else {
                return "";
            }
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1><u>Add Country</u></h1>
      <table>
        

        <tr>
            <td><asp:Label ID="lblCountryName" runat="server" Text="Country Name :"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtCuntryName" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td></td>
            <td><asp:Button id="btnSave" runat="server" text="ADD" OnClick="btnSave_Click" OnClientClick="return CheckValidation()" /></td>
        </tr>
           <tr>
            <td colspan="2" >
                <asp:GridView ID="gd" runat="server" OnRowCommand="gd_RowCommand" AutoGenerateColumns="False">
                    <Columns>
                        <asp:TemplateField HeaderText="Country Name">
                            <ItemTemplate>
                                
                                <%#Eval("countryName") %>
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
              <td colspan="2"><asp:LinkButton id="linbtnshowdltcountry" runat="server" Text="Show Deleted Country" OnClick="linbtnshowdltcountry_Click"></asp:LinkButton>   </td>
          </tr>

           <tr>
              <td colspan="2">
                    <asp:GridView runat="server" ID="grdshowdltcountry" AutoGenerateColumns="false" OnRowCommand="grdshowdltcountry_RowCommand">
                        <Columns>
                        <asp:TemplateField HeaderText="Country Name">
                            <ItemTemplate>
                                
                                <%#Eval("countryName") %>
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
