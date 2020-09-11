<%@ Page Title="" Language="C#" MasterPageFile="~/User/UserMasterPage.Master" AutoEventWireup="true" CodeBehind="jobs.aspx.cs" Inherits="JobPortal.User.jobs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Jobs</h1>
    <table>
        <tr>
            <td>
                <asp:GridView ID="datashow" runat="server" OnRowCommand="datashow_RowCommand" AutoGenerateColumns="False" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None"  >
                    <AlternatingRowStyle BackColor="PaleGoldenrod" />
                    <Columns>
                <asp:TemplateField HeaderText="Job Profile">
                    <ItemTemplate>
                        <%#Eval("jobProfileName") %>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Company">
                    <ItemTemplate>
                        <%#Eval("cName") %>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="No. Of Vacancy">
                    <ItemTemplate>
                        <%#Eval("NoOfVacancy") %>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Minumum Experience">
                    <ItemTemplate>
                        <%#Eval("minExp") %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Maximum Experience">
                    <ItemTemplate>
                        <%#Eval("maxExp") %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Minimum Offred Salary">
                    <ItemTemplate>
                        <%#Eval("minOfferedSal") %>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Maximum Offred Salary">
                    <ItemTemplate>
                        <%#Eval("maxOfferedSal") %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Comments">
                    <ItemTemplate>
                        <%#Eval("comments") %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Menu">
                    <ItemTemplate>
                        <asp:LinkButton ID="btnApply" CommandName="cmdApply" Text="Apply" CommandArgument='<%#Eval("JobID") %>' runat="server"></asp:LinkButton>
                        
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
                    <FooterStyle BackColor="Tan" />
                    <HeaderStyle BackColor="Tan" Font-Bold="True" />
                    <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                    <SortedAscendingCellStyle BackColor="#FAFAE7" />
                    <SortedAscendingHeaderStyle BackColor="#DAC09E" />
                    <SortedDescendingCellStyle BackColor="#E1DB9C" />
                    <SortedDescendingHeaderStyle BackColor="#C2A47B" />
                </asp:GridView>
            </td>
        </tr>
    </table>
</asp:Content>
