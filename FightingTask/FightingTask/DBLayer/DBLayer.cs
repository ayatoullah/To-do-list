using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
namespace FightingTask.DBLayer
{
    public class DBLayer
    {
        public static DataTable select(SqlCommand cmd)
        {
            

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["OurProject"].ConnectionString);
            cmd.Connection = con;
            SqlDataAdapter adpt = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adpt.Fill(dt);
            return dt;
        }

        public static int DML(SqlCommand cmd)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["OurProject"].ConnectionString);
            cmd.Connection = con;
            con.Open();

            int roweffect = cmd.ExecuteNonQuery();
            con.Close();
            return roweffect;

        }
    }
}