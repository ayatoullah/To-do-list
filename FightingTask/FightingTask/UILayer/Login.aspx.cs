using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FightingTask.UILayer
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_login_Click(object sender, EventArgs e)
        {

            //Session.Add("mail", txt_mail.Text);
            //Session.Add("password", txt_pass.Text);
            DataTable dtt = new DataTable();
            //dtt = user.selectlog(Session["mail"].ToString(), Session["password"].ToString());
            dtt = AccessLayer.Login.selectlog(txt_mail.Text, txt_pass.Text);
            if (dtt.Rows.Count != 0)
            {
                
                Session.Add("UserID", dtt.Rows[0]["UserID"].ToString());
                Response.Redirect("~/UILayer/ToDoList.aspx");

            }
        }


       
    }
}