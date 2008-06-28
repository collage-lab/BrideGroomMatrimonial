using System;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Data.SqlClient;
using System.Data;

public class MatrimonialAlbumManager
{

    public enum ImageType { Photo, Album1, Album2, Album3, Horoscope, SucessStory };

    public static bool DeleteImage(string ApplicationID, MatrimonialAlbumManager.ImageType imageType)
    {
        /* * * * * * * * * * * * * * * * * * * * * * * * * * * * 
        Procedure Name : UserAlbum_DropAlbum
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Type: INSERT  
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Parameters :
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
            @ApplicationID - varchar(25)
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
            @Photo1 image - Null
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *
            @Album1 image - Null
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *
            @Album2 image - Null
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *
            @Album3 image - Null
         * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
            @Horoscope image - Null
         * * * * * * * * * * * * * * * * * * * * * * * * * * * */

        try
        {


            using (SqlConnection objConnection = DBConnection.GetSqlConnection())
            {

                SqlCommand objCommand;
                objCommand = new SqlCommand("UserAlbum_DropAlbum", objConnection);
                objCommand.CommandType = CommandType.StoredProcedure;

                /// Inserting parameters

                objCommand.Parameters.Add(new SqlParameter("@ID", SqlDbType.VarChar));
                objCommand.Parameters["@iD"].Value = ApplicationID;

                switch (imageType)
                {
                    case MatrimonialAlbumManager.ImageType.Album1:

                        //Adding new Parameters
                        objCommand.Parameters.Add(new SqlParameter("@Flag", SqlDbType.TinyInt));
                        objCommand.Parameters["@Flag"].Value = 1;

                        break;
                    case MatrimonialAlbumManager.ImageType.Album2:

                        //Adding new Parameters
                        objCommand.Parameters.Add(new SqlParameter("@Flag", SqlDbType.TinyInt));
                        objCommand.Parameters["@Flag"].Value = 2;

                        break;
                    case MatrimonialAlbumManager.ImageType.Album3:

                        //Adding new Parameters
                        objCommand.Parameters.Add(new SqlParameter("@Flag", SqlDbType.TinyInt));
                        objCommand.Parameters["@Flag"].Value = 3;

                        break;
                    case MatrimonialAlbumManager.ImageType.Photo:

                        //Adding new Parameters
                        objCommand.Parameters.Add(new SqlParameter("@Flag", SqlDbType.TinyInt));
                        objCommand.Parameters["@Flag"].Value = 0;

                        break;
                    case MatrimonialAlbumManager.ImageType.Horoscope:

                        //Adding new Parameters
                        objCommand.Parameters.Add(new SqlParameter("@Flag", SqlDbType.TinyInt));
                        objCommand.Parameters["@Flag"].Value = 4;

                        break;
                    default:
                        objConnection.Close();
                        return false;
                }

                objConnection.Open();
                objCommand.ExecuteNonQuery();
                objConnection.Close();
            }
            return true;
        }
        catch (Exception ex)
        {
            return false;
        }


    }

