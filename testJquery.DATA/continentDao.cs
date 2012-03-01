using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

namespace testJquery
{
    public class continentDao
    {
        public static List<ContinentInfo> getAllContinent()
        {
            List<ContinentInfo> Contlist = new List<ContinentInfo>();

            SqlConnection con = new SqlConnection(Bound.connectionString);
            SqlCommand cmd = new SqlCommand();
            con.Open();
            try
            {
                cmd.Connection = con;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "GetContinent";


                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    ContinentInfo ob = new ContinentInfo();
                    /*ob.CategorieID = Convert.ToInt64(reader["CategorieID"]);
                    ob.CategorieName = reader["CategorieName"].ToString();*/

                    /*PropertyInfo[] pList = typeof(CountryInfo).GetProperties();
                    foreach (PropertyInfo pi in pList)
                    {
                        object value = reader[pi.Name];
                        if (!value.GetType().Equals(typeof(DBNull)))
                        {
                            ob.GetType().GetProperty(pi.Name, BindingFlags.Public | BindingFlags.Instance).SetValue(ob, value, null);
                        }
                    }*/
                    ob.ContinentID = Convert.ToInt32(reader["ContinentID"]);
                    ob.ContinentName = reader["ContinentName"].ToString();
                    

                    Contlist.Add(ob);
                }
            }
            catch (Exception e)
            {
                // eroare
                con.Close();
                return null;
            }
            finally
            {
                con.Close();
            }

            return Contlist;
        }
    }
}