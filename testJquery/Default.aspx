<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="testJquery._Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div>
        <select id="selContinent">
            <option selected value="0">Select here</option> 
        </select>
        <select id="selCountry">
            <option selected value="0">Select here</option>
        </select>
        <table id="tabel" border="1" rules="none" cellspacing="0" width="600px">
        </table>
    </div>
    <script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.4.4.js"></script>
    <script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jquery.templates/beta1/jquery.tmpl.js"></script>
    <script id="SelectContTemplate" type="text/x-jQuery-tmpl">
                
				 <option value="${ContinentID} "class="dropcont" id="${ContinentID}">
                    ${ContinentName}
                 </option>
				
    </script>
    <script id="selectCntryTemplate" type="text/x-jQuery-tmpl">
               
				 <option value="${CntrID} "class="cntr" id="${CntrID}">
                    ${CountryName}
                 </option>
                 
				
    </script>
    <script id="RoleTemplate" type="text/x-jQuery-tmpl">
                  <tr><div>
          <td class="celpp" id="${RoleID}">
             <b>Functie : ${RoleName}</b>
          </td>
          
        </div></tr>
        <tr>
        <td colspan="1">
            
                <table id="tab${RoleID}" style="background-color:#EDFAF7;display:none;" border="1" cellspacing="0" width="580px" >
                <tr>
                    <td><b>ID</b></td>
					<td><b>UserName</b></td>
					<td><b>Detalii</b></td>

                </tr>
                
                {{each users}}
                <tr>
                    <td>${UserID}</td>
					<td>${UserName}</td>
					<td><a href="Detalii.aspx?usrid=${UserID}&rolename=${RoleName}" class="modifButton">Details</a></td>
                </tr>
                {{/each}}
                </table>
        </td>
        </tr>
     			
    </script>
    <script type="text/javascript">
        /*<td><b>FirstName</b></td>
        <td><b>LastName</b></td>
        <td><b>email</b></td>
        <td><b>image</b></td>*/

        /*<td>${UserFirstName}</td>
        <td>${UserLastName}</td>
        <td>${Useremail}</td>
        <td>${Userimage}</td>*/

        $(document).ready(function () {
            var elant = "#tbody0";
            var cid = "#tb"
            var contant = '#Country1';
            var tb = '#RolesCountry1';
            $(contant).show();

            $("#selContinent").change(function () {
                var selindx = $(this).attr('value');

                $('#selCountry').children().remove().end().append('<option selected value="0">Select here</option>');
                $('#tabel').children().remove().end();
                getCountry(selindx);

            });

            $("#selCountry").change(function () {
                var selindx = $(this).attr('value');

                $('#tabel').children().remove().end();
                getUserFromCountry(selindx);

            });

            $('.celpp').live('click', function () {

                var ind = 0;
                cid = "#tab" + $(this).attr('id');
                if (cid != elant) {
                    $(cid).show();
                    $(elant).hide();
                    elant = cid;
                    ind = 1;
                }

                if (cid == elant && ind == 0) {
                    $(cid).hide();
                    elant = "res";
                }
            });
            getContinent();
        });

        function getContinent() {
            $.ajax({
                type: "GET",
                url: '../handlers/defaulthandler.ashx',
                data: { 'Command': "a" },
                contentType: "application/json; charset=utf-8",
                dataType: 'json',
                success: function (lstContinent) {



                    $("#SelectContTemplate").tmpl(lstContinent).appendTo("#selContinent");
                },
                complete: function (lstContinent) {

                },
                error: function (jqXHR, textStatus, errorThrown) {
                    var x = textStatus;
                }
            });
        }
        function getCountry(contid) {
            $.ajax({
                type: "GET",
                url: '../handlers/defaulthandler.ashx',
                data: { 'Country': contid },
                contentType: "application/json; charset=utf-8",
                dataType: 'json',
                success: function (lstCountry) {

                    $("#selectCntryTemplate").tmpl(lstCountry).appendTo("#selCountry");
                },
                complete: function (lstCountry) {

                },
                error: function (jqXHR, textStatus, errorThrown) {
                    var x = textStatus;
                }
            });
        }
        function getUserFromCountry(contid) {
            $.ajax({
                type: "GET",
                url: '../handlers/defaulthandler.ashx',
                data: { 'CountryUser': contid },
                contentType: "application/json; charset=utf-8",
                dataType: 'json',
                success: function (UsrLst) {

                    $("#RoleTemplate").tmpl(UsrLst).appendTo("#tabel");
                },
                complete: function (UsrLst) {

                },
                error: function (jqXHR, textStatus, errorThrown) {
                    var x = textStatus;
                }
            });
        }
    </script>
</asp:Content>