    public static bool InsertPhoto(string ApplicationID, byte[] Content, MatrimonialAlbumManager.ImageType AlbumNo)
    {
        /* * * * * * * * * * * * * * * * * * * * * * * * * * * * 
        Procedure Name :  UserAlbum_UpdateAlbum
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Type: UPDATE  
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Parameters :
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
            @ApplicationID - varchar(25)
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
            @Photo1 image - Null
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *
            @Album1 image - Null
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *
            @Album2 image - Null
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *
            @Album3 image - Null
         * * * * * * * * * * * * * * * * * * * * * * * * * * * */

        try
        {


            using (SqlConnection objConnection = DBConnection.GetSqlConnection())
            {

                SqlCommand objCommand;

                objCommand = new SqlCommand("UserAlbum_UpdateAlbum", objConnection);
                objCommand.CommandType = CommandType.StoredProcedure;

                /// Inserting parameters

                objCommand.Parameters.Add(new SqlParameter("@ID", SqlDbType.VarChar));
                objCommand.Parameters["@ID"].Value = ApplicationID;

                objCommand.Parameters.Add(new SqlParameter("@AlbumImage", SqlDbType.Image));
                objCommand.Parameters["@AlbumImage"].Value = Content;

                switch (AlbumNo)
                {
                    case MatrimonialAlbumManager.ImageType.Album1:


                        /// Inserting parameters

                        objCommand.Parameters.Add(new SqlParameter("@Flag", SqlDbType.TinyInt));
                        objCommand.Parameters["@Flag"].Value = 1;

                        break;
                    case MatrimonialAlbumManager.ImageType.Album2:
                        /// Inserting parameters

                        objCommand.Parameters.Add(new SqlParameter("@Flag", SqlDbType.TinyInt));
                        objCommand.Parameters["@Flag"].Value = 2;

                        break;
                    case MatrimonialAlbumManager.ImageType.Album3:

                        /// Inserting parameters

                        objCommand.Parameters.Add(new SqlParameter("@Flag", SqlDbType.TinyInt));
                        objCommand.Parameters["@Flag"].Value = 3;

                        break;
                    case MatrimonialAlbumManager.ImageType.Photo:

                        /// Inserting parameters

                        objCommand.Parameters.Add(new SqlParameter("@Flag", SqlDbType.TinyInt));
                        objCommand.Parameters["@Flag"].Value = 0;

                        break;
                    case MatrimonialAlbumManager.ImageType.Horoscope:

                        /// Inserting parameters

                        objCommand.Parameters.Add(new SqlParameter("@Flag", SqlDbType.TinyInt));
                        objCommand.Parameters["@Flag"].Value = 4;


                        break;
                    default:
                        objConnection.Close();
                        return false;

                }

                objConnection.Open();
                objCommand.ExecuteNonQuery();

                objConnection.Close();
            }
            return true;
        }
        catch (Exception ex)
        {
            return false;
        }

    }

    public static bool RemoveAlbumPassword(string ApplicationID, MatrimonialAlbumManager.ImageType imageType)
    {

        /* * * * * * * * * * * * * * * * * * * * * * * * * * * * 
        Procedure Name : UserAlbum_SetHoroscopePassword
                       : UserAlbum_SetPhotoPassword
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Type: UPDATE  
         * * * * * * * * * * * * * * * * * * * * * * * * * * * */


        using (SqlConnection objConnection = DBConnection.GetSqlConnection())
        {
            try
            {
                //Inserting data into

                //Creating Command object
                SqlCommand objCommand = new SqlCommand("UserAlbum_SetPhotoPassword", objConnection);
                objCommand.CommandType = CommandType.StoredProcedure;
                //Adding new Parameters
                if (imageType == MatrimonialAlbumManager.ImageType.Horoscope)
                {
                    objCommand = new SqlCommand("UserAlbum_SetHoroscopePassword", objConnection);
                    objCommand.CommandType = CommandType.StoredProcedure;
                }

                objCommand.Parameters.Add(new SqlParameter("@ApplicationID", SqlDbType.VarChar));
                objCommand.Parameters["@ApplicationID"].Value = ApplicationID;

                objConnection.Open();
                int intTemp = objCommand.ExecuteNonQuery();
                objConnection.Close();
                return true;
            }
            catch (Exception)
            {
                objConnection.Close();
                return false;
            }

        }

    }

    public static bool SetAlbumPassword(string ApplicationID, string Password, MatrimonialAlbumManager.ImageType imageType)
    {
        /* * * * * * * * * * * * * * * * * * * * * * * * * * * * 
        Procedure Name : UserAlbum_SetHoroscopePassword
                       : UserAlbum_SetPhotoPassword
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Type: UPDATE  
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Parameters :
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
                         @ApplicationID - varchar(25)
                         @HoroPassword - varchar(25)
                         @PhotoPassword - varchar(25)
         * * * * * * * * * * * * * * * * * * * * * * * * * * * */


        using (SqlConnection objConnection = DBConnection.GetSqlConnection())
        {
            try
            {
                //Inserting data into

                //Creating Command object
                SqlCommand objCommand = new SqlCommand("UserAlbum_SetPhotoPassword", objConnection);
                objCommand.CommandType = CommandType.StoredProcedure;
                //Adding new Parameters
                if (imageType == MatrimonialAlbumManager.ImageType.Horoscope)
                {
                    objCommand = new SqlCommand("UserAlbum_SetHoroscopePassword", objConnection);
                    objCommand.CommandType = CommandType.StoredProcedure;

                }
                objCommand.Parameters.Add(new SqlParameter("@Password", SqlDbType.VarChar));
                objCommand.Parameters["@Password"].Value = Password;

                objCommand.Parameters.Add(new SqlParameter("@ApplicationID", SqlDbType.VarChar));
                objCommand.Parameters["@ApplicationID"].Value = ApplicationID;



                objConnection.Open();
                int intTemp = objCommand.ExecuteNonQuery();
                objConnection.Close();
                return true;
            }
            catch (Exception)
            {
                objConnection.Close();
                return false;
            }

        }

    }

