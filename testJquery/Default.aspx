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
        </select>&nbsp;<table id="tabel" border="1" rules="none" cellspacing="0" width="600px">
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
        <td colspan="1" id="tb${RoleID}">
            
                <table id="tab${RoleID}" style="background-color:#EDFAF7;display:none;" border="1" cellspacing="0" width="580px" >
                <tr id="headtab">
                    <td class="headtabcls"><b>ID</b></td>
					<td id='bla' class="celnum headtabcls"><span id="pic_ord" class="arrow_none"></span><b>UserName</b> </td>
                    <td class="headtabcls"><b>FirstName</b></td>
                    <td class="headtabcls"><b>LastName</b></td>
                    <td class="headtabcls"><b>email</b></td>
                    <td class="headtabcls"><b>image</b></td>
					<td class="headtabcls"><b>Detalii</b></td>
                </tr>
                
                {{each users}}
                <tr>
                    <td>${UserID}</td>
					<td>${UserName}</td>
					<td>${UserFirstName}</td>
                    <td>${UserLastName}</td>
                    <td>${Useremail}</td>
                    <td>${Userimage}</td>
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
            var ind_sort = 0;
            var ord;
            var ind = 0;
            countrysel = 0;
            //var Lst;
            var cid = "#tb"
            var functSelect = 1;
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
                countrysel = selindx;
                $('#tabel').children().remove().end();
                getUserFromCountry(selindx, 0);

                //$("#RoleTemplate").tmpl(Lst).appendTo("#tabel");



            });

            $('.celpp').live('click', function () {

                var ind = 0;
                cid = "#tab" + $(this).attr('id');
                functSelect = cid;
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
                //sortare_nume(Lst, functSelect, 1);
                //alert(functSelect);
            });

            $('.celnum').live('click', function () {
                $('#tabel').children().remove().end();
                ind_sort = ind_sort + 1;
                if (ind_sort == 3) {
                    ind_sort = 0;
                }
                //alert(ind_sort);
                elant = "#tbody0";
                getUserFromCountry(countrysel, ind_sort);

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
        function getUserFromCountry(contid, ord) {
            $.ajax({
                type: "GET",
                url: '../handlers/defaulthandler.ashx',
                data: { 'CountryUser': contid,
                    'Order': ord
                },
                contentType: "application/json; charset=utf-8",
                dataType: 'json',
                success: function (UsrLst) {
                    Lst = UsrLst;
                    afisare(Lst, ord);
                    
                },
                complete: function (UsrLst) {

                },
                error: function (jqXHR, textStatus, errorThrown) {
                    var x = textStatus;
                }
            });
            
        }
        function sortare_nume(LstUser,ind_functie,ind_ord){
            if (ind_ord == 1) {
                //sortare ascendenta
                for (var i = 0; i < LstUser[ind_functie - 1].users.length - 1; i++) {
                    for (var j = i + 1; j < LstUser[ind_functie - 1].users.length; j++)
                        if (LstUser[ind_functie - 1].users[i].UserName > LstUser[ind_functie - 1].users[j].UserName) {
                            var aux = LstUser[ind_functie - 1].users[i];
                            LstUser[ind_functie - 1].users[i] = LstUser[ind_functie - 1].users[j];
                            LstUser[ind_functie - 1].users[j] = aux;
                        }
                }
                $("#RoleTemplate").tmpl(LstUser).appendTo("#tabel");
                cid = "#tab" + ind_functie;
                functSelect = ind_functie;
                $(cid).show();
            }
            else if (ind_ord == 2) {
                // sortare descendenta
                for (var i = 0; i < LstUser[ind_functie - 1].users.length - 1; i++) {
                    for (var j = i + 1; j < LstUser[ind_functie - 1].users.length; j++)
                        if (LstUser[ind_functie - 1].users[i].UserName < LstUser[ind_functie - 1].users[j].UserName) {
                            var aux = LstUser[ind_functie - 1].users[i];
                            LstUser[ind_functie - 1].users[i] = LstUser[ind_functie - 1].users[j];
                            LstUser[ind_functie - 1].users[j] = aux;
                        }
                }
                $("#RoleTemplate").tmpl(LstUser).appendTo("#tabel");
                cid = "#tab" + ind_functie;
                functSelect = ind_functie;
                $(cid).show();
            }
        }
        function afisare(LstUser, ind_ord) {
            $("#RoleTemplate").tmpl(LstUser).appendTo("#tabel");
            
            if (ind_ord == 1) {
                $("#pic_ord").addClass("arrow_asc");
                $("#pic_ord").removeClass("arrow_none");
            }
            if (ind_ord == 2) {
                $("#pic_ord").addClass("arrow_desc");
                $("#pic_ord").removeClass("arrow_asc");
            }
            if (ind_ord == 0) {
                $("#pic_ord").addClass("arrow_none");
                $("#pic_ord").removeClass("arrow_desc");
            }
            
        }

    </script>
</asp:Content>
