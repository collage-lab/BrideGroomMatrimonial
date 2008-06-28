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



public partial class Member_SearchProfile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            switch (Request.QueryString["id"])
            {
                case "simple":
                    L_SearchType.Text = "Simple Search";
                    TR_Relegion.Visible = true;
                    TR_Caste.Visible = true;
                    TR_Cat.Visible = false;
                    TR_Age.Visible = true;
                    DDL_Cat_Bind(1);
                    DDL_Religion.Attributes.Add("onchange", "return caste_disable(document." + this.Form.ClientID + "." + DDL_Religion.ClientID + ",document." + this.Form.ClientID + "." + HF_Cast.ClientID + ",document." + this.Form.ClientID + "." + S_Caste.ClientID + ")");
                    S_Caste.Attributes.Add("onchange", "loadHF(document." + this.Form.ClientID + "." + S_Caste.ClientID + ",document." + this.Form.ClientID + "." + HF_Cast.ClientID + ")");
                    HF_Type.Value = "1";
                    break;
                case "edu":
                    L_SearchType.Text = "Educational Search";
                    L_Cato_1.Text = "Education";
                    L_criteria.Text = "Education";
                    DDL_Cat_1.Width = 280;
                    DDL_Cat_Bind(2);
                    TR_Age.Visible = true;
                    TR_Relegion.Visible = true;
                    TR_Caste.Visible = true;
                    TR_Cat.Visible = true;
                    DDL_Religion.Attributes.Add("onchange", "return caste_disable(document." + this.Form.ClientID + "." + DDL_Religion.ClientID + ",document." + this.Form.ClientID + "." + HF_Cast.ClientID + ",document." + this.Form.ClientID + "." + S_Caste.ClientID + ")");
                    S_Caste.Attributes.Add("onchange", "loadHF(document." + this.Form.ClientID + "." + S_Caste.ClientID + ",document." + this.Form.ClientID + "." + HF_Cast.ClientID + ")");
                    HF_Type.Value = "2";
                    break;
                case "occ":
                    L_SearchType.Text = "Occupational Search";
                    L_Cato_1.Text = "Occupation";
                    L_criteria.Text = "Occupation";
                    TR_Age.Visible = true;
                    DDL_Cat_Bind(3);
                    TR_Relegion.Visible = true;
                    TR_Caste.Visible = true;
                    TR_Cat.Visible = true;
                    DDL_Religion.Attributes.Add("onchange", "return caste_disable(document." + this.Form.ClientID + "." + DDL_Religion.ClientID + ",document." + this.Form.ClientID + "." + HF_Cast.ClientID + ",document." + this.Form.ClientID + "." + S_Caste.ClientID + ")");
                    S_Caste.Attributes.Add("onchange", "loadHF(document." + this.Form.ClientID + "." + S_Caste.ClientID + ",document." + this.Form.ClientID + "." + HF_Cast.ClientID + ")");
                    HF_Type.Value = "3";
                    break;
                case "keyword":
                    L_SearchType.Text = "Keyword Search";
                    L_Cato_1.Text = "Keyword";
                    L_criteria.Text = "Keyword";
                    TB_Keyword.Visible = true;
                    DDL_Cat_1.Visible = false;
                    TR_Relegion.Visible = false;
                    TR_Caste.Visible = false;
                    TR_Cat.Visible = true;
                    HF_Type.Value = "4";
                    TR_Age.Visible = false;
                    // Search By City
                    break;
                case "City":
                    string strKey = RandomString.GenerateStirng(5, true);
                    Session.Add(strKey, TB_Keyword.Text);
                    Server.Transfer("~/Member/SearchResult.aspx?typ=4&g=False&str=" + Request.QueryString["cty"]);
                    break;
                default:
                    L_SearchType.Text = "Simple Search";
                    TR_Relegion.Visible = true;
                    TR_Caste.Visible = true;
                    TR_Cat.Visible = false;
                    TR_Age.Visible = true;
                    DDL_Cat_Bind(1);
                    DDL_Religion.Attributes.Add("onchange", "return caste_disable(document." + this.Form.ClientID + "." + DDL_Religion.ClientID + ",document." + this.Form.ClientID + "." + HF_Cast.ClientID + ",document." + this.Form.ClientID + "." + S_Caste.ClientID + ")");
                    S_Caste.Attributes.Add("onchange", "loadHF(document." + this.Form.ClientID + "." + S_Caste.ClientID + ",document." + this.Form.ClientID + "." + HF_Cast.ClientID + ")");
                    HF_Type.Value = "1";
                    break;
            }

            // Adding meta Discription
            HtmlMeta objMeta = new HtmlMeta();
            objMeta.Name = "Description";
            objMeta.Content = WebConfig.GetValues("MetaDiscription");
            this.Header.Controls.Add(objMeta);

            // Adding meta KeyWords
            objMeta = new HtmlMeta();
            objMeta.Name = "keywords";
            objMeta.Content = WebConfig.GetValues("MetaKeword");
            this.Header.Controls.Add(objMeta);

        }
        else
        {
            /// Search
            /// 
            Page.Validate();

            if (IsValid)
            {
                switch (HF_Type.Value)
                {
                    case "1":
                        Server.Transfer("~/Member/SearchResult.aspx?typ=1&g=" + RB_Male.Checked.ToString() + "&ai=" + TB_AgeMin.Text + "&ax=" + TB_AgeMax.Text + "&r=" + DDL_Religion.SelectedIndex.ToString() + "&c=" + HF_Cast.Value + "&ph=" + CB_needPhoto.Checked.ToString());
                        break;
                    case "2":
                        Server.Transfer("~/Member/SearchResult.aspx?typ=2&g=" + RB_Male.Checked.ToString() + "&ai=" + TB_AgeMin.Text + "&ax=" + TB_AgeMax.Text + "&r=" + DDL_Religion.SelectedIndex.ToString() + "&c=" + HF_Cast.Value + "&ph=" + CB_needPhoto.Checked.ToString() + "&cri=" + DDL_Cat_1.SelectedIndex.ToString());
                        break;
                    case "3":
                        Server.Transfer("~/Member/SearchResult.aspx?typ=3&g=" + RB_Male.Checked.ToString() + "&ai=" + TB_AgeMin.Text + "&ax=" + TB_AgeMax.Text + "&r=" + DDL_Religion.SelectedIndex.ToString() + "&c=" + HF_Cast.Value + "&ph=" + CB_needPhoto.Checked.ToString() + "&cri=" + DDL_Cat_1.SelectedIndex.ToString());
                        break;
                    case "4":
                        string strKey = RandomString.GenerateStirng(5, true);
                        Session.Add(strKey, TB_Keyword.Text);
                        Server.Transfer("~/Member/SearchResult.aspx?typ=4&g=" + RB_Male.Checked.ToString() + "&str=" + strKey);
                        break;
                    default:
                        // Do Search
                        break;
                }

            }
        }
    }



    private void DDL_Cat_Bind(sbyte Index)
    {
        //Getting Connection String

        //Connect To database

        switch (Index)
        {
                //Simple
            case 1:
                DDL_Religion.DataSource = ControlDataLoader.DataForLoadingControls(ControlDataLoader.ControlType.Religion);
                DDL_Religion.DataTextField = "Item";
                DDL_Religion.DataValueField = "Value";
                DDL_Religion.DataBind();
                break;
                // Education
            case 2:
                DDL_Cat_1.DataSource = ControlDataLoader.DataForLoadingControls(ControlDataLoader.ControlType.Education);
                DDL_Cat_1.DataTextField = "Item";
                DDL_Cat_1.DataValueField = "Value";
                DDL_Cat_1.DataBind();

                DDL_Religion.DataSource = ControlDataLoader.DataForLoadingControls(ControlDataLoader.ControlType.Religion);
                DDL_Religion.DataTextField = "Item";
                DDL_Religion.DataValueField = "Value";
                DDL_Religion.DataBind();
                break;
                //Occupation
            case 3:
                DDL_Cat_1.DataSource = ControlDataLoader.DataForLoadingControls(ControlDataLoader.ControlType.Occupation);
                DDL_Cat_1.DataTextField = "Item";
                DDL_Cat_1.DataValueField = "Value";
                DDL_Cat_1.DataBind();


                DDL_Religion.DataSource = ControlDataLoader.DataForLoadingControls(ControlDataLoader.ControlType.Religion);
                DDL_Religion.DataTextField = "Item";
                DDL_Religion.DataValueField = "Value";
                DDL_Religion.DataBind();
                break;
            default:

                DDL_Religion.DataSource = ControlDataLoader.DataForLoadingControls(ControlDataLoader.ControlType.Religion);
                DDL_Religion.DataTextField = "Item";
                DDL_Religion.DataValueField = "Value";
                DDL_Religion.DataBind();
                break;
        }

    }
}