    public static bool IsAlbumExists(string ApplicationID)
    {
        /* * * * * * * * * * * * * * * * * * * * * * * * * * * * 
        Procedure Name : UserAlbum_IsAlbum
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Type: SELECT 
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Parameters :
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
                    @ApplicationID varchar(25)
         * * * * * * * * * * * * * * * * * * * * * * * * * * * */

        using (SqlConnection objConnection = DBConnection.GetSqlConnection())
        {
            try
            {
                //Creating Command object
                SqlCommand objCommand = new SqlCommand("UserAlbum_IsAlbum", objConnection);
                objCommand.CommandType = CommandType.StoredProcedure;
                //Adding new Parameters
                objCommand.Parameters.Add(new SqlParameter("@ID", SqlDbType.VarChar));
                objCommand.Parameters["@ID"].Value = ApplicationID;

                objConnection.Open();
                SqlDataReader objReader = objCommand.ExecuteReader();
                objReader.Read();
                bool boolRerurn = Convert.ToBoolean(objReader["Flag"]);
                objReader.Close();
                objConnection.Close();
                return boolRerurn ;
            }
            catch (Exception)
            {
                objConnection.Close();
                return false;
            }

        }
    }

    public static byte[] GetImage(string ID, MatrimonialAlbumManager.ImageType imageType)
    {
        /* * * * * * * * * * * * * * * * * * * * * * * * * * * * 
        Procedure Name : UserAlbum_GetAlbum
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Type: SELECT 
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Parameters :
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
                    @ID varchar(25)
         *          @Flag TinyInt
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
                         Photo
                         Album1
                         Album2
                         Album3
                         Horoscope
                         SucessStory
         * * * * * * * * * * * * * * * * * * * * * * * * * * * */




        byte[] byteImageArray;



        using (SqlConnection objConnection = DBConnection.GetSqlConnection())
        {

            try
            {
                SqlCommand objCommand;
                SqlDataReader objReader;

                //Creating Command object
                objCommand = new SqlCommand("UserAlbum_GetAlbum", objConnection);
                objCommand.CommandType = CommandType.StoredProcedure;
                //Adding new Parameters
                objCommand.Parameters.Add(new SqlParameter("@ID", SqlDbType.VarChar));
                objCommand.Parameters["@ID"].Value = ID;

                // Selecting Which Image Needed

                switch (imageType)
                {
                    //Flag = 0
                    case MatrimonialAlbumManager.ImageType.Photo:

                        //Adding new Parameters
                        objCommand.Parameters.Add(new SqlParameter("@Flag", SqlDbType.TinyInt));
                        objCommand.Parameters["@Flag"].Value = 0;

                        break;
                    case MatrimonialAlbumManager.ImageType.Album1:

                        //Adding new Parameters
                        objCommand.Parameters.Add(new SqlParameter("@Flag", SqlDbType.TinyInt));
                        objCommand.Parameters["@Flag"].Value = 1;

                        break;
                    case MatrimonialAlbumManager.ImageType.Album2:
                        //Adding new Parameters
                        objCommand.Parameters.Add(new SqlParameter("@Flag", SqlDbType.TinyInt));
                        objCommand.Parameters["@Flag"].Value = 2;

                        break;
                    case MatrimonialAlbumManager.ImageType.Album3:

                        //Adding new Parameters
                        objCommand.Parameters.Add(new SqlParameter("@Flag", SqlDbType.TinyInt));
                        objCommand.Parameters["@Flag"].Value = 3;


                        break;
                    case MatrimonialAlbumManager.ImageType.Horoscope:

                        //Adding new Parameters
                        objCommand.Parameters.Add(new SqlParameter("@Flag", SqlDbType.TinyInt));
                        objCommand.Parameters["@Flag"].Value = 4;


                        break;
                    case MatrimonialAlbumManager.ImageType.SucessStory:

                        //Adding new Parameters
                        objCommand.Parameters.Add(new SqlParameter("@Flag", SqlDbType.TinyInt));
                        objCommand.Parameters["@Flag"].Value = 5;

                        break;
                    default:
                        byteImageArray = null;
                        break;
                }

                objConnection.Open();
                objReader = objCommand.ExecuteReader();
                objReader.Read();

                byteImageArray = (byte[])objReader["AlumImage"];

                objReader = null;
                objConnection.Close();
            }
            catch (Exception)
            {
                objConnection.Close();
                byteImageArray = null;
            }

        }
        return byteImageArray;
    }

