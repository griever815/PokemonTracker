<%@ Page Title="" Language="C#" MasterPageFile="~/PokeMaster.Master" AutoEventWireup="true" CodeBehind="PokemonList.aspx.cs" Inherits="PokeTracker.PokemonList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <asp:Button runat="server" Text="Import PHT"/>

         <section>
                 <asp:Repeater ID="rptPokemon" runat="server">
                <HeaderTemplate>
                    <table>
                        <tr>
                            <th scope="col" style="width: 200px">Pokemon Id
                            </th>
                            <th scope="col" style="width: 200px">Name
                            </th>
                            <th scope="col" style="width: 200px">Type 1
                            </th>
                            <th scope="col" style="width: 200px">Type 2
                            </th>
                        </tr>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr >
                        <td>
                            <asp:Linkbutton ID="Linkbutton1" Text='<%# Eval("ID") %>' runat="server" OnClick="OpenModal"></asp:Linkbutton>
                            <asp:HiddenField runat="server" ID="HFPokemonID" Value='<%# Eval("ID") %>'/>
                        </td>
                        <td>
                             <asp:Linkbutton ID="Linkbutton2" Text=' <%# Eval("Name") %>' runat="server" OnClick="OpenModal"></asp:Linkbutton>
                        </td>
                        <td>
                             <asp:Linkbutton ID="Linkbutton3" Text='<%# Eval("Type1") %>' runat="server" OnClick="OpenModal"></asp:Linkbutton>
                        </td>
                        <td>
                            <asp:Linkbutton ID="Linkbutton4" Text='<%# Eval("Type2") %>' runat="server" OnClick="OpenModal"></asp:Linkbutton>
                        </td>                        
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </table>
                </FooterTemplate>
            </asp:Repeater>
    </section>
        
        <div>
            <!-- The Modal -->
            <div ID="myModal" class="modal" runat="server" visible="false" clientIDMode="static">
                <!-- Modal content -->
                <div class="modal-content">
                    <span class="closeModal" onclick="closeModal()">X</span>

                    <div>
                        <asp:Image ID="ImgPoke" runat="server" />
                        <asp:Label ID="LPokeName" runat="server" Text="" />
                    </div>
                        

                    <div id="table_container">
                        <asp:Repeater ID="rptFastAttacks" runat="server">
                            <HeaderTemplate>
                                <table>
                                    <tr>
                                        <th style="width: 200px">Possible Fast Attacks</th>
                                    </tr>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td>
                                        <%# Eval("Name") %>
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <FooterTemplate>
                                </table>
                            </FooterTemplate>
                        </asp:Repeater>

                        <asp:Repeater ID="rptChargeAttacks" runat="server">
                            <HeaderTemplate>
                                <table>
                                    <tr>
                                        <th style="width: 200px">Possible Charge Attacks</th>
                                    </tr>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td>
                                        <%# Eval("Name") %>
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <FooterTemplate>
                                </table>
                            </FooterTemplate>
                        </asp:Repeater>
                    </div>
                    

                </div>
            </div>
        </div>

        <asp:GridView ID="gvPokemon" runat="server">
        </asp:GridView>



    </div>
</asp:Content>
