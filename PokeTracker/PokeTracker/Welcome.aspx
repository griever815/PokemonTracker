 <%@ Page Title="" Language="C#" MasterPageFile="~/PokeMaster.Master" AutoEventWireup="true" CodeBehind="Welcome.aspx.cs" Inherits="PokeTracker.Welcome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Welcome Page. 
        It is going to have a welcome message.
        It is going to have a sign up/ Login link.
        
         -->

    <section>
        <div>
            <p>Welcome to Pokemon Tracker!</p>
        </div>


        <div>
            <asp:HyperLink CssClass="links" ID="HLLogin" runat="server" NavigateUrl="~/Login.aspx">Login</asp:HyperLink>
        </div>
        <div>
            <asp:HyperLink CssClass="links" ID="HLRegister" runat="server" NavigateUrl="~/Register.aspx">Register</asp:HyperLink>
        </div>

    </section>
</asp:Content>
