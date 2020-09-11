<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="ManageJobs.aspx.cs" Inherits="JobPortal.ManageJobs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1><b><u>Manage Jobs</u></b></h1>
    <table>

        <tr>
        <td>
        <asp:GridView ID="grdShow" runat="server" AutoGenerateColumns="False" OnRowCommand="grdShow_RowCommand" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical">
            <AlternatingRowStyle BackColor="#DCDCDC" />
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
                        <asp:LinkButton ID="btnDelete" CommandName="cmdDelete" Text="DELETE" OnClientClick="return confirm('Do you want to Delete Record !!!!!')" CommandArgument='<%#Eval("JobID") %>' runat="server"></asp:LinkButton>
                        <asp:LinkButton ID="btnEdit" CommandName="cmdEdit" Text="EDIT" CommandArgument='<%#Eval("JobID") %>' runat="server"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>

            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#0000A9" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#000065" />

        </asp:GridView>

            </td></tr>
        <tr>
            <td>
                <asp:LinkButton ID="linDtnShowDeleted" runat="server" Text="Show Deleted " OnClick="linDtnShowDeleted_Click1"></asp:LinkButton>
            </td>
        </tr>

        <tr>

            
            <td>
                <asp:GridView runat="server" ID="grdShowDeleted" AutoGenerateColumns="false" OnRowCommand="grdShowDeleted_RowCommand">
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
                        <asp:TemplateField>
                            <ItemTemplate>

                                <asp:LinkButton runat="server" ID="btnRecover" Text="Recover" CommandArgument='<%#Eval("JobID")%>' CommandName="btnRecover"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>


                    </Columns>
                </asp:GridView>

            </td>
        </tr>





    </table>

</asp:Content>
