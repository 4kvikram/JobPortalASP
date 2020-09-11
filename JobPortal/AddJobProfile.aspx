<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AddJobProfile.aspx.cs" Inherits="JobPortal.AddJobProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h1><u>Add Job Profile</u></h1>
      <table>
        

        <tr>
            <td><asp:Label ID="lblJobProfile" runat="server" Text="Job Profile Name :"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtJobProfile" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td></td>
            <td><asp:Button id="btnSave" runat="server" text="ADD" OnClick="btnSave_Click"  /></td>
        </tr>
           <tr>
            <td colspan="2" >
                <asp:GridView ID="gd" runat="server" OnRowCommand="gd_RowCommand" AutoGenerateColumns="False">
                    
                    <Columns>
                        <asp:TemplateField HeaderText="Job Profile">
                            <ItemTemplate>
                                
                                <%#Eval("jobProfileName") %>
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
              <td colspan="2"><asp:LinkButton id="linDtnShowDeleted" runat="server" Text="Show Deleted " OnClick="linDtnShowDeleted_Click"></asp:LinkButton>   </td>
          </tr>

           <tr>
              <td colspan="2">
                    <asp:GridView runat="server" ID="grdShowDeleted" AutoGenerateColumns="false" OnRowCommand="grdShowDeleted_RowCommand">
                        <Columns>
                         <asp:TemplateField HeaderText="Job Profile">
                            <ItemTemplate>
                                
                                <%#Eval("jobProfileName") %>
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
