using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using System.Data.SqlClient;

public partial class Messages : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }


    public bool DeleteMe
    {
        get { return CB_Delete.Checked; }
    }

    // Omlt for paid members
    public string ImageButtonID
    {
        set
        {
            HL_Replay.Visible = true;
            HL_Replay.Attributes.Add("onclick", "newWindow('SendMessages.aspx?id=" + value + "','SendMessage','500','250')");
        }
    }



    public void Bind(MemberMessage message)
    {
        // making visibility true
        this.Visible = true;
        // Setting Index
        L_No.Text = message.Index.ToString();
        // Setting Date
        L_Date.Text = message.Date;
        // Setting From/To
        HL_MessageFrom_To.Text = message.From_To;
        // Setting Messages
        L_Message.Text = message.Message;
        // is the mail readed
        if (message.MessageReaded)
        {
            Img_Status.ImageUrl = "~/Resources/mesread.gif";
            Img_Status.ToolTip = "Readed Message";
        }

        try
        {
            HttpCookieCollection objHttpCookieCollection = Request.Cookies;
            HttpCookie objHttpCookie = objHttpCookieCollection.Get("MatCookie5639sb");
                //<<<ForTesting>>>>
            if (Crypto.DeCrypto(objHttpCookie.Values["UserType"]) == "PaidMember")
            {
                HL_Replay.Visible = true;
                HL_Replay.Attributes.Add("onclick", "newWindow('SendMessages.aspx?id=" + message.From_To + "','SendMessage','500','250')");
            }

        }
        catch (Exception)
        { }
    }

    public void Bind(string MatrimonialID ,int MessageID,int Index,InternalMessage.MailType Type)
    {
        /* * * * * * * * * * * * * * * * * * * * * * * * * * * * 
        Procedure Name : UserMessages_MaiBox
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Type: SELECT 
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Parameters :
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
                    @MEssageID int
                    @Flage
                    @MatrimonialID
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
                    MessageFrom
                    MessageTo
                    Message
                    Status
         * * * * * * * * * * * * * * * * * * * * * * * * * * * */

        HF_ID.Value = MessageID.ToString();

        using (SqlConnection objConnection = DBConnection.GetSqlConnection())
        {
            try
            {
                //Creating Command object
                SqlCommand objCommand = new SqlCommand("UserMessages_MaiBox", objConnection);
                objCommand.CommandType = CommandType.StoredProcedure;
                //Adding Parameters
                objCommand.Parameters.Add(new SqlParameter("@MessageID", SqlDbType.SmallInt));
                objCommand.Parameters["@MessageID"].Value = MessageID;
                objCommand.Parameters.Add(new SqlParameter("@MatrimonialID ", SqlDbType.VarChar));
                objCommand.Parameters["@MatrimonialID "].Value = MatrimonialID;

                if (Type == InternalMessage.MailType.OutBox)
                {
                    objCommand.Parameters.Add(new SqlParameter("@Flage", SqlDbType.SmallInt));
                    objCommand.Parameters["@Flage"].Value = 1;
                }
                
                //Databse Operations
                objConnection.Open();
                SqlDataReader objReader = objCommand.ExecuteReader();
                objReader.Read();
                //Getting Values

                // making visibility true
                this.Visible = true;
                // Setting Index
                L_No.Text = Index.ToString();
                // Setting Date
                DateTime dateTemp = Convert.ToDateTime(objReader["DateSend"]);
                L_Date.Text = dateTemp.Day.ToString() + ":" + dateTemp.Month.ToString() + ":" + dateTemp.Year.ToString();
                // Setting From/To
                if (Type == InternalMessage.MailType.Inbox)
                {
                    HL_MessageFrom_To.Text = objReader["MessageFrom"].ToString();
                    HL_MessageFrom_To.NavigateUrl = "~/MyProfile/" + objReader["MessageFrom"].ToString()+".aspx";
                    HL_MessageFrom_To.Attributes.Add("target", "_blank");
                    try
                    {
                        HttpCookieCollection objHttpCookieCollection = Request.Cookies;
                        HttpCookie objHttpCookie = objHttpCookieCollection.Get("MatCookie5639sb");
                        //<<<<<<< ForTesting >>>>>>> Need to Change Dimesion after filling caption
                        if (Crypto.DeCrypto(objHttpCookie.Values["UserType"]) == "PaidMember")
                        {
                            HL_Replay.Visible = true;
                            HL_Replay.Attributes.Add("onclick", "newWindow('SendMessages.aspx?id=" + objReader["MessageTo"].ToString() + "','SendMessage','585','250')");
                        }

                    }
                    catch (Exception)
                    { }
                }
                else
                {
                    HL_MessageFrom_To.Text = objReader["MessageTo"].ToString();
                }
                // Setting Messages
                L_Message.Text = objReader["Message"].ToString();
                // is the mail readed

                if (Convert.ToBoolean(objReader["Status"]))
                {
                    Img_Status.ImageUrl = "~/Resources/mesread.gif";
                    Img_Status.ToolTip = "Readed Message";
                }



            }
            catch (Exception)
            {
                this.Visible = false;
            }
            finally
            {

                objConnection.Close();
            }
        }
    
    }

    public void Delete()
    {
        /* * * * * * * * * * * * * * * * * * * * * * * * * * * * 
        Procedure Name : UserMessages_TrashMessage
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Type: SELECT 
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Parameters :
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
                    @MessageID varchar(15)
         * * * * * * * * * * * * * * * * * * * * * * * * * * * */
        if (CB_Delete.Checked)
        {
            using (SqlConnection objConnection = DBConnection.GetSqlConnection())
            {
                try
                {
                    //Creating Command object
                    SqlCommand objCommand = new SqlCommand("UserMessages_TrashMessage", objConnection);
                    objCommand.CommandType = CommandType.StoredProcedure;
                    //Adding Parameters
                    objCommand.Parameters.Add(new SqlParameter("@MessageID", SqlDbType.VarChar));
                    objCommand.Parameters["@MessageID"].Value = Int32.Parse(HF_ID.Value);

                    //Databse Operations
                    objConnection.Open();
                    int intTemp = objCommand.ExecuteNonQuery();
                    //Getting Values
                }
                catch (Exception)
                {
                }
                finally
                {
                    objConnection.Close();
                }
            }
        }
    }




}
