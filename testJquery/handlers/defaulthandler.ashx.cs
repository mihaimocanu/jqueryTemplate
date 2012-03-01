using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;

namespace testJquery.handlers
{
	/// <summary>
	/// Summary description for defaulthandler
	/// </summary>
	public class defaulthandler : IHttpHandler
	{

		public void ProcessRequest(HttpContext context)
		{
			if (context.Request.QueryString["Command"] != null || context.Request.QueryString["Command"] == "a")
			{
				List<ContinentInfo> lstContinent=continentDao.getAllContinent();
                JavaScriptSerializer serializer = new JavaScriptSerializer();
                string jsonresult = serializer.Serialize(lstContinent);
				context.Response.Write(jsonresult);
				context.Response.ContentType = "application/json";
				context.Response.End();
			}

             if(context.Request.QueryString["Country"] != null )
            {
                List<CountryInfo> lstCountry = countryDao.getCountryfromCont(Convert.ToInt32(context.Request.QueryString["Country"]));
                JavaScriptSerializer serializer = new JavaScriptSerializer();
                string jsonresult = serializer.Serialize(lstCountry);
                context.Response.Write(jsonresult);
                context.Response.ContentType = "application/json";
                context.Response.End();
            }
           
            if (context.Request.QueryString["CountryUser"] != null)
            {
                int CountryID = Convert.ToInt32(context.Request.QueryString["CountryUser"]);
                List<RolesInfo> listofRoles = userDao.getRoles();
                List<UserInfo> listofusers = new List<UserInfo>();
                List<Object> UsrLst = new List<Object>();

                foreach (RolesInfo role in listofRoles)
                {
                 listofusers = userDao.getUserbyRoleID(role.RoleID, CountryID);
                    //string RoleID = CountryID.ToString() + role.RoleID.ToString();
                    UsrLst.Add(new { role.RoleName, role.RoleID, users = listofusers.Select(u => new { u.UserName, u.UserLastName, u.UserFirstName, u.Useremail, u.Userimage, u.UserID }).ToList<Object>() });
                }

                JavaScriptSerializer serializer = new JavaScriptSerializer();
                string jsonresult = serializer.Serialize(UsrLst);
                context.Response.Write(jsonresult);
                context.Response.ContentType = "application/json";
                context.Response.End();
            }
		}


		public bool IsReusable
		{
			get
			{
				return false;
			}
		}

        public object roles { get; set; }
    }

}