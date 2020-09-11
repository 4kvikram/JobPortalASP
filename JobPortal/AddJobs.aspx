<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AddJobs.aspx.cs" Inherits="JobPortal.AddJobs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">


        function validateSal() {

            var message = "";
            message += checkjJobProfile();
            message += CheckCompany();
            message += validMinMaxExp();
            message += CheckVacancy();
            message += checkSalary();
            // message += CheckMaxOffSAL();
            message += CheckComment();


            if (message == "") {
                return true;
            }
            else {
                alert(message);
                return false;
            }

        }
        function validMinMaxExp() {
            var A = document.getElementById('<%=ddlMinExp.ClientID%>').value;
            var B = document.getElementById('<%=ddlMaxExp.ClientID%>').value;
            var mg = "";
            if (A == 'P') {
                mg += "select minimum experience \n"
            }
            if (B == 'P') {
                mg += "select maximum experience\n"
                return mg;
            }
            else {
                if (B < A) {

                    return "Minimum experience should be less than Maximum experience \n";
                }
                else {
                    return "";
                }
            }



        }
        function checkjJobProfile() {
            var v = document.getElementById('<%=ddljobProfile.ClientID%>').value;
            if (v == 0) {
                return "Please Select Job Profile \n";
            }
            else {
                return "";
            }
        }
        function CheckCompany() {
            var v = document.getElementById('<%=ddlcompany.ClientID%>').value;
            if (v == 0) {
                return "Please Select Company \n";
            }
            else {
                return "";
            }
        }
        function CheckVacancy() {
            var v = document.getElementById('<%=txtVacancy.ClientID%>').value;
            if (v == "") {
                return "Please Enter No. of vacancy \n";
            }
            else {
                return "";
            }
        }
        function CheckMinOffSAL() {
            var v = document.getElementById('<%=txtminSal.ClientID%>').value;
            if (v == "") {
                return "Please Enter Min Salary \n";
            }
            else {
                return "";
            }
        }
        function CheckMaxOffSAL() {
            var v = document.getElementById('<%=txtmaxnSal.ClientID%>').value;
            if (v == "") {
                return "Please Enter Max Salary \n";
            }
            else {
                return "";
            }
        }
        function checkSalary() {
            var A = document.getElementById('<%=txtminSal.ClientID%>').value;
            var B = document.getElementById('<%=txtmaxnSal.ClientID%>').value;
            var mg = "";
            if (A == "") {
                mg += "Enter minimum salary \n"
            }
            if (B == "") {
                mg += "Enter maximum salary\n"
                return mg;
            }
            else {
                if (parseInt(B) < parseInt(A)) {

                    return "Minimum salary should be less than Maximum salary \n";
                }
                else {
                    return "";
                }
            }



        }

        function CheckComment() {
            var v = document.getElementById('<%=txtcomment.ClientID%>').value;
            if (v == 0) {
                return "Please Enter comments \n";
            }
            else {
                return "";
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h1><u>Add Jobs</u></h1>
    <table>
        <tr>
            <td>Job Profile :</td>
            <td>
                <asp:DropDownList ID="ddljobProfile" runat="server"></asp:DropDownList></td>
        </tr>
        <tr>
            <td>Company :</td>
            <td>
                <asp:DropDownList ID="ddlcompany" runat="server"></asp:DropDownList></td>
        </tr>
        <tr>
            <td>No. Of Vacancy :</td>
            <td>
                <asp:TextBox ID="txtVacancy" runat="server"></asp:TextBox></td>
        </tr>

        <tr>
            <td>Minimum Experience :</td>
            <td>
                <asp:DropDownList ID="ddlMinExp" runat="server">
                    <asp:ListItem Text="--select--" Value="P"></asp:ListItem>
                    <asp:ListItem Text="0 Year" Value="0"></asp:ListItem>
                    <asp:ListItem Text="1 Year" Value="1"></asp:ListItem>
                    <asp:ListItem Text="2 Year" Value="2"></asp:ListItem>
                    <asp:ListItem Text="3 Year" Value="3"></asp:ListItem>
                    <asp:ListItem Text="4 Year" Value="4"></asp:ListItem>
                    <asp:ListItem Text="5 Year" Value="5"></asp:ListItem>
                </asp:DropDownList></td>
        </tr>
        <tr>
            <td>Maximum Experience :</td>
            <td>
                <asp:DropDownList ID="ddlMaxExp" runat="server">
                    <asp:ListItem Text="--select--" Value="P"></asp:ListItem>
                    <asp:ListItem Text="0 Year" Value="0"></asp:ListItem>
                    <asp:ListItem Text="1 Year" Value="1"></asp:ListItem>
                    <asp:ListItem Text="2 Year" Value="2"></asp:ListItem>
                    <asp:ListItem Text="3 Year" Value="3"></asp:ListItem>
                    <asp:ListItem Text="4 Year" Value="4"></asp:ListItem>
                    <asp:ListItem Text="5 Year" Value="5"></asp:ListItem>
                    <asp:ListItem Text="6 Year" Value="6"></asp:ListItem>
                    <asp:ListItem Text="7 Year" Value="7"></asp:ListItem>
                    <asp:ListItem Text="8 Year" Value="8"></asp:ListItem>
                    <asp:ListItem Text="9 Year" Value="9"></asp:ListItem>
                    <asp:ListItem Text="10 Year" Value="10"></asp:ListItem>

                </asp:DropDownList>
                <asp:Label ID="lblmessage1" runat="server" ForeColor="Red"></asp:Label>
            </td>
        </tr>

        <tr>
            <td>Minimum offered salary :</td>
            <td>
                <asp:TextBox ID="txtminSal" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Maximum offered salary :</td>
            <td>
                <asp:TextBox ID="txtmaxnSal" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Comments :</td>
            <td>
                <asp:TextBox ID="txtcomment" TextMode="MultiLine" runat="server"></asp:TextBox></td>
        </tr>





        <tr>
            <td></td>
            <td>
                <asp:Button ID="btnSave" runat="server" Text="SAVE" OnClientClick="return validateSal()" OnClick="btnSave_Click" /></td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Label ID="lblMessage" ForeColor="Green" runat="server"></asp:Label>
            </td>
        </tr>





    </table>


</asp:Content>