    public static bool IsImageProtected(string ApplicationID, MatrimonialAlbumManager.ImageType imageType)
    {


        /* * * * * * * * * * * * * * * * * * * * * * * * * * * * 
        Procedure Name : UserAlbum_IsPasswordProtected
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Type: SELECT 
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Parameters :
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
                    @ApplicationID varchar(25)
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
                         HoroPassword
                         PhotoPassword
         * * * * * * * * * * * * * * * * * * * * * * * * * * * */


        bool boolPassword = false;
        using (SqlConnection objConnection = DBConnection.GetSqlConnection())
        {

            try
            {
                SqlCommand objCommand = new SqlCommand("UserAlbum_IsPasswordProtected", objConnection);
                objCommand.CommandType = CommandType.StoredProcedure;

                objCommand.Parameters.Add(new SqlParameter("@ApplicationID", SqlDbType.VarChar));
                objCommand.Parameters["@ApplicationID"].Value = ApplicationID;

                SqlDataReader objReader;
                switch (imageType)
                {
                    case MatrimonialAlbumManager.ImageType.Photo:

                        objConnection.Open();
                        objReader = objCommand.ExecuteReader();
                        objReader.Read();
                        boolPassword = Convert.ToBoolean(objReader["PhotoPassword"]);
                        break;
                    case MatrimonialAlbumManager.ImageType.Album1:

                        //Creating Command object
                        objConnection.Open();
                        objReader = objCommand.ExecuteReader();
                        objReader.Read();
                        boolPassword = Convert.ToBoolean(objReader["PhotoPassword"]);
                        break;
                    case MatrimonialAlbumManager.ImageType.Album2:

                        objConnection.Open();
                        objReader = objCommand.ExecuteReader();
                        objReader.Read();
                        boolPassword = Convert.ToBoolean(objReader["PhotoPassword"]);
                        break;
                    case MatrimonialAlbumManager.ImageType.Album3:

                        objConnection.Open();
                        objReader = objCommand.ExecuteReader();
                        objReader.Read();
                        boolPassword = Convert.ToBoolean(objReader["PhotoPassword"]);
                        break;
                    case MatrimonialAlbumManager.ImageType.Horoscope:

                        objConnection.Open();
                        objReader = objCommand.ExecuteReader();
                        objReader.Read();
                        boolPassword = Convert.ToBoolean(objReader["HoroPassword"]);
                        break;
                    default:
                        return false;
                }

                objReader = null;
                objConnection.Close();
            }
            catch (Exception)
            {
                objConnection.Close();
            }
            return boolPassword;
        }
    }

    public static bool IsImageExists(string ApplicationID, MatrimonialAlbumManager.ImageType imageType)
    {


        /* * * * * * * * * * * * * * * * * * * * * * * * * * * * 
    Procedure Name : UserAlbum_IsImageExists
     * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
    Type: SELECT 
     * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
    Parameters :
     * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
                @ApplicationID varchar(25)
         *      @Flag Tinyint
     * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
                Flag bit
     * * * * * * * * * * * * * * * * * * * * * * * * * * * */



        using (SqlConnection objConnection = DBConnection.GetSqlConnection())
        {

            try
            {
                SqlCommand objCommand;
                SqlDataReader objReader;

                objCommand = new SqlCommand("UserAlbum_IsImageExists", objConnection);
                objCommand.CommandType = CommandType.StoredProcedure;
                //Adding new Parameters
                objCommand.Parameters.Add(new SqlParameter("@ID", SqlDbType.VarChar));
                objCommand.Parameters["@ID"].Value = ApplicationID;


                switch (imageType)
                {
                    case MatrimonialAlbumManager.ImageType.Photo:

                        //Adding new Parameters
                        objCommand.Parameters.Add(new SqlParameter("@Flag", SqlDbType.TinyInt));
                        objCommand.Parameters["@Flag"].Value = 0;

                        break;
                    case MatrimonialAlbumManager.ImageType.Album1:

                        //Adding new Parameters
                        objCommand.Parameters.Add(new SqlParameter("@Flag", SqlDbType.TinyInt));
                        objCommand.Parameters["@Flag"].Value = 1;

                        break;

                    case MatrimonialAlbumManager.ImageType.Album2:

                        objCommand.Parameters.Add(new SqlParameter("@Flag", SqlDbType.TinyInt));
                        objCommand.Parameters["@Flag"].Value = 2;

                        break;
                    case MatrimonialAlbumManager.ImageType.Album3:

                        objCommand.Parameters.Add(new SqlParameter("@Flag", SqlDbType.TinyInt));
                        objCommand.Parameters["@Flag"].Value = 3;


                        break;
                    case MatrimonialAlbumManager.ImageType.Horoscope:
                        objCommand.Parameters.Add(new SqlParameter("@Flag", SqlDbType.TinyInt));
                        objCommand.Parameters["@Flag"].Value = 4;

                        break;
                    default:
                        return false;
                }

                objConnection.Open();
                objReader = objCommand.ExecuteReader();
                objReader.Read();

                bool boolreturn = Convert.ToBoolean(objReader["Flag"]);

                objReader = null;
                objConnection.Close();
                return boolreturn;
            }
            catch (Exception)
            {
                objConnection.Close();
                return false;
            }


        }
    }

