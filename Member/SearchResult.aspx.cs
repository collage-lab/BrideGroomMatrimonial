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

public partial class Member_SearchResult : System.Web.UI.Page
{


    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["typ"] != null)
            {

                switch (Request.QueryString["typ"])
                {
                    case "1": // Simple Search
                        this.Title = "Simple Search";
                        Search(SearchEngine.SearchType.Simple);
                        break;
                    case "2": // EducationalSearch
                        this.Title = "EducationalSearch";
                        Search(SearchEngine.SearchType.EducationalSearch);
                        break;
                    case "3": //OccupationalSearch
                        this.Title = "OccupationalSearch";
                        Search(SearchEngine.SearchType.OccupationSearch);
                        break;
                    case "4": // KeyWord Search
                        SerchFor1.Visible = false;
                        this.Title = "KeyWord Search";
                        StringSearch(SearchEngine.SearchType.KeyWordSearch);
                        break;
                    case "5":// AdvanseSearch
                        this.Title = "Advansed Search";
                        SerchFor1.Visible = false;
                        StringSearch(SearchEngine.SearchType.AdvansedSearch);
                        break;
                    default:
                        ErrorLog.WriteLog("Member_SearchResult-Load- SearchType > 5");
                        Response.Redirect("~/Extras/ErrorReport.aspx");
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
            }//Type != null
            else
            {
                ErrorLog.WriteLog("Member_SearchResult-Load- SearchType = NULL");
                Response.Redirect("~/Extras/ErrorReport.aspx");
            }
        }
        else
        {
            int intTemp = int.Parse(HF_Depth.Value) + 1;
            HF_Depth.Value = intTemp.ToString();
            SerchFor1.SearchingDepth = intTemp;
        }
    }



    #region"Navigation"


    protected void LB_Next_Click(object sender, EventArgs e)
    {
        string[] strAMatrimonialID = null;
        string SQLQuery;
        switch (HF_Type.Value)
        {
            case "1":
                strAMatrimonialID = SearchEngine.Search(SearchEngine.SearchType.Simple, bool.Parse(HF_Gen.Value), sbyte.Parse(HF_AMin.Value),
                                sbyte.Parse(HF_AMax.Value), sbyte.Parse(HF_Rel.Value), bool.Parse(HF_ISPhoto.Value), short.Parse(HF_Cst.Value), 0, (int.Parse(HF_Start.Value) + 14));
                break;
            case "2":
                strAMatrimonialID = SearchEngine.Search(SearchEngine.SearchType.EducationalSearch, bool.Parse(HF_Gen.Value), sbyte.Parse(HF_AMin.Value),
                                sbyte.Parse(HF_AMax.Value), sbyte.Parse(HF_Rel.Value), bool.Parse(HF_ISPhoto.Value), short.Parse(HF_Cst.Value), sbyte.Parse(HF_Criteria.Value), (int.Parse(HF_Start.Value) + 14));
                break;
            case "3":
                strAMatrimonialID = SearchEngine.Search(SearchEngine.SearchType.OccupationSearch, bool.Parse(HF_Gen.Value), sbyte.Parse(HF_AMin.Value),
                                sbyte.Parse(HF_AMax.Value), sbyte.Parse(HF_Rel.Value), bool.Parse(HF_ISPhoto.Value), short.Parse(HF_Cst.Value), sbyte.Parse(HF_Criteria.Value), (int.Parse(HF_Start.Value) + 14));
                break;
            case "4":
                strAMatrimonialID = SearchEngine.KeyWordSearch(HF_String.Value, bool.Parse(HF_Gen.Value), (int.Parse(HF_Start.Value) + 14));
                break;
            case "5":
                SQLQuery = Session[HF_String.Value].ToString();
                strAMatrimonialID = SearchEngine.AdvancedSearch(SQLQuery, (int.Parse(HF_Start.Value) + 14));
                break;
            default:
                ErrorLog.WriteLog("Member_SearchResult.LB_Next_Click.HF_Type.Value = " + HF_Type.Value);
                break;
        }


        if ((strAMatrimonialID != null) && (strAMatrimonialID[0] != "0"))
        {
            //Previous Enabled
            LB_Previous_1.Enabled = true;
            LB_Previous_2.Enabled = true;
            //Getting values
            int intStart = int.Parse(HF_Start.Value);
            HF_Start.Value = (intStart + 14).ToString();
            int intCount = int.Parse(strAMatrimonialID[0]);
            int intCurrent;
            intCurrent = intCount - (intStart + 14);
            //Update Start Pointer
            intStart += 14;
            HF_Start.Value = (intStart).ToString();
            if (intCurrent < 14)
            {
                LB_Next_1.Enabled = false;
                LB_Next_2.Enabled = false;
                L_Current_1.Text = (intStart + intCurrent).ToString();
                L_Current_2.Text = (intStart + intCurrent).ToString();
            }
            else
            {
                L_Current_1.Text = (intStart + 14).ToString();
                L_Current_2.Text = (intStart + 14).ToString();
            }
            //Getting SSList

            LoadList(strAMatrimonialID);
        }
        else
        {
            ErrorLog.WriteLog("Guest/SearchResults-LB_Next_Click");
            Response.Redirect("~/Extras/ErrorReport.aspx");
        }
    }

    //Browsing the last 
    protected void LB_Previous_Click(object sender, EventArgs e)
    {
        string[] strAMatrimonialID = null;
        string SQLQuery;
        switch (HF_Type.Value)
        {
            case "1":
                strAMatrimonialID = SearchEngine.Search(SearchEngine.SearchType.Simple, bool.Parse(HF_Gen.Value), sbyte.Parse(HF_AMin.Value),
                                sbyte.Parse(HF_AMax.Value), sbyte.Parse(HF_Rel.Value), bool.Parse(HF_ISPhoto.Value), short.Parse(HF_Cst.Value), 0, (int.Parse(HF_Start.Value) - 14));
                break;
            case "2":
                strAMatrimonialID = SearchEngine.Search(SearchEngine.SearchType.EducationalSearch, bool.Parse(HF_Gen.Value), sbyte.Parse(HF_AMin.Value),
                                sbyte.Parse(HF_AMax.Value), sbyte.Parse(HF_Rel.Value), bool.Parse(HF_ISPhoto.Value), short.Parse(HF_Cst.Value),sbyte.Parse(HF_Criteria.Value), (int.Parse(HF_Start.Value) - 14));
                break;
            case "3":
                strAMatrimonialID = SearchEngine.Search(SearchEngine.SearchType.OccupationSearch, bool.Parse(HF_Gen.Value), sbyte.Parse(HF_AMin.Value),
                                sbyte.Parse(HF_AMax.Value), sbyte.Parse(HF_Rel.Value), bool.Parse(HF_ISPhoto.Value), short.Parse(HF_Cst.Value), sbyte.Parse(HF_Criteria.Value), (int.Parse(HF_Start.Value) - 14));
                break;
            case "4":
                SQLQuery = Session[HF_String.Value].ToString();
                strAMatrimonialID = SearchEngine.KeyWordSearch(SQLQuery, bool.Parse(HF_Gen.Value), (int.Parse(HF_Start.Value) - 14));
                break;
            case "5":
                SQLQuery = Session[HF_String.Value].ToString();
                strAMatrimonialID = SearchEngine.AdvancedSearch(SQLQuery, (int.Parse(HF_Start.Value) - 14));
                break;
            default:
                ErrorLog.WriteLog("Member_SearchResult.LB_Previous_Click.HF_Type.Value = " + HF_Type.Value);
                break;
        }



        if ((strAMatrimonialID != null) && (strAMatrimonialID[0] != "0"))
        {
            LB_Next_1.Enabled = true;
            LB_Next_2.Enabled = true;

            //Getting values
            int intStart = int.Parse(HF_Start.Value);
            HF_Start.Value = (intStart - 14).ToString();
            int intCount = int.Parse(strAMatrimonialID[0]);
            intStart -= 14;
            // End of record?
            if (intStart < 14)
            {
                LB_Previous_1.Enabled = false;
                LB_Previous_2.Enabled = false;
                L_Current_1.Text = "14";
                L_Current_2.Text = "14";

            }
            else
            {
                L_Current_1.Text = (intStart + 14).ToString();
                L_Current_2.Text = (intStart + 14).ToString();

            }
            //Update Start Pointer
            HF_Start.Value = (intStart).ToString();
            //Getting SSList

            LoadList(strAMatrimonialID);
        }
        else
        {
            ErrorLog.WriteLog("Guest/SearchResults-LB_Previous_Click");
            Response.Redirect("~/Extras/ErrorReport.aspx");
        }
    }
    #endregion


    #region "Private Function"
    private void LoadList(string[] MatrimonialID)
    {
        // Index 1
        if (MatrimonialID[1] != null)
        {
            MemberDisplay1.Bind(MatrimonialID[1], true, false);

        }
        else
        {
            MemberDisplay1.Visible = false;
            MemberDisplay2.Visible = false;
            MemberDisplay3.Visible = false;
            MemberDisplay4.Visible = false;
            MemberDisplay5.Visible = false;
            MemberDisplay6.Visible = false;
            MemberDisplay7.Visible = false;
            MemberDisplay8.Visible = false;
            MemberDisplay9.Visible = false;
            MemberDisplay10.Visible = false;
            MemberDisplay11.Visible = false;
            MemberDisplay12.Visible = false;
            MemberDisplay13.Visible = false;
            MemberDisplay14.Visible = false;
            return;
        }
        // Index 2
        if (MatrimonialID[2] != null)
        {
            MemberDisplay2.Bind(MatrimonialID[2], true, false);

        }
        else
        {
            MemberDisplay3.Visible = false;
            MemberDisplay4.Visible = false;
            MemberDisplay5.Visible = false;
            MemberDisplay6.Visible = false;
            MemberDisplay7.Visible = false;
            MemberDisplay8.Visible = false;
            MemberDisplay9.Visible = false;
            MemberDisplay10.Visible = false;
            MemberDisplay11.Visible = false;
            MemberDisplay12.Visible = false;
            MemberDisplay13.Visible = false;
            MemberDisplay14.Visible = false;
            return;
        }
        // Index 3
        if (MatrimonialID[3] != null)
        {
            MemberDisplay3.Bind(MatrimonialID[3], true, false);

        }
        else
        {
            MemberDisplay4.Visible = false;
            MemberDisplay5.Visible = false;
            MemberDisplay6.Visible = false;
            MemberDisplay7.Visible = false;
            MemberDisplay8.Visible = false;
            MemberDisplay9.Visible = false;
            MemberDisplay10.Visible = false;
            MemberDisplay11.Visible = false;
            MemberDisplay12.Visible = false;
            MemberDisplay13.Visible = false;
            MemberDisplay14.Visible = false;
            return;
        }
        // Index 4
        if (MatrimonialID[4] != null)
        {
            MemberDisplay4.Bind(MatrimonialID[4], true, false);

        }
        else
        {
            MemberDisplay4.Visible = false;
            MemberDisplay5.Visible = false;
            MemberDisplay6.Visible = false;
            MemberDisplay7.Visible = false;
            MemberDisplay8.Visible = false;
            MemberDisplay9.Visible = false;
            MemberDisplay10.Visible = false;
            MemberDisplay11.Visible = false;
            MemberDisplay12.Visible = false;
            MemberDisplay13.Visible = false;
            MemberDisplay14.Visible = false;
            return;
        }
        // Index 5
        if (MatrimonialID[5] != null)
        {
            MemberDisplay5.Bind(MatrimonialID[5], true, false);

        }
        else
        {
            MemberDisplay5.Visible = false;
            MemberDisplay6.Visible = false;
            MemberDisplay7.Visible = false;
            MemberDisplay8.Visible = false;
            MemberDisplay9.Visible = false;
            MemberDisplay10.Visible = false;
            MemberDisplay11.Visible = false;
            MemberDisplay12.Visible = false;
            MemberDisplay13.Visible = false;
            MemberDisplay14.Visible = false;
            return;
        }
        // Index 6
        if (MatrimonialID[6] != null)
        {
            MemberDisplay6.Bind(MatrimonialID[6], true, false);

        }
        else
        {
            MemberDisplay6.Visible = false;
            MemberDisplay7.Visible = false;
            MemberDisplay8.Visible = false;
            MemberDisplay9.Visible = false;
            MemberDisplay10.Visible = false;
            MemberDisplay11.Visible = false;
            MemberDisplay12.Visible = false;
            MemberDisplay13.Visible = false;
            MemberDisplay14.Visible = false;
            return;
        }
        // Index 7
        if (MatrimonialID[7] != null)
        {
            MemberDisplay7.Bind(MatrimonialID[7], true, false);

        }
        else
        {
            MemberDisplay7.Visible = false;
            MemberDisplay8.Visible = false;
            MemberDisplay9.Visible = false;
            MemberDisplay10.Visible = false;
            MemberDisplay11.Visible = false;
            MemberDisplay12.Visible = false;
            MemberDisplay13.Visible = false;
            MemberDisplay14.Visible = false;
            return;
        }
        // Index 8
        if (MatrimonialID[8] != null)
        {
            MemberDisplay8.Bind(MatrimonialID[8], true, false);

        }
        else
        {
            MemberDisplay8.Visible = false;
            MemberDisplay9.Visible = false;
            MemberDisplay10.Visible = false;
            MemberDisplay11.Visible = false;
            MemberDisplay12.Visible = false;
            MemberDisplay13.Visible = false;
            MemberDisplay14.Visible = false;
            return;
        }
        // Index 9
        if (MatrimonialID[9] != null)
        {
            MemberDisplay9.Bind(MatrimonialID[9], true, false);

        }
        else
        {
            MemberDisplay9.Visible = false;
            MemberDisplay10.Visible = false;
            MemberDisplay11.Visible = false;
            MemberDisplay12.Visible = false;
            MemberDisplay13.Visible = false;
            MemberDisplay14.Visible = false;
            return;
        }
        // Index 10
        if (MatrimonialID[10] != null)
        {
            MemberDisplay10.Bind(MatrimonialID[10], true, false);

        }
        else
        {
            MemberDisplay10.Visible = false;
            MemberDisplay11.Visible = false;
            MemberDisplay12.Visible = false;
            MemberDisplay13.Visible = false;
            MemberDisplay14.Visible = false;
        }
        // Index 11
        if (MatrimonialID[11] != null)
        {
            MemberDisplay11.Bind(MatrimonialID[11], true, false);

        }
        else
        {
            MemberDisplay11.Visible = false;
            MemberDisplay12.Visible = false;
            MemberDisplay13.Visible = false;
            MemberDisplay14.Visible = false;
        }
        // Index 12
        if (MatrimonialID[12] != null)
        {
            MemberDisplay12.Bind(MatrimonialID[12], true, false);

        }
        else
        {
            MemberDisplay12.Visible = false;
            MemberDisplay13.Visible = false;
            MemberDisplay14.Visible = false;
        }
        // Index 13
        if (MatrimonialID[13] != null)
        {
            MemberDisplay13.Bind(MatrimonialID[13], true, false);

        }
        else
        {
            MemberDisplay13.Visible = false;
            MemberDisplay14.Visible = false;
        }
        // Index 1
        if (MatrimonialID[14] != null)
        {
            MemberDisplay14.Bind(MatrimonialID[14], true, false);

        }
        else
        {
            MemberDisplay14.Visible = false;
        }
    }


    private void Search(SearchEngine.SearchType Type)
    {
        bool boolGender = false;
        sbyte sbyteAgeMax = 30;
        sbyte sbyteAgeMin = 18;
        short shortCaste = 0;
        sbyte sbyteReligion = 0;
        bool boolNeedPhoto = false;

        //Setting SearchFor

        if (Request.QueryString["g"] != null)
        {
            if (Request.QueryString["g"].ToUpper() == "TRUE")
            {
                boolGender = true;
                sbyteAgeMax = 35;
                sbyteAgeMin = 21;
                SerchFor1.SearchingForGender = true;
            }
            else
            {
                SerchFor1.SearchingForGender = false;
            }
        }

        try
        {
            if (Request.QueryString["ai"] != null)
            {
                sbyteAgeMin = sbyte.Parse(Request.QueryString["ai"]);
                SerchFor1.SearchingForAgeMin = Request.QueryString["ai"];
            }
            else
            {
                SerchFor1.SearchingForAgeMin = sbyteAgeMin.ToString();
            }

            if (Request.QueryString["ax"] != null)
            {
                sbyteAgeMax = sbyte.Parse(Request.QueryString["ax"]);
                SerchFor1.SearchingForAgeMax = Request.QueryString["ax"];
            }
            else
            {
                SerchFor1.SearchingForAgeMax = sbyteAgeMax.ToString();
            }

            if (Request.QueryString["c"] != null)
            {
                shortCaste = short.Parse(Request.QueryString["c"]);
                if (shortCaste != 0)
                {
                    SerchFor1.SearchingForCaste = ControlDataLoader.GetIndexValue(ControlDataLoader.ControlType.Cast, shortCaste);
                }
                else
                {
                    SerchFor1.SearchingForCaste = "Any";
                }
            }
            else
            {
                SerchFor1.SearchingForCaste = "Any";
            }


            if (Request.QueryString["r"] != null)
            {
                sbyteReligion = sbyte.Parse(Request.QueryString["r"]);
                if (sbyteReligion != 0)
                {
                    SerchFor1.SearchingForReligion = ControlDataLoader.GetIndexValue(ControlDataLoader.ControlType.Religion, sbyteReligion);
                }
                else
                {
                    SerchFor1.SearchingForReligion = "Any";
                }
            }
            else
            {
                SerchFor1.SearchingForReligion = "Any";
            }



        }
        catch (Exception) { }

        if (Request.QueryString["ph"] != null)
        {
            if (Request.QueryString["ph"].ToUpper() == "TRUE")
            {
                boolNeedPhoto = true;
                SerchFor1.SearchingWithPhoto = true;
            }
            else
            {
                boolNeedPhoto = false;
                SerchFor1.SearchingWithPhoto = false;
            }
        }

        SerchFor1.SearchingDepth = 1;

        // Setting Hiden Feld

        HF_AMax.Value = sbyteAgeMax.ToString();
        HF_AMin.Value = sbyteAgeMin.ToString();
        HF_Cst.Value = shortCaste.ToString();
        HF_Rel.Value = sbyteReligion.ToString();
        HF_ISPhoto.Value = boolNeedPhoto.ToString();
        HF_Gen.Value = boolGender.ToString();


        //Loading Searching
        string[] strAMatrimonialID = null;
        sbyte sbyteCriteria = 0;
        switch (Type)
        {
            case SearchEngine.SearchType.Simple:
                HF_Type.Value = "1";
                strAMatrimonialID = SearchEngine.Search(SearchEngine.SearchType.Simple, boolGender, sbyteAgeMin, sbyteAgeMax, sbyteReligion, boolNeedPhoto, shortCaste, 0, 0);
                break;
            case SearchEngine.SearchType.EducationalSearch:
                if ((Request.QueryString["cri"] != "")||(Request.QueryString["cri"] != null))
                {
                    HF_Criteria.Value = Request.QueryString["cri"];
                    sbyteCriteria = sbyte.Parse(Request.QueryString["cri"]);
                }
                else
                {
                    HF_Criteria.Value = "0";
                }
                HF_Type.Value = "2";
                strAMatrimonialID = SearchEngine.Search(SearchEngine.SearchType.EducationalSearch, boolGender, sbyteAgeMin, sbyteAgeMax, sbyteReligion, boolNeedPhoto, shortCaste, sbyteCriteria, 0);
                break;
            case SearchEngine.SearchType.OccupationSearch:
                if ((Request.QueryString["cri"] != "") || (Request.QueryString["cri"] != null))
                {
                    HF_Criteria.Value = Request.QueryString["cri"];
                    sbyteCriteria = sbyte.Parse(Request.QueryString["cri"]);
                }
                else
                {
                    HF_Criteria.Value = "0";
                }
                HF_Type.Value = "3";
                strAMatrimonialID = SearchEngine.Search(SearchEngine.SearchType.OccupationSearch, boolGender, sbyteAgeMin, sbyteAgeMax, sbyteReligion, boolNeedPhoto, shortCaste, sbyteCriteria, 0);
                break;
            default:
                ErrorLog.WriteLog("Member/Searchresult-Search: Type = " + Type.ToString());
                break;
        }

        if(( strAMatrimonialID == null) || (strAMatrimonialID[0] =="0"))
        {
           Response.Redirect("~/Guest/NoRecordFound.aspx");
        }
        else
        {
            int intResultCount = int.Parse(strAMatrimonialID[0]);

            L_Last_2.Text = intResultCount.ToString();
            L_Last_1.Text = intResultCount.ToString();

            if (intResultCount < 14)
            {
                LB_Next_1.Enabled = false;
                LB_Next_2.Enabled = false;

                L_Current_1.Text = intResultCount.ToString();
                L_Current_2.Text = intResultCount.ToString();
            }
            else
            {
                LB_Next_1.Enabled = true;
                LB_Next_2.Enabled = true;

                L_Current_1.Text = "14";
                L_Current_2.Text = "14";
            }
            HF_Start.Value = "0";
            LoadList(strAMatrimonialID);

        }
    
    }

    private void StringSearch(SearchEngine.SearchType searchType)
    {
        if ((Request.QueryString["str"] != "") || (Request.QueryString["str"] != null))
        {
            string[] strAMatrimonialID = null;
            try
            {
                string SQLQuery = null;
                switch (searchType)
                {
                    case SearchEngine.SearchType.AdvansedSearch:
                        SQLQuery = Session[Request.QueryString["str"]].ToString();
                        strAMatrimonialID = SearchEngine.AdvancedSearch(SQLQuery, 0);
                        HF_String.Value = Request.QueryString["str"];
                        HF_Type.Value = "5";
                        break;
                    case SearchEngine.SearchType.KeyWordSearch:
                         SQLQuery = Session[Request.QueryString["str"]].ToString();
                        bool boolGender = false;
                        if (Request.QueryString["g"].ToUpper() == "TRUE")
                        {
                            boolGender = true;
                            HF_Gen.Value = true.ToString();
                        }
                        else
                        {
                            HF_Gen.Value = false.ToString();
                        }
                        strAMatrimonialID = SearchEngine.KeyWordSearch(SQLQuery, boolGender, 0);
                        HF_String.Value = Session[Request.QueryString["str"]].ToString();
                        HF_Type.Value = "4";
                        break;
                }
            }
            catch (Exception EX)
            {
                ErrorLog.WriteErrorLog("Member-Searchresult-StringSearch", EX);
            }

            if ((strAMatrimonialID == null) || (strAMatrimonialID[0] == "0"))
            {
                Response.Redirect("~/Guest/NoRecordFound.aspx");
            }
            else
            {
                int intResultCount = int.Parse(strAMatrimonialID[0]);

                L_Last_2.Text = intResultCount.ToString();
                L_Last_1.Text = intResultCount.ToString();

                if (intResultCount < 14)
                {
                    LB_Next_1.Enabled = false;
                    LB_Next_2.Enabled = false;

                    L_Current_1.Text = intResultCount.ToString();
                    L_Current_2.Text = intResultCount.ToString();
                }
                else
                {
                    LB_Next_1.Enabled = true;
                    LB_Next_2.Enabled = true;

                    L_Current_1.Text = "14";
                    L_Current_2.Text = "14";
                }
                HF_Start.Value = "0";
                LoadList(strAMatrimonialID);

            }

        }
    }


    #endregion

}
