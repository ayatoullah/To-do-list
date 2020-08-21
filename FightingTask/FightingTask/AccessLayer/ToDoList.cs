using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace FightingTask.AccessLayer
{
    public class ToDoList
    {
        //public static DataTable selectall()
        //{
        //    SqlCommand cmd = new SqlCommand("select * from [User]");
        //    DataTable dt = DBLayer.DBLayer.select(cmd);
        //    return dt;

        //}



        public static DataTable selectbydatecat(int UserID, int CatID, DateTime Date)
        {
            SqlCommand cmd = new SqlCommand("select ID,Todolist,status from [dbo].[Todolist] where[UserID] = @UserID and[CatID] = @CatID and[Date] = @date");
            cmd.Parameters.AddWithValue("@UserID", UserID);
            cmd.Parameters.AddWithValue("@CatID", CatID);
            cmd.Parameters.AddWithValue("@Date", Date); // mashy handleh b nafs el tare2a ba2a m..s.h.. hethadl b2h h3ml try catch mayfash nafseltare2a
            DataTable dt = DBLayer.DBLayer.select(cmd);
            return dt;
        }
        public static int insert(int UserID,int CatID,string ToDoList, DateTime Date,string status)
        {
            SqlCommand cmd = new SqlCommand(" insert into Todolist(UserID,CatID,Todolist,Date,status)values(@UserID,@CatID,@ToDoList,@Date,@status)");
            cmd.Parameters.AddWithValue("UserID", UserID);
            cmd.Parameters.AddWithValue("CatID", CatID);
            cmd.Parameters.AddWithValue("ToDoList", ToDoList);
            cmd.Parameters.AddWithValue("status", status);
            cmd.Parameters.AddWithValue("Date", Date);
            int roweffect = DBLayer.DBLayer.DML(cmd);
            return (roweffect);

        }
        
        public static int delete(string Todolist)
        {
            SqlCommand cmd = new SqlCommand("delete from Todolist where Todolist=@Todolist");
            cmd.Parameters.AddWithValue("Todolist",Todolist);
            int roweffect = DBLayer.DBLayer.DML(cmd);
            return (roweffect);
        }

        ////event on chkbox
        //public static int checkboxlistupdate(int UserID, int CatID, string ToDoList, DateTime Date, string status)
        //{
        //    SqlCommand cmd = new SqlCommand("update Todolist set Status=@status where Todolist=@Todolist and UserID=@UserID and CatID=@CatID and ToDoList=@ToDoList,");
        //    cmd.Parameters.AddWithValue("UserID", UserID);
        //    cmd.Parameters.AddWithValue("CatID", CatID);
        //    cmd.Parameters.AddWithValue("ToDoList", ToDoList);
        //    cmd.Parameters.AddWithValue("Date", Date);
        //    int roweffect = DBLayer.DBLayer.DML(cmd);
        //    return (roweffect);

        //}


        public static int checkboxlistupdate(int UserID, int CatID, string ToDoList, DateTime Date,string status)
        {
           
            SqlCommand cmd = new SqlCommand(" update[dbo].[Todolist] set status = @status where Todolist = @Todolist and UserID = @UserID and CatID = @CatID");
            cmd.Parameters.AddWithValue("UserID", UserID);//satr elsql msh betnafz
            cmd.Parameters.AddWithValue("CatID", CatID);
            cmd.Parameters.AddWithValue("ToDoList", ToDoList);
            cmd.Parameters.AddWithValue("Date", Date);
            cmd.Parameters.AddWithValue("status", status);
            int roweffect = DBLayer.DBLayer.DML(cmd);
            return (roweffect);

        }

        //public static int categoryupdate(int UserID, int CatID, string ToDoList, DateTime Date)
        //{
        //    SqlCommand cmd = new SqlCommand("update Todolist set UserID=@UserID,CatID=@CatID,ToDoList=@ToDoList,Date=@Date where CatID=@CatID");
        //    cmd.Parameters.AddWithValue("UserID", UserID);
        //    cmd.Parameters.AddWithValue("CatID", CatID);
        //    cmd.Parameters.AddWithValue("ToDoList", ToDoList);
        //    cmd.Parameters.AddWithValue("Date", Date);

        //    int roweffect = DBLayer.DBLayer.DML(cmd);
        //    return (roweffect);

        //}

        // garaby


    }
}