<%@ Page Title="" Language="C#" MasterPageFile="~/PokeMaster.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="PokeTracker.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!--
        Register page.
        Will take user information.
        Will make username unique
        Will require password restrictions
        
        On creation, will log the user in.
        Will start a session
        -->

    <section>
        <div>
            <asp:TextBox ID="TBName" runat="server" Placeholder="First and Last Name" CssClass="texbox" Required></asp:TextBox>
            <asp:TextBox ID="TBEmail" runat="server" Placeholder="Email" Type="email" CssClass="texbox" Required></asp:TextBox>
            <asp:TextBox ID="TBUsername" runat="server" Placeholder="Username" CssClass="texbox" Required></asp:TextBox>
            <asp:TextBox ID="TBPassword" runat="server" Placeholder="Password" Type="password" CssClass="texbox" Required></asp:TextBox>
            <asp:DropDownList ID="DDLTeam" runat="server">
                <asp:ListItem Text="Select a Team" Value="0" Enabled="true" Selected="true"></asp:ListItem>
                <asp:ListItem Text="Insinct" Value="1"></asp:ListItem>
                <asp:ListItem Text="Mystic" Value="2"></asp:ListItem>
                <asp:ListItem Text="Valor" Value="3"></asp:ListItem>
            </asp:DropDownList>
            <asp:TextBox ID="TBSumbit" runat="server" Type="submit" Text="Submit" CssClass="texbox"></asp:TextBox>


            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ErrorMessage="Email is a required field" 
                ControlToValidate="TBEmail" 
                ForeColor="Red">
            </asp:RequiredFieldValidator>
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
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                InitialValue="0"
                ErrorMessage="Team is a required field" 
                ControlToValidate="DDLTeam" 
                ForeColor="Red">
            </asp:RequiredFieldValidator>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                ErrorMessage="Name is a required field" 
                ControlToValidate="TBName" 
                ForeColor="Red">
            </asp:RequiredFieldValidator>
        </div>
    </section>
</asp:Content>
