<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Detalii.aspx.cs" Inherits="testJquery.Detalii" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="LabelFunctie" runat="server" Text="Functie"></asp:Label>
    <asp:Label ID="LabelFunctieVal" runat="server" Text=""></asp:Label>
    <div>
        <table id="tabel" border="1" rules="none" cellspacing="0" width="600px">
        </table>
    </div>
    <script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.4.4.js"></script>
    <script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jquery.templates/beta1/jquery.tmpl.js"></script>
    <script id="DetTemplate" type="text/x-jQuery-tmpl">
                <tr>
                    <td><b>ID</b></td>
					<td><b>UserName</b></td>
					<td><b>FirstName</b></td>
					<td><b>LastName</b></td>
					<td><b>email</b></td>
                    <td><b>image</b></td>
                </tr>
                
                
                <tr>
                    <td>${UserID}</td>
					<td>${UserName}</td>
					<td>${UserFirstName}</td>
					<td>${UserLastName}</td>
					<td>${Useremail}</td>
					<td>${Userimage}</td>
                </tr>
               
    </script>
    <script type="text/javascript">

        // Build an empty URL structure in which we will store
        // the individual query values by key.
        var objURL = new Object();


        // Use the String::replace method to iterate over each
        // name-value pair in the query string. Location.search
        // gives us the query string (if it exists).
        window.location.search.replace(new RegExp("([^?=&]+)(=([^&]*))?", "g"),

        // For each matched query string pair, add that
        // pair to the URL struct using the pre-equals
        // value as the key.
        function ($0, $1, $2, $3) {
            objURL[$1] = $3;
         });
 
    </script>
    
    <script type="text/javascript">
        $(document).ready(function () {
            getdetails(objURL["usrid"]);
        });

        function getdetails(usrid) {
            
            $.ajax({
                type: "GET",
                url: '../handlers/defaulthandler.ashx',
                data: { 'User': usrid },
                contentType: "application/json; charset=utf-8",
                dataType: 'json',
                success: function (usrDet) {

                    $("#DetTemplate").tmpl(usrDet).appendTo("#tabel");
                },
                complete: function (usrDet) {

                },
                error: function (jqXHR, textStatus, errorThrown) {
                    var x = textStatus;
                }
            });
        }
        
    </script>


</asp:Content>
