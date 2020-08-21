using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
namespace FightingTask.AccessLayer
{
    public class Categories
    {
        public static DataTable selectAll()
        {
            SqlCommand cmd = new SqlCommand("select CatName,CatID from Categories");//sure
            DataTable dt = DBLayer.DBLayer.select(cmd);
            return dt;
        }
        public static DataTable selById(int id)
        {
            SqlCommand cmd = new SqlCommand("select CatName from Categories where CatID = @id");//sure
            cmd.Parameters.AddWithValue("CatID", id);

            return DBLayer.DBLayer.select(cmd);

        }
        public static DataTable selByCatName(string CatName)
        {
            SqlCommand cmd = new SqlCommand("select CatID from categories where CatName = @CatName");//sure
            cmd.Parameters.AddWithValue("CatID",CatName);

            return DBLayer.DBLayer.select(cmd);

        }


    }
}