    public static byte[] GetProtectedImage(string ToID, string FromID, MatrimonialAlbumManager.ImageType imageType)
    {

        /* * * * * * * * * * * * * * * * * * * * * * * * * * * * 
        Procedure Name : UserAlbum_GetProtectedImage
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Type: SELECT 
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Parameters :
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
                    @FromID varchar(15)
                    @ToID varchar(15)
                    @Type  smallint
         * * * * * * * * * * * * * * * * * * * * * * * * * * * */



        byte[] byteImageArray = null;



        using (SqlConnection objConnection = DBConnection.GetSqlConnection())
        {

            try
            {
                SqlCommand objCommand;
                SqlDataReader objReader;

                //Creating Command object
                objCommand = new SqlCommand("UserAlbum_GetProtectedImage", objConnection);
                objCommand.CommandType = CommandType.StoredProcedure;
                //Adding new Parameters
                objCommand.Parameters.Add(new SqlParameter("@FromID", SqlDbType.VarChar));
                objCommand.Parameters["@FromID"].Value = FromID;
                //Adding new Parameters
                objCommand.Parameters.Add(new SqlParameter("@ToID", SqlDbType.VarChar));
                objCommand.Parameters["@ToID"].Value = ToID;

                switch (imageType)
                {
                    case MatrimonialAlbumManager.ImageType.Photo:
                        //Adding new Parameters
                        objCommand.Parameters.Add(new SqlParameter("@Type", SqlDbType.TinyInt));
                        objCommand.Parameters["@Type"].Value = 1;
                        break;
                    case MatrimonialAlbumManager.ImageType.Album1:
                        //Adding new Parameters
                        objCommand.Parameters.Add(new SqlParameter("@Type", SqlDbType.TinyInt));
                        objCommand.Parameters["@Type"].Value = 2;
                        break;
                    case MatrimonialAlbumManager.ImageType.Album2:
                        //Adding new Parameters
                        objCommand.Parameters.Add(new SqlParameter("@Type", SqlDbType.TinyInt));
                        objCommand.Parameters["@Type"].Value = 3;
                        break;
                    case MatrimonialAlbumManager.ImageType.Album3:
                        //Adding new Parameters
                        objCommand.Parameters.Add(new SqlParameter("@Type", SqlDbType.TinyInt));
                        objCommand.Parameters["@Type"].Value = 4;
                        break;
                    case MatrimonialAlbumManager.ImageType.Horoscope:
                        //Adding new Parameters
                        objCommand.Parameters.Add(new SqlParameter("@Type", SqlDbType.TinyInt));
                        objCommand.Parameters["@Type"].Value = 5;
                        break;
                    default: throw new Exception("Image type not found");
                }
                objConnection.Open();
                objReader = objCommand.ExecuteReader();
                objReader.Read();
                byteImageArray = (byte[])objReader["IMAGE"];
                objReader.Close();

                objReader = null;
                objConnection.Close();
            }
            catch (Exception EX)
            {
                ErrorLog.WriteErrorLog("GetData- GetProtectedImage- From:" + FromID + " To :" + ToID, EX);
                objConnection.Close();
                byteImageArray = null;
            }

        }
        return byteImageArray;

    }

    
}
