<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="ManageUserPage.aspx.cs" Inherits="JobPortal.ManageUserPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Manage User</h1>
    <table>
         <tr>
            <td colspan="2">
                <asp:GridView ID="gd" runat="server" AutoGenerateColumns="False" OnRowCommand="gd_RowCommand" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2">
                    <Columns>
                        <asp:TemplateField HeaderText="Name">
                            <ItemTemplate>
                                <%#Eval("fName") %>
                                <%#Eval("lName") %>
                            </ItemTemplate>
                        </asp:TemplateField>

                         <asp:TemplateField HeaderText="Gender">
                            <ItemTemplate>
                                <%#Eval("gender").ToString()=="1"?"Male":Eval("gender").ToString()=="2"?"Female":"Other" %>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Email">
                            <ItemTemplate>
                                <%#Eval("email") %>
                            </ItemTemplate>
                        </asp:TemplateField>

                        
                         <asp:TemplateField HeaderText="Country">
                            <ItemTemplate>
                                <%#Eval("countryName") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                         <asp:TemplateField HeaderText="State">
                            <ItemTemplate>
                                <%#Eval("sName") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                         <asp:TemplateField HeaderText="Qualification">
                            <ItemTemplate>
                                <%#Eval("Qname") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                         <asp:TemplateField HeaderText="Skils">
                            <ItemTemplate>
                                <%#Eval("skils") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                         <asp:TemplateField HeaderText="Job Profile">
                            <ItemTemplate>
                                <%#Eval("jobProfileName") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                         <asp:TemplateField HeaderText="Secutiry Question">
                            <ItemTemplate>
                                <%#Eval("secQue") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Answer">
                            <ItemTemplate>
                                <%#Eval("secQAns") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                       
                         <asp:TemplateField HeaderText="Photo">
                            <ItemTemplate>
                                <asp:Image  runat="server" ID="img" Width="60" Height="90" ImageUrl='<%#Eval("photo","~/uploads/{0}") %>' />
                                
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Status">
                            <ItemTemplate>
                                <asp:LinkButton runat="server" ID="btnstatus" Text='<%#Eval("status").ToString()=="0"?"Active":"Not Active" %>' CommandArgument='<%#Eval("id") %>' CommandName="linkbtnstatus"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        
                         <asp:TemplateField HeaderText="Menu">
                            <ItemTemplate>
                               
                                <asp:LinkButton ID="btnEdit" CommandName="cmdEdit" Text="EDIT" CommandArgument='<%#Eval("id") %>' runat="server" ></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>
                    <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                    <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                    <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                    <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#FFF1D4" />
                    <SortedAscendingHeaderStyle BackColor="#B95C30" />
                    <SortedDescendingCellStyle BackColor="#F1E5CE" />
                    <SortedDescendingHeaderStyle BackColor="#93451F" />
                </asp:GridView>
            </td>
        </tr>
    </table>
</asp:Content>
