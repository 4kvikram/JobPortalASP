<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="ManageCompanyPage.aspx.cs" Inherits="JobPortal.ManageCompanyPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
        <h1><b><u>Manage Company</u></b></h1>
         <tr>
            <td colspan="2">
                <asp:GridView ID="gd" runat="server" AutoGenerateColumns="False" OnRowCommand="gd_RowCommand" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:TemplateField HeaderText="Company Name">
                            <ItemTemplate>
                                
                                <%#Eval("cName") %>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="URL">
                            <ItemTemplate>
                                <%#Eval("url") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                         <asp:TemplateField HeaderText="Email">
                            <ItemTemplate>
                                <%#Eval("email") %>
                            </ItemTemplate>
                        </asp:TemplateField>

                         <asp:TemplateField HeaderText="Address">
                            <ItemTemplate>
                                <%#Eval("address") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        
                         <asp:TemplateField HeaderText="Contact person Name">
                            <ItemTemplate>
                                <%#Eval("hrName") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        
                         <asp:TemplateField HeaderText="Contact No.">
                            <ItemTemplate>
                                <%#Eval("hrcontact") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                         <asp:TemplateField HeaderText="Menu">
                            <ItemTemplate>
                                <asp:LinkButton ID="btnDelete" CommandName="cmdDelete" Text="DELETE" OnClientClick="return confirm('Do you want to Delete Record !!!!!')" CommandArgument='<%#Eval("id") %>' runat="server" ></asp:LinkButton>
                                <asp:LinkButton ID="btnEdit" CommandName="cmdEdit" Text="EDIT" CommandArgument='<%#Eval("id") %>' runat="server" ></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        
                         
                    </Columns>
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    <SortedAscendingCellStyle BackColor="#FDF5AC" />
                    <SortedAscendingHeaderStyle BackColor="#4D0000" />
                    <SortedDescendingCellStyle BackColor="#FCF6C0" />
                    <SortedDescendingHeaderStyle BackColor="#820000" />
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
                        <asp:TemplateField HeaderText="Company Name">
                            <ItemTemplate>
                                
                                <%#Eval("cName") %>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="URL">
                            <ItemTemplate>
                                <%#Eval("url") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                         <asp:TemplateField HeaderText="Email">
                            <ItemTemplate>
                                <%#Eval("email") %>
                            </ItemTemplate>
                        </asp:TemplateField>

                         <asp:TemplateField HeaderText="Address">
                            <ItemTemplate>
                                <%#Eval("address") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        
                         <asp:TemplateField HeaderText="Contact person Name">
                            <ItemTemplate>
                                <%#Eval("hrName") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        
                         <asp:TemplateField HeaderText="Contact No.">
                            <ItemTemplate>
                                <%#Eval("hrcontact") %>
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
