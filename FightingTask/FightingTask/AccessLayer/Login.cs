using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace FightingTask.AccessLayer
{
    public class Login
    {
        public static DataTable selById(int id)
        {
            SqlCommand cmd = new SqlCommand("SELECT [email],[password] FROM Login where UserID=@id ");
            cmd.Parameters.AddWithValue("id", id);
            return DBLayer.DBLayer.select(cmd);

        }
        public static DataTable selectlog(string email, string password)
        {
            SqlCommand cmd = new SqlCommand("select UserID from Login where email=@email and password=@password");
            cmd.Parameters.AddWithValue("@email", email);
            cmd.Parameters.AddWithValue("@password", password);
            DataTable dt = DBLayer.DBLayer.select(cmd);
            return (dt);
        }



    }
}