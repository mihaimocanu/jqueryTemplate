using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using System.Reflection;

namespace testJquery
{
    public class countryDao
    {
        public static List<CountryInfo> getAllCcountry()
        {
            List<CountryInfo> Catlist = new List<CountryInfo>();
            SqlConnection con = new SqlConnection(Bound.connectionString);
            SqlCommand cmd = new SqlCommand();
            con.Open();
            try
            {
                cmd.Connection = con;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "GetCountry";
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    CountryInfo ob = new CountryInfo();
                    ob.CntrID = Convert.ToInt32(reader["CntrID"]);
                    ob.CountryName = reader["CountryName"].ToString();
                    ob.ContinentID = Convert.ToInt32(reader["ContinentID"]);
                    Catlist.Add(ob);
                }
            }
            catch (Exception e)
            {
                // eroare
                return null;
            }
            finally
            {
                con.Close();
            }

            return Catlist;
        }
        public static List<CountryInfo> getCountryfromCont(int contid)
        {
            List<CountryInfo> Catlist = new List<CountryInfo>();
            SqlConnection con = new SqlConnection(Bound.connectionString);
            SqlCommand cmd = new SqlCommand();
            con.Open();
            try
            {
                cmd.Connection = con;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "GetCountryFromContinent";
                cmd.Parameters.AddWithValue("@contID", contid);
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    CountryInfo ob = new CountryInfo();
                    ob.CntrID = Convert.ToInt32(reader["CntrID"]);
                    ob.CountryName = reader["CountryName"].ToString();
                    ob.ContinentID = Convert.ToInt32(reader["ContinentID"]);
                    //x.userType = dr["role"] as string;
                    Catlist.Add(ob);
                }

                con.Close();
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
            return Catlist;
        }
    }
}