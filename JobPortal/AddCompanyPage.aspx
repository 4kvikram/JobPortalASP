<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AddCompanyPage.aspx.cs" Inherits="JobPortal.AddCompanyPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script type="text/javascript">
    function validationCheck()
    {
        var message = "";
        message += companyCheck();
        message += urlCheck();
        message += addressCheck();
        message += emailCheck();
        message += ContactPersonCheck();
        message += contactCheck();
        if(message=="")
        {
            return true;
        }
        else
        {
            alert(message);
            return false;
        }
    }
    function companyCheck()
    {
        var a = document.getElementById("<%=txtCompanyName.ClientID%>").value;
        if(a=="")
        {
            return "Please Enter Company Name !!\n";
        }
        else
        {
            return "";
        }
    }
    function urlCheck()
    {
        var a = document.getElementById('<%=txturl.ClientID%>').value;
        if(a=="")
        {
            return "Please Enter URL !!\n";
        }
        else
        {
            return "";
        }
    }
    function addressCheck()
    {
        var a = document.getElementById('<%=txtAddress.ClientID%>').value;
        if(a=="")
        {
            return "Please Enter Address !!\n";
        }
        else
        {
            return "";
        }
    }
    function emailCheck()
    {
        var a = document.getElementById('<%=TextEmail.ClientID%>').value;
        if(a=="")
        {
            return "Please Enter Email !!\n";
        }
        else
        {
            return "";
        }
    }
    function ContactPersonCheck()
    {
        var a = document.getElementById('<%=TxtcontactPerson.ClientID%>').value;
        if(a=="")
        {
            return "Please Enter Contact person name !!\n";
        }
        else
        {
            return "";
        }
    }
    function contactCheck()
    {
        var a = document.getElementById('<%=TxtContactNo.ClientID%>').value;
        if(a=="")
        {
            return "Please Enter Contact number!!\n";
        }
        else
        {
            return "";
        }
    }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1><u>Add company</u></h1>
      <table>
        <tr>
            <td><asp:Label ID="lblcompanyName" runat="server" Text="Company Name :"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtCompanyName" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td><asp:Label ID="lblurl" runat="server" Text="URL :"></asp:Label></td>
            <td>
                <asp:TextBox ID="txturl" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td><asp:Label ID="lblAddress" runat="server" Text="Address :"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtAddress" runat="server"></asp:TextBox></td>
        </tr>

        <tr>
            <td><asp:Label ID="lblEmail" runat="server" Text="Email :"></asp:Label></td>
            <td>
                <asp:TextBox ID="TextEmail" runat="server"></asp:TextBox></td>
        </tr>

        <tr>
            <td><asp:Label ID="lblContactPerson" runat="server" Text="Contact Person"></asp:Label></td>
            <td>
                <asp:TextBox ID="TxtcontactPerson" runat="server"></asp:TextBox></td>
        </tr>

        <tr>
            <td><asp:Label ID="lblContactNo" runat="server" Text="Contact No.  :"></asp:Label></td>
            <td>
                <asp:TextBox ID="TxtContactNo" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td></td>
            <td><asp:Button id="btnSave"  runat="server" text="SAVE" OnClick="btnSave_Click" OnClientClick=" return validationCheck()" /></td>
        </tr>
           <tr>
            <td colspan="2" style="text-align:center">
                <asp:Label ID="lblMessage" ForeColor="Green" runat="server" ></asp:Label>
            </td>
        </tr>





          </table>
    
</asp:Content>
