<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="registrationPage.aspx.cs" Inherits="JobPortal.registrationPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function checkValidation() {

            var message = "";
            message += checkFname();
            message += checkLname();
            message += checkEmail();
            message += checkPass();
            message += checkPassword();
            message += checkAns();
            message += checkCountry();
            message += checkState();
            message += chekcJobProfile();
            message += checkQuli();
            message += checkSecQue();
            if (message == "") {
                return true;
            }
            else {
                alert(message);
                return false;
            }
        }
        function checkSecQue() {
            var v = document.getElementById('<%=ddlSecQ.ClientID%>').value;
            if (v == 0) {
                return "Please Select Your Security Question \n ";
            }
            else {
                return "";
            }
        }
        function checkQuli() {
            var v = document.getElementById('<%=ddlQuali.ClientID%>').value;
            if (v == 0) {
                return "Please Select Your Qualification\n";
            }
            else {
                return "";
            }
        }
        function chekcJobProfile() {
            v = document.getElementById('<%=ddlJobProfile.ClientID%>').value;
             if (v == 0) {
                 return "Please Select Your Job Profile\n";
             }
             else {
                 return "";
             }
         }
        function checkState() {
            var V = document.getElementById('<%=ddlState.ClientID%>').value;
            if (V == 0) {
                return "Plese select Your State \n";
            }
            else {
                return "";
            }
        }
         function checkAns() {
            var v = document.getElementById('<%=txtddlsecQAns.ClientID%>').value;
            if (v == "") {
                return "Please Answer the question\n";
            }
            else {
                return "";
            }
        }
        function checkFname() {
            var v = document.getElementById('<%=txtfName.ClientID%>').value;
            var exp = /^[a-zA-Z ]*$/;
            if (v == "") {
                return "Please Enter Your First Name\n";
            }
            else if (exp.test(v)) //if test is pass then return nothing
            {
                return "";
            }
            else {
                return "Name shoud be Alphabatic only \n";
            }
        }
        function checkLname() {
            var v = document.getElementById('<%=txtlName.ClientID%>').value;
            var exp = /^[a-zA-Z ]*$/;
            if (v == "") {
                return "Please Enter Your Last Name\n";
            }
            else if (exp.test(v)) //if test is pass then return nothing
            {
                return "";
            }
            else {
                return "Name shoud be Alphabatic only \n";
            }
        }
        function checkEmail() {
            var v = document.getElementById('<%=txtEmail.ClientID%>').value;
            var exp = /^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$/;
             if (v == "") {
                 return "Please Enter Your Email\n";
             }
             else if (exp.test(v)) //if test is pass then return nothing
             {
                 return "";
             }
             else {
                 return "Email is not correct\n";
             }
         }
         function checkPass() {
             var v = document.getElementById('<%=txtPass.ClientID%>').value;
             if (v == "") {
                 return "Please Enter YourPassword\n";
             }
             else {
                 return "";
             }
        }
        function checkCountry() {
            var v = document.getElementById('<%=ddlCounty.ClientID%>').value;
            if (v == 0) {
                return "Please select Your Country\n";
            }
            else {
                return "";
            }
        }
         function checkPassword() {

             var ConPass = document.getElementById('<%=txtConPass.ClientID%>').value;
             var pass = document.getElementById('<%=txtPass.ClientID%>').value;
             if (ConPass == pass) {
                 return "";
             }
             else if (ConPass != pass) {

                 return "Password and confirm password does not match";

             }

         }
    </script>
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1><u>Registration page</u></h1>
    <table>
        <tr>
            <td>
                <asp:Label ID="lblfname" runat="server" Text="First Name :"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtfName" runat="server"></asp:TextBox></td>
            <td></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbllName" runat="server" Text="Last Name :"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtlName" runat="server"></asp:TextBox></td>
            <td ></td>
        </tr>
         <tr>
            <td>
                <asp:Label ID="lblgender" runat="server" Text="Gender:"></asp:Label></td>
            <td>
                
                <asp:RadioButtonList ID="rdoGender" runat="server" RepeatColumns="3">
                    <asp:ListItem Text="Male" Value="1"></asp:ListItem>
                    <asp:ListItem Text="Female" Value="2"></asp:ListItem>
                    <asp:ListItem Text="Other" Value="3"></asp:ListItem>
                </asp:RadioButtonList>
            </td>
            <td></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblEmail" runat="server" Text="Email :"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox></td>
            <td>
             </td>
        </tr>
        
        <tr>
            <td>
                <asp:Label ID="lblPass" runat="server" Text="Password"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtPass" TextMode="Password" runat="server"></asp:TextBox></td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblconfirmPass" runat="server" Text=" Confirm Password"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtConPass" TextMode="Password" runat="server"></asp:TextBox></td>
            <td>
                &nbsp;</td>
        </tr>
           <tr>
            <td>
                <asp:Label ID="lblPhoto" runat="server" Text="Photo :"></asp:Label></td>
            <td>
                
                        <asp:FileUpload ID="imgPhoto" runat="server"  ></asp:FileUpload>
                   
                </td>
            <td>
                
                        <asp:Image id="imgshow" runat="server" Height="150" Width="180" /></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblCountry" runat="server" Text="Country :" ></asp:Label></td>
            <td>
                <asp:ScriptManager runat="server" ID="scriptm"></asp:ScriptManager>
                <asp:UpdatePanel runat="server" ID="updatepanl">
                    <ContentTemplate>
                <asp:DropDownList ID="ddlCounty" runat="server" OnSelectedIndexChanged="ddlCounty_SelectedIndexChanged" AutoPostBack="true">
                </asp:DropDownList>
                </ContentTemplate>
                </asp:UpdatePanel>
                        </td>
            <td>
                </td>
        </tr>
         <tr>
            <td>
                <asp:Label ID="lblState" runat="server" Text="State :"></asp:Label></td>
            <td>
                <asp:UpdatePanel runat="server" ID="UpdatePanel1">
                    <ContentTemplate>
                <asp:DropDownList ID="ddlState" runat="server">

                </asp:DropDownList>
                         </ContentTemplate>
                </asp:UpdatePanel>
                </td>
            <td>
               </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblQuali" runat="server" Text="Qualification :"></asp:Label></td>
            <td>
                <asp:DropDownList ID="ddlQuali" runat="server">
                </asp:DropDownList></td>
            <td >
                </td>
        </tr>
         <tr>
            <td>
                <asp:Label ID="lblSkils" runat="server" Text="Skils :">
                    
                </asp:Label></td>
            <td>
                <asp:CheckBoxList ID="chboxSkils" runat="server" RepeatColumns="3">
                    <asp:ListItem Text="Communication" Value="1"></asp:ListItem>
                    <asp:ListItem Text="Computer" Value="2"></asp:ListItem>
                    <asp:ListItem Text="Analytical" Value="3"></asp:ListItem>
                    <asp:ListItem Text="Marketing" Value="4"></asp:ListItem>
                    <asp:ListItem Text="Problem Solving" Value="5"></asp:ListItem>
                    <asp:ListItem Text="Technical" Value="6"></asp:ListItem>
                </asp:CheckBoxList>    
            </td>
            <td>
                &nbsp;</td>
        </tr>

        <tr>
            <td>
                <asp:Label ID="lblJobProfile" runat="server" Text="Select Job Profile :"></asp:Label></td>
            <td>
                <asp:DropDownList ID="ddlJobProfile" runat="server">
                </asp:DropDownList></td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblSecQ" runat="server" Text="Security Question :"></asp:Label>

            </td>
            <td>
                <asp:DropDownList ID="ddlSecQ" runat="server">
                </asp:DropDownList>
                </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>Answer:</td>
            <td>
                <asp:TextBox ID="txtddlsecQAns" runat="server"></asp:TextBox></td>
            <td >
                &nbsp;</td>
        </tr>


        <tr>
            <td></td>
            <td>
                <asp:Button ID="btnReset" runat="server" OnClick="btnReset_Click" Text="Reset" />
                <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Submit" OnClientClick="return checkValidation()" />

            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center">
                <asp:Label ID="lblMessage" ForeColor="Green" runat="server"></asp:Label>
            </td>
            <td >
                &nbsp;</td>
        </tr>


    </table>
</asp:Content>
