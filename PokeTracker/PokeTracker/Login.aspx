<%@ Page Title="" Language="C#" MasterPageFile="~/PokeMaster.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="PokeTracker.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!--
        Login Page.
        It is going to check the database to see if the user is in there.
        It will start a session.

        -->
    <section>
        <div>
            <asp:TextBox ID="TBUsername" runat="server" Placeholder="Username" CssClass="texbox" Required></asp:TextBox>
            <asp:TextBox ID="TBPassword" runat="server" Placeholder="Password" Type="password" CssClass="texbox" Required></asp:TextBox>
            <asp:TextBox ID="TBSumbit" runat="server" Type="submit" Text="Submit" CssClass="texbox" ></asp:TextBox>


<%--            
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ErrorMessage="Password is a required field" 
                ControlToValidate="TBPassword" 
                ForeColor="Red">
            </asp:RequiredFieldValidator>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                ErrorMessage="Username is a required field" 
                ControlToValidate="TBUsername" 
                ForeColor="Red">
            </asp:RequiredFieldValidator>
            >--%>
        </div>
    </section>


</asp:Content>
