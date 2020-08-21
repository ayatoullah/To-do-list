using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace FightingTask.UILayer
{
    public partial class ToDoList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
             
        {//sawany
             
            if (!IsPostBack)
            {

                

                UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
                DataTable dt = new DataTable();
                dt= AccessLayer.Categories.selectAll();
                ddl_category.DataSource = AccessLayer.Categories.selectAll();
                ddl_category.DataTextField = "CatName";
                ddl_category.DataValueField = "CatID";
                
                
                ddl_category.DataBind();
                Del_List_Box.Visible = false;
                del_btn.Visible = false;

                int UserID = Convert.ToInt32(Session["UserID"]);
                DateTime Date;
                Date = Calendar1.SelectedDate == new DateTime(1,1,1)? DateTime.Now.Date : Calendar1.SelectedDate.Date;
                CheckBoxList1.Items.Clear(); // garaby kda//mn3'eer elsatreen?? aha 
                int CatID = Convert.ToInt32(ddl_category.SelectedItem.Value);
                DataTable t = AccessLayer.ToDoList.selectbydatecat(UserID, CatID, Date);
                foreach (DataRow item in t.Rows)
                {
                    ListItem x = new ListItem();//n3rd datatable wnnady b t.rows[0].kaza btha2ly mmkn kda amsk status ... mnha a2dar a3ml check wla eeh?? // mashy garabeha ama a5alas w asthomf akda 
                    x.Text = item["Todolist"].ToString();
                    x.Value = item["ID"].ToString();
                    x.Selected = item["status"].ToString() == "1";//feeh haga bardo elcategory msh bt3ml fire llevent msh 3arfa lleh?? ... anho event  ? msh btgeb mn data // mashy 
                    CheckBoxList1.Items.Add(x);
                }

            }
            //UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            //if (Session["UserID"] == null)
            //{
            //    Response.Redirect("~/UILayer/Login.aspx");
            //}

            //else
            //{
            //    DataTable dt = new DataTable();
            //    dt = AccessLayer.ToDoList.selectbydatecat(int.Parse(Session["UserID"].ToString()));
            //    lbl_fname.Text = dt.Rows[0]["fName"].ToString();
            //    lbl_lname.Text = dt.Rows[0]["lName"].ToString();
            //    lbl_mail.Text = dt.Rows[0]["email"].ToString();
            //    lbl_username.Text = dt.Rows[0]["userName"].ToString();
            //    img_profile.ImageUrl = dt.Rows[0]["image"].ToString();
            //    lbl_add.Text = dt.Rows[0]["address"].ToString();
            //    lbl_phone.Text = dt.Rows[0]["phone"].ToString();



            //}



        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            calStatus_lbl.Text = "";
            lbl_status.Text = "";
            //ID,[Todolist]
            //DataTable dt = new DataTable();
            int UserID = Convert.ToInt32(Session["UserID"]);
            DateTime Date;
            Date = Calendar1.SelectedDate;
            //if (Calendar1.SelectedDate==null)
            //{

            //    //Calendar1.SelectedDate = DateTime.Today;
            //    //Date = Calendar1.SelectedDate;
            //    Date= DateTime.Today;
            //}
            //else
            //{
            //    Date = Calendar1.SelectedDate;
            //}
            

            int CatID = Convert.ToInt32(ddl_category.SelectedItem.Value);
            //string ToDoList = ToDoList_txtbox.Text;
            //dt = AccessLayer.ToDoList.selectbydatecat(UserID, CatID, Date);

            // CheckBoxList1.DataSource = AccessLayer.ToDoList.selectbydatecat(UserID,CatID,Date);
            ////CheckBoxList1.DataTextField "Todolist";
            //CheckBoxList1.DataValueField = "ID";
            // CheckBoxList1.DataBind();
            CheckBoxList1.Items.Clear(); // garaby kda//mn3'eer elsatreen?? aha 
            DataTable t = AccessLayer.ToDoList.selectbydatecat(UserID, CatID, Date);
            foreach (DataRow item in t.Rows)
            {
                ListItem x = new ListItem();//n3rd datatable wnnady b t.rows[0].kaza btha2ly mmkn kda amsk status ... mnha a2dar a3ml check wla eeh?? // mashy garabeha ama a5alas w asthomf akda 
                x.Text = item["Todolist"].ToString();
                x.Value = item["ID"].ToString();
                x.Selected = item["status"].ToString() == "1";//feeh haga bardo elcategory msh bt3ml fire llevent msh 3arfa lleh?? ... anho event  ? msh btgeb mn data // mashy 
                CheckBoxList1.Items.Add(x);
            }
            //CheckBoxList1.ئئ
            //int i = 0;
            //string selectedItem = string.Empty;
            //if (CheckBoxList1.Items.Count > 0)
            //{
            //    for (i = 0; i < Del_List_Box.Items.Count; i++)
            //    {
            //        if (CheckBoxList1.Items[i].Selected)
            //        {
            //            selectedItem = CheckBoxList1.Items[i].Text.ToString();
            //            CheckBoxList1.Items.RemoveAt(CheckBoxList1.SelectedIndex);
            //            AccessLayer.ToDoList.delete(selectedItem);
            //            //selectedItem += Del_List_Box.Items[i].Text.ToString() + ", ";
            //            //insert command
            //        }
            //    }
            //}



            //CheckBoxList1.Items
            //if()



        }

        protected void add_btn_Click(object sender, EventArgs e)
        {
            bool valid = true;
            calStatus_lbl.Text = "";
            lbl_status.Text = "";
            if (Session["UserID"] == null)
            {
                Response.Redirect("~/UILayer/Login.aspx");
            }
            else
            {
                
                try
                {
                    lbl_status.Text = "";
                    int UserID = Convert.ToInt32(Session["UserID"]);
                    int CatID = Convert.ToInt32(ddl_category.SelectedItem.Value);
                    string ToDoList = string.Empty;
                    string status = "0";
                    DateTime Date = Calendar1.SelectedDate == new DateTime(1, 1, 1) ? DateTime.Now.Date : Calendar1.SelectedDate.Date;

                    if (Date <= DateTime.Now.AddDays(-1))
                    {
                        valid = false;
                        calStatus_lbl.Text = "enter the date today or in the future ";
                        //Response.Redirect("~/UILayer/ToDoList.aspx?date=0");
                    }
                    else // sawany
                    {

                        calStatus_lbl.Text = "";
                        //valid = true;
                        Date = Calendar1.SelectedDate == new DateTime(1, 1, 1) ? DateTime.Now.Date : Calendar1.SelectedDate.Date;
                    }
                    // sawany
                    //    if (Calendar1.SelectedDate == Convert.ToDateTime("1/1/0001"))
                    //{
                    //    Date = Calendar1.SelectedDate;
                    //}
                    //else
                    //{
                    //    Date = Calendar1.TodaysDate;
                    //}
                    if (string.IsNullOrEmpty(ToDoList_txtbox.Text))//ezay msh null ma kant sha3'ala...bom bloa // ma howa  msh null ezay y3ny hwa ana katabt haga
                    {
                        lbl_status.Text = "enter todo task";
                        valid = false;//garaby Response.Redirect("~/UILayer/ToDoList.aspx?todo=0");//a3ml eh lw shelt comment status msh htlh3 tzhar wlaw masheltsh hedaf?? // hay3mel elly f el page load ..... ah kdaamsh howa sha3'al zay manty 3awza  ?l2 ommal s ?H  esma3 record mafesh wa2t akteb
                        //tatus msh htzhar a3ml eh?? // esma3 elrecord

                    }
                    else
                    {
                        ToDoList = ToDoList_txtbox.Text;
                        
                    }
                    if (valid)
                    {


                        DataTable dtt = new DataTable();
                        int rowseffect = AccessLayer.ToDoList.insert(UserID, CatID, ToDoList, Date, status);
                        if (rowseffect > 0)
                        {
                            CheckBoxList1.DataSource = AccessLayer.ToDoList.selectbydatecat(UserID, CatID, Date);
                            CheckBoxList1.DataTextField = "Todolist";
                            CheckBoxList1.DataValueField = "ID";
                            CheckBoxList1.DataBind();

                            ToDoList_txtbox.Text = "";
                        }
                        else
                        {
                            lbl_status.Text = "please enter your information again";
                        }
                    }


                    //if (Calendar1.SelectedDate ==Convert.ToDateTime ("1 / 1 / 0001 12:00:00 AM"))
                    //{

                    //    //Calendar1.SelectedDate = DateTime.Today;
                    //    //Date = Calendar1.SelectedDate;

                    //    Date = DateTime.Today;
                    //}
                    //else
                    //{
                    //    Date = Calendar1.SelectedDate;
                    //}
                    //Calendar1.SelectedDate = DateTime.Now;
                    //DateTime Date = Calendar1.SelectedDate;

                }
                catch
                {
                   

                        }
                finally {
                   
                }
            }
        }

        protected void ddl_category_SelectedIndexChanged(object sender, EventArgs e)
        {
            calStatus_lbl.Text = "";
            lbl_status.Text = "";

            try
            {
                DataTable dt = new DataTable();
                int UserID = Convert.ToInt32(Session["UserID"]);
                DateTime Date = Calendar1.SelectedDate == new DateTime(1, 1, 1) ? DateTime.Now : Calendar1.SelectedDate;
                int CatID = Convert.ToInt32(ddl_category.SelectedItem.Value);
                string ToDoList = ToDoList_txtbox.Text;
                dt = AccessLayer.ToDoList.selectbydatecat(UserID, CatID, new DateTime(Date.Year , Date.Month , Date.Day)); // garaby 

                CheckBoxList1.DataSource = dt;
                CheckBoxList1.DataTextField = "Todolist";
                CheckBoxList1.DataValueField = "ID";
                CheckBoxList1.DataBind();
            }
            catch
            {
                calStatus_lbl.Text = "PLease select date ";//msh hatfy try and catch:(  mmssh h hroh llcatch // msh f//record

            }
        }

        protected void del_btn_Click(object sender, EventArgs e)
        {
            calStatus_lbl.Text = "";
            lbl_status.Text = "";
            //listBox1.Items.Remove(listBox1.SelectedIndex);
            //Del_List_Box.Items.RemoveAt(selected)
            //store
            DataTable dt = new DataTable();
            int UserID = Convert.ToInt32(Session["UserID"]);
            DateTime Date = Calendar1.SelectedDate == new DateTime(1, 1, 1) ? DateTime.Now.Date : Calendar1.SelectedDate.Date;
            int CatID = Convert.ToInt32(ddl_category.SelectedItem.Value);
            //string ToDoList = Del_List_Box.SelectedItem.ToString();
            int i;
            string selectedItem = string.Empty;
            if (Del_List_Box.Items.Count > 0)
            {
                for (i = 0; i < Del_List_Box.Items.Count; i++)
                {
                    if (Del_List_Box.Items[i].Selected)
                    {
                        selectedItem = Del_List_Box.Items[i].Text.ToString();
                        Del_List_Box.Items.RemoveAt(Del_List_Box.SelectedIndex);
                        AccessLayer.ToDoList.delete(selectedItem);
                        //selectedItem += Del_List_Box.Items[i].Text.ToString() + ", ";
                        //insert command
                    }
                }
            }


            //int i = 0;
            //bool select = Del_List_Box.Items[i].Selected;
            //if (select) {
            //    string ToDoList = Del_List_Box.SelectedItem.ToString();
            //}
            //int ToDoList = Del_List_Box.SelectedIndex;
            //delete from listbox
            //Del_List_Box.Items.RemoveAt(Del_List_Box.SelectedIndex);




            //delete from DB
            //AccessLayer.ToDoList.delete(ToDoList);
            //update textbox from DB
            Del_List_Box.DataSource = AccessLayer.ToDoList.selectbydatecat(UserID, CatID, Date);
            Del_List_Box.DataTextField = "Todolist";
            Del_List_Box.DataValueField = "ID";
            Del_List_Box.DataBind();



        }

        

        protected void convert_mode_btn_Click(object sender, EventArgs e)
        {
            int flag = 0;
            calStatus_lbl.Text = "";
            lbl_status.Text = "";
            if (convert_mode_btn.Text == "Convert To Delete Mode")
            {
                flag = 1;
                add_btn.Enabled = false;
                ToDoList_txtbox.Enabled = false;
                CheckBoxList1.Visible = false;
                Del_List_Box.Visible = true;
                del_btn.Visible = true;
                convert_mode_btn.Text = "Convert To Add Mode";
                //display todolist
                try
                {
                    DataTable dt = new DataTable();
                    int UserID = Convert.ToInt32(Session["UserID"]);
                    DateTime Date = Calendar1.SelectedDate == new DateTime(1, 1, 1) ? DateTime.Now : Calendar1.SelectedDate;
                    int CatID = Convert.ToInt32(ddl_category.SelectedItem.Value);
                    //string ToDoList = ToDoList_txtbox.Text;
                    dt = AccessLayer.ToDoList.selectbydatecat(UserID, CatID, new DateTime(Date.Year, Date.Month, Date.Day));

                    Del_List_Box.DataSource = dt;
                    Del_List_Box.DataTextField = "Todolist";
                    Del_List_Box.DataValueField = "ID";
                    Del_List_Box.DataBind();
                }
                catch
                {
                    calStatus_lbl.Text = "u should select date";
                }
            }
            if (flag==0 && convert_mode_btn.Text == "Convert To Add Mode")
            {
                add_btn.Enabled = true;
                ToDoList_txtbox.Enabled = true;
                CheckBoxList1.Visible = true;
                Del_List_Box.Visible = false;
                del_btn.Visible = false;
                convert_mode_btn.Text = "Convert To Delete Mode";

                DataTable dt = new DataTable();
                int UserID = Convert.ToInt32(Session["UserID"]);
                DateTime Date = Calendar1.SelectedDate == new DateTime(1, 1, 1) ? DateTime.Now : Calendar1.SelectedDate;
                int CatID = Convert.ToInt32(ddl_category.SelectedItem.Value);
                //string ToDoList = ToDoList_txtbox.Text;
                dt = AccessLayer.ToDoList.selectbydatecat(UserID, CatID, new DateTime(Date.Year, Date.Month, Date.Day));

                CheckBoxList1.DataSource = AccessLayer.ToDoList.selectbydatecat(UserID, CatID, Date);
                CheckBoxList1.DataTextField = "Todolist";
                CheckBoxList1.DataValueField = "ID";
                CheckBoxList1.DataBind();

            }
            


        }

        protected void Del_List_Box_SelectedIndexChanged(object sender, EventArgs e)
        {
            //calStatus_lbl.Text = "";
            //lbl_status.Text = "";//maloosh lazma
            //Del_List_Box.Items.RemoveAt(Del_List_Box.SelectedIndex);
        }

        protected void CheckBoxList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            calStatus_lbl.Text = "";
            lbl_status.Text = "";
            //if (!IsPostBack)
            //{
            int UserID = Convert.ToInt32(Session["UserID"]);
            DateTime Date = Calendar1.SelectedDate == new DateTime(1, 1, 1) ? DateTime.Now.Date : Calendar1.SelectedDate.Date;
            int CatID = Convert.ToInt32(ddl_category.SelectedItem.Value);
            //string status = CheckBoxList1.SelectedItem.Selected ? "1" : "0"; // la2 estany
       
            


            foreach (ListItem item in CheckBoxList1.Items)//one by one i think // maho el check list de msh naf3a ....... a3aqed el mafrod check box msh list ............ 3shan hena el sender el list kolaha  ............. bybos 3aka awel wa7ed law checked by3'ayaro howa w el ba2y la2 .............. fahma ? hwa check box fi elmatlob---tab eh hat3mlha?? // hana5od el list kolaha zay ma ma3roda w nwadeha el database tsama3 zay ma heya // sawany 
            {
                string ToDoList = item.Text.ToString();
                string status = item.Selected ? "1" : "0";
                AccessLayer.ToDoList.checkboxlistupdate(UserID, CatID, ToDoList, Date, status);
            }
                
            //}
            //int UserID = Convert.ToInt32(Session["UserID"]);
            //DateTime Date = Calendar1.SelectedDate;
            //int CatID = Convert.ToInt32(ddl_category.SelectedItem.Value);
            //string status = "1";
            //string ToDoList=CheckBoxList1.SelectedValue.ToString();
                


            //AccessLayer.ToDoList.checkboxlistupdate(UserID,CatID,ToDoList, Date, status);
            // 3ala fekra by3mel add ll item marten shofy by3mel kda leh fokk hwa ma2lsh check 3liha asasn  exceed time elmohm errors
        }
    }
}
