<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="applyedJob.aspx.cs" Inherits="JobPortal.applyedJob" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
        <tr>
            <td colspan="2"></td>

        </tr>
        <tr>
            <td></td>
            <td></td>
        </tr>
        <tr>

            <td colspan="2">
                <asp:GridView ID="grd" runat="server" AutoGenerateColumns="False" OnRowCommand="grd_RowCommand" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2">
                    <Columns>
                        <asp:TemplateField HeaderText="User Information">
                            <ItemTemplate>
                               <asp:Label Text="Name :" runat="server" ForeColor="Black" font="Font-Bold"></asp:Label> <%#Eval("fName") %><%#Eval("lName") %><br />
                                <asp:Label Text="Gender: :" runat="server" ForeColor="Black" font="Font-Bold"></asp:Label> <%#Eval("gender").ToString()=="1"?"Male":Eval("gender").ToString()=="2"?"Female":"Other" %><br />
                                <asp:Label Text="Email :" runat="server" ForeColor="Black" font="Font-Bold"></asp:Label><%#Eval("email") %><br />
                                <asp:Label Text="Country :" runat="server" ForeColor="Black" font="Font-Bold"></asp:Label> <%#Eval("countryName") %><br />
                                <asp:Label Text="State :" runat="server" ForeColor="Black" font="Font-Bold"></asp:Label> <%#Eval("sName") %><br />
                                <asp:Label Text="Qualification :" runat="server" ForeColor="Black" font="Font-Bold"></asp:Label> <%#Eval("Qname") %><br />
                                <asp:Label Text="Skils :" runat="server" ForeColor="Black" font="Font-Bold"></asp:Label>  <%#Eval("skils") %><br />
                                <asp:Label Text="Job Profile :" runat="server" ForeColor="Black" font="Font-Bold"></asp:Label> <%#Eval("jobProfileName") %>
                            </ItemTemplate>
                        </asp:TemplateField>

                       

                        <asp:TemplateField HeaderText="User Photo">
                            <ItemTemplate>
                                <asp:Image runat="server" ID="img" Width="60" Height="90" ImageUrl='<%#Eval("photo","~/uploads/{0}") %>' />

                            </ItemTemplate>
                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="Company Details">
                            <ItemTemplate>

                                <asp:Label Text="Company Name:" runat="server" ForeColor="Black" font="Font-Bold"></asp:Label><%#Eval("cName") %><br />
                                <asp:Label Text="Website :" runat="server" ForeColor="Black" font="Font-Bold"></asp:Label> <%#Eval("url") %><br />
                                <asp:Label Text="Email :" runat="server" ForeColor="Black" font="Font-Bold"></asp:Label>  <%#Eval("Comemail") %><br />
                                <asp:Label Text="Address :" runat="server" ForeColor="Black" font="Font-Bold"></asp:Label><%#Eval("Comaddress") %><br />
                                <asp:Label Text="HR Name :" runat="server" ForeColor="Black" font="Font-Bold"></asp:Label><%#Eval("hrName") %><br />
                                
                                <asp:Label Text="HR Contact :" runat="server" ForeColor="Black" font="Font-Bold"></asp:Label><%#Eval("hrcontact") %><br />

                          
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Job for">
                            <ItemTemplate>
                                <asp:Label Text="Job Profile :" runat="server" ForeColor="Black" font="Font-Bold"></asp:Label><%#Eval("jobProfileName") %><br />
                                <asp:Label Text="No. of vacancy :" runat="server" ForeColor="Black" font="Font-Bold"></asp:Label><%#Eval("NoOfVacancy") %><br />
                                <asp:Label Text="Minumum Experience:" runat="server" ForeColor="Black" font="Font-Bold"></asp:Label><%#Eval("minExp") %><br />
                                <asp:Label Text="Maximum Experience :" runat="server" ForeColor="Black" font="Font-Bold"></asp:Label><%#Eval("maxExp") %><br />
                                <asp:Label Text="Minumim Salary:" runat="server" ForeColor="Black" font="Font-Bold"></asp:Label><%#Eval("minOfferedSal") %><br />
                                <asp:Label Text="Maximum Salary:" runat="server" ForeColor="Black" font="Font-Bold"></asp:Label><%#Eval("maxOfferedSal") %><br />
                            </ItemTemplate>
                        </asp:TemplateField>



                        <asp:TemplateField HeaderText="Comments">
                            <ItemTemplate>
                                <%#Eval("comments") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Menu">
                            <ItemTemplate>

                                <asp:LinkButton ID="btnMail" CommandName="mail" Text="Send Mail" CommandArgument='<%#Eval("id") %>' runat="server"></asp:LinkButton>
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
