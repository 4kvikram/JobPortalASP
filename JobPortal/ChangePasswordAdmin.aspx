<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="ChangePasswordAdmin.aspx.cs" Inherits="JobPortal.ChangePasswordAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
            <script type="text/javascript">
        function checkValidation() {

            var message = "";
            
            message += checkPass();
            message += checkPassword();
            message += checkoldPass();
          
            if (message == "") {
                return true;
            }
            else {
                alert(message);
                return false;
            }

        }

            function checkoldPass() {
                var v = document.getElementById('<%=txtold.ClientID%>').value;
              if (v == "") {
                  return "Please Enter Your old Password\n";
              }
              else {
                  return "";
              }
          }

       
         function checkPass() {
             var v = document.getElementById('<%=txtnew.ClientID%>').value;
             if (v == "") {
                 return "Please Enter Your new Password\n";
             }
             else {
                 return "";
             }
         }
         function checkPassword() {

             var ConPass = document.getElementById('<%=txtnew.ClientID%>').value;
             var pass = document.getElementById('<%=txtconnew.ClientID%>').value;
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
    <table>
        <tr>
            <td>Old Password</td>
            <td><asp:textbox id="txtold" runat="server" TextMode="Password"></asp:textbox> </td>
        </tr>
        <tr>
            <td>New Password</td>
            <td><asp:TextBox id="txtnew"  TextMode="Password" runat="server"></asp:TextBox> </td>
        </tr>
         <tr>
            <td>Confirm New Password</td>
            <td><asp:TextBox id="txtconnew" TextMode="Password" runat="server"></asp:TextBox> </td>
        </tr>
         <tr>
            <td></td>
            <td>
                <asp:Button ID="Button1"  text="Save" runat="server" onclick="Button1_Click" OnClientClick="return checkValidation()"  />
             </td>
        </tr>
        
         <tr>
            <td></td>
            <td>
               <asp:Label ID="lblmessage" runat="server"></asp:Label>
             </td>
        </tr>
    </table>
</asp:Content>
