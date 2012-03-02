using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Reflection;
using System.Data;

namespace testJquery
{
	public class userDao:Base
	{
		public static List<UserInfo> getUserbyRoleID(int roleid,int cntrid,int ord)
		{
			List<UserInfo> obj = new List<UserInfo>();
			try
			{
                SqlConnection conn = new SqlConnection(Bound.connectionString);
				SqlCommand command = new SqlCommand();
				command.Connection = conn;
				conn.Open();
				command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "GetUserOrd";
                command.Parameters.AddWithValue("@usrType", roleid);
                command.Parameters.AddWithValue("@countrID", cntrid);
                command.Parameters.AddWithValue("@ord", ord);
				//command.Parameters.Add(p1);
				SqlDataReader dr = command.ExecuteReader();

				while (dr.Read())
				{
				
					UserInfo x=new UserInfo();
					x.UserID = Convert.ToInt32(dr["UserID"]);
					x.UserName = dr["UserName"] as string;
					x.UserFirstName = dr["UserFirstName"] as string;
                    x.UserLastName = dr["UserLastName"] as string;
                    x.Useremail = dr["Useremail"] as string;
                    x.Userimage = dr["UserimageID"] as string;
                    x.UsercountryID = Convert.ToInt32(dr["UsercountryID"]);
					//x.userType = dr["role"] as string;
					obj.Add(x);
				}

				conn.Close();


			}
			catch (Exception)
			{

			}
			return obj;
		}
		public static List<RolesInfo> getRoles()
		{
			List<RolesInfo> obj = new List<RolesInfo>();
			try
			{
                SqlConnection conn = new SqlConnection(Bound.connectionString);
				SqlCommand command = new SqlCommand();
				command.Connection = conn;
				conn.Open();
				command.CommandType = CommandType.StoredProcedure;
				command.CommandText = "getRoles";
				
				SqlDataReader dr = command.ExecuteReader();

				while (dr.Read())
				{
					RolesInfo roles = new RolesInfo();
					roles.RoleID = Convert.ToInt32(dr["RoleID"]);
					roles.RoleName = dr["RoleName"] as string;
					obj.Add(roles);
				}

				conn.Close();


			}
			catch (Exception)
			{

			}
			return obj;
		}
        public static UserInfo getUserbyID(int usrid)
        {
            UserInfo obj = new UserInfo();
            try
            {
                SqlConnection conn = new SqlConnection(Bound.connectionString);
                SqlCommand command = new SqlCommand();
                command.Connection = conn;
                conn.Open();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "GetUserByID";
                command.Parameters.AddWithValue("@usrID", usrid);
                SqlDataReader dr = command.ExecuteReader();
                while (dr.Read())
                {

                    //UserInfo x = new UserInfo();
                    obj.UserID = Convert.ToInt32(dr["UserID"]);
                    obj.UserName = dr["UserName"] as string;
                    obj.UserFirstName = dr["UserFirstName"] as string;
                    obj.UserLastName = dr["UserLastName"] as string;
                    obj.Useremail = dr["Useremail"] as string;
                    obj.Userimage = dr["UserimageID"] as string;
                    obj.UsercountryID = Convert.ToInt32(dr["UsercountryID"]);
                    //x.userType = dr["role"] as string;
                    //obj.Add(x);
                }

                conn.Close();


            }
            catch (Exception)
            {

            }
            return obj;
        }
	}